----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Design Name:     AVR-Processor
-- Module Name:     AVRControl - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Reads instructions on clock edges and specifies
--                    - which registers to read
--                    - immediate value (and whether or not to use it)
--                    - which status flags should be changed
--                    - which register to write to (if any)
--                    - which ALU block is used (F, Shift, Add, Mul)
--                    - which operation the block should run
--                    - step of instruction (if two clocks)
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------

-- bring in necessary libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

-- Entity that controls the registers and ALU
entity AVRControl is
    port (
        clock                   : in  std_logic;                    -- system clock
        IR                      : in  opcode_word;                  -- instruction register
        ProgDB                  : in  std_logic_vector(15 downto 0);-- immediate memory address
        MemRegAddr              : in  std_logic_vector(15 downto 0);-- register-based indirect memory access

        ALUStatusMask           : out std_logic_vector(7 downto 0); -- status bits that can be changed
        ALUStatusBitChangeEn    : out std_logic;                    -- instruction to change status
        ALUBitClrSet            : out std_logic;                    -- set the selected bit
        ALUBitTOp               : out std_logic;                    -- instruction to change flag T
        ALUOp2Sel               : out std_logic;                    -- second argument is register/immediate
        ImmediateOut            : out std_logic_vector(7 downto 0); -- value of immediate
        ALUBlockSel             : out std_logic_vector(1 downto 0); -- which ALU block is used
        ALUBlockInstructionSel  : out std_logic_vector(3 downto 0); -- which instruction for ALU block
        
        EnableIn                : out std_logic;                    -- whether or not to write to register
        SelIn                   : out std_logic_vector(6 downto 0); -- register to write to
        SelA                    : out std_logic_vector(6 downto 0); -- first register to read
        SelB                    : out std_logic_vector(6 downto 0); -- second register to read
        
        DataIOSel               : out std_logic;                    -- selects whether data is input or output
        AddrOffset              : out std_logic_vector(15 downto 0);-- offset of address
        SpecAddr                : out std_logic_vector(1 downto 0); -- selects X, Y, Z, or SP
        SpecWr                  : out std_logic;                    -- whether to write to the special addresses
                                                                    -- (this is independent of the normal write to registers)
        OutRd                   : out std_logic;                    -- whether to read from memory
        OutWr                   : out std_logic;                    -- whether to write to memory
        RegDataInSel            : out std_logic_vector(1 downto 0); -- selects which input goes to register in
        MemAddr                 : out std_logic_vector(15 downto 0);-- memory address (16 bits)
        
        DataOutSel              : out std_logic;                    -- selects whether to output to DataDB from the registers or control
        CtrlDataOut             : out std_logic_vector(7 downto 0); -- control data to output to DataDB
        CtrlDataIn              : in  std_logic_vector(7 downto 0); -- control data input from DataDB
        RegAIn                  : in  std_logic_vector(7 downto 0); -- input from registers output (for skip instructions)
        SpecRegIn               : in  std_logic_vector(15 downto 0);-- input from the special registers
        
        StatusReg               : in  std_logic_vector(7 downto 0); -- status flags; used for conditional branching
        UnofficialZeroFlag      : in  std_logic;                    -- zero status flag (before being masked)
        
        NextPC                  : in  std_logic_vector(15 downto 0);-- value of the next PC (after adding the offset)
        NewPC                   : out std_logic_vector(15 downto 0);-- control register-set PC value
        PCOffset                : out std_logic_vector(11 downto 0);-- signed offset to add to PC
        PCUUpdateSel            : out std_logic_vector( 1 downto 0);-- selects which input source to use to update PC
        newIns                  : out std_logic                     -- signal to latch the instruction register output
    );
end AVRControl;

architecture DataFlow of AVRControl is
    signal CycleCount  : std_logic_vector(1 downto 0) := "00"; -- which clock of instruction (for multi-clock instructions)
    signal MemRegAddrM : std_logic := '0'; -- '1' when address outputs to memory; '0' when it outputs to the registers / IO
    signal ProgDBM     : std_logic := '0'; -- '1' when address outputs to memory; '0' when it outputs to the registers / IO
    
    signal RegAddr     : std_logic_vector(6 downto 0)  := "0000000";            -- stores the first cycle of memory for registers to use
    signal MemAStore   : std_logic_vector(15 downto 0) := "0000000000000000";   -- stores the first cycle value of MemRegAddr
    signal ProgStore   : std_logic_vector(15 downto 0) := "0000000000000000";   -- stores the second cycle value of ProgDB
    
    signal oneWordNext : std_logic;                     -- stores number of words of following instruction
    signal CallRetStore: std_logic_vector(15 downto 0); -- temporary storage for the program counter when CALLing/RETurning
begin
    -- latches the memory input
    MemAStore   <= MemRegAddr when (CycleCount = "00") and (clock = '0') else MemAStore;
    -- determines whether registers (0) or memory (1)
    MemRegAddrM <= '0' when (CycleCount = "00") and (to_integer(unsigned(MemAStore)) <= 95) else
                   '1' when CycleCount = "00" else
                   MemRegAddrM;
    -- latches the ProgDB input
    ProgStore   <= ProgDB when (CycleCount = "01") and (std_match(IR, OpLDS) or std_match(IR, OpSTS)) and (clock = '0') else ProgStore;
    -- determines whether registers (0) or memory (1)
    ProgDBM     <= '0' when (to_integer(unsigned(ProgStore)) <= 95) else '1';
    -- output address based on instruction
    RegAddr     <= ProgStore(6 downto 0) when (std_match(IR, OpLDS) or std_match(IR, OpSTS)) else MemAStore(6 downto 0);
    -- output address based on instruction
    MemAddr     <= ProgStore when (std_match(IR, OpLDS) or std_match(IR, OpSTS)) else MemAStore;
    
    -- latches number of words of next instruction
    oneWordNext <= '0' when (std_match(ProgDB, OpLDS) or std_match(ProgDB, OpSTS) or
                             std_match(ProgDB, OpJMP) or std_match(ProgDB, OpCALL)) and (CycleCount = "00") else
                   '1' when CycleCount = "00" else
                   oneWordNext;

    -- Decode new instructions on clock edge
    DecodeInstruction: process (IR, CycleCount, MemRegAddr, ProgDB, MemRegAddrM)
    begin
        ALUOp2Sel <= RegOp2;                    -- default second operand is from register
        EnableIn  <= '1';                       -- enable write to register by default
        SelA  <= "00" & IR(8 downto 4);         -- bits specifying first register
        SelB  <= "00" & IR(9) & IR(3 downto 0); -- bits specifying second register
        SelIn <= "00" & IR(8 downto 4);         -- normally write to first register
        SpecWr       <= '0';                    -- default don't write to the special registers
        RegDataInSel <= "00";                   -- default input from ALUResult
        
        DataIOSel    <= '0';                    -- default input mode for data (leave DB high-Z)
        DataOutSel   <= '0';                    -- default data out from registers
        AddrOffset   <= std_logic_vector(to_unsigned(0,16));    -- default address offset is 0
        ImmediateOut <= IR(11 downto 8) & IR(3 downto 0);       -- normal immediate value
        CtrlDataOut  <= CallRetStore(7 downto 0)-- default low byte of call/ret address
        
        OutRd        <= '1';                    -- default off (active low)
        OutWr        <= '1';                    -- default off (active low)
        
        NewPC        <= CallRetStore;           -- default PC is set to the return value
        PCOffset     <= "000000000001";         -- default to normal PC increment
        PCUpdateSel  <= "00";                   -- default to update PC by adding offset

        ALUBitClrSet <= StatusBitClear;         -- arbitrary value (changed in cases where needed)
        ALUStatusBitChangeEn <= '0';            -- by default, do not change status bits
        ALUBitTOp <= '0';                       -- by default, do not change flag T

        if std_match(IR, OpADC   ) then -- add with carry
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits may be changed
            ALUBlockSel <= ALUAddBlock;        -- specify add block used
            ALUBlockInstructionSel <= AddBlockAddCarry; -- specify add with carry instruction
        end if;

        if std_match(IR, OpADD   ) then -- add
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits may be changed
            ALUBlockSel <= ALUAddBlock;        -- specify add block used
            ALUBlockInstructionSel <= AddBlockAdd; -- specify add instruction
        end if;

        if std_match(IR, OpADIW  ) then -- add immediate to work
            ALUStatusMask <= flag_mask_ZCNVS; -- specify which bits may be changed
            ALUOp2Sel <= ImmedOp2;            -- specify immediate value used
            ALUBlockSel <= ALUAddBlock;       -- specify add block used
            ImmediateOut(7 downto 6) <= "00"; -- top 2 immediate bits are forced 0

            if (CycleCount(0) = '0') then -- first clock of 2
                ALUBlockInstructionSel <= AddBlockAdd;
                -- select the first register of the two
                if (IR(5 downto 4) = "00") then
                    SelA <= std_logic_vector(to_unsigned(24, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(24, SelIn'length));
                end if;
                if (IR(5 downto 4) = "01") then
                    SelA <= std_logic_vector(to_unsigned(26, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(26, SelIn'length));
                end if;
                if (IR(5 downto 4) = "10") then
                    SelA <= std_logic_vector(to_unsigned(28, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(28, SelIn'length));
                end if;
                if (IR(5 downto 4) = "11") then
                    SelA <= std_logic_vector(to_unsigned(30, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(30, SelIn'length));
                end if;
            end if;
            if (CycleCount(0) = '1') then -- second clock of 2
                ALUBlockInstructionSel <= AddBlockAddCarry; -- only process the remaining carry
                ImmediateOut <= "00000000"; -- nothing new added
                -- select the second register of the two
                if (IR(5 downto 4) = "00") then
                    SelA <= std_logic_vector(to_unsigned(25, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(25, SelIn'length));
                end if;
                if (IR(5 downto 4) = "01") then
                    SelA <= std_logic_vector(to_unsigned(27, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(27, SelIn'length));
                end if;
                if (IR(5 downto 4) = "10") then
                    SelA <= std_logic_vector(to_unsigned(29, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(29, SelIn'length));
                end if;
                if (IR(5 downto 4) = "11") then
                    SelA <= std_logic_vector(to_unsigned(31, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(31, SelIn'length));
                end if;
            end if;
        end if;

        if std_match(IR, OpAND   ) then -- and
            ALUStatusMask <= flag_mask_ZNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUFBlock; -- specify f block used
            ALUBlockInstructionSel <= FBlockAND; -- specify and instruction
        end if;

        if std_match(IR, OpANDI  ) then
            ALUOp2Sel <= ImmedOp2; -- specify immediate used
            ALUStatusMask <= flag_mask_ZNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUFBlock; -- specify f block used
            SelA(4)  <= '1'; -- only upper set of registers used
            SelIn(4) <= '1'; -- only upper set of registers used
            ALUBlockInstructionSel <= FBlockAND; -- specify and instruction
        end if;

        if std_match(IR, OpASR   ) then -- arithmetic shift right
            ALUStatusMask <= flag_mask_ZCNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUShiftBlock; -- specify shift block used
            ALUBlockInstructionSel <= ShiftBlockArith; -- specify arithmetic shift instruction
        end if;

        if std_match(IR, OpBCLR  ) then -- bit clear
            --OR operand 1 with zero to pass through to flag logic
            ALUBlockSel <= ALUFBlock; -- specify f block used
            ALUBlockInstructionSel <= FBlockOR; -- specify or used
            ImmediateOut <= "00000000"; -- or with zero
            ALUOp2Sel <= ImmedOp2; -- specify immediate value used

            --only enable changing of bit s (IR[6:4]) of status register
            ALUStatusMask <= "00000000"; -- clear everything except selected bit
            ALUStatusMask(conv_integer(IR(6 downto 4))) <= '1';
            ALUBitClrSet <= StatusBitClear; -- clearing this bit
            EnableIn <= '0'; -- do not write

            ALUStatusBitChangeEn <= '1'; -- manually changing status register bit

        end if;

        if std_match(IR, OpBLD   ) then
            --OR operand 1 with zero to pass through to flag logic
            ALUBlockSel <= ALUFBlock; -- specify f block used
            ALUBlockInstructionSel <= FBlockOR; -- specify or used
            ImmediateOut <= "00000000"; -- or with zero
            ALUOp2Sel <= ImmedOp2; -- specify immediate value used

            --status mask now means which bit of operand 1 we're changing
            --only enable changing of bit b (IR[2:0])
            ALUStatusMask <= "00000000"; -- clear everything except selected bit
            ALUStatusMask(conv_integer(IR(2 downto 0))) <= '1';
            ALUBitTOp <= '1'; -- performing operation with T status bit
        end if;

        if std_match(IR, OpBSET  ) then
            --OR operand 1 with zero to pass through to flag logic
            ALUBlockSel <= ALUFBlock; -- specify f block used
            ALUBlockInstructionSel <= FBlockOR; -- specify or used
            ImmediateOut <= "00000000"; -- or with zero
            ALUOp2Sel <= ImmedOp2; -- specify immediate value used

            --only enable changing of bit s (IR[6:4]) of status register
            ALUStatusMask <= "00000000"; -- clear everything except selected bit
            ALUStatusMask(conv_integer(IR(6 downto 4))) <= '1';
            ALUBitClrSet <= StatusBitSet; -- setting this bit
            EnableIn <= '0'; -- do not write

            ALUStatusBitChangeEn <= '1'; -- manually changing status register bit
        end if;

        if std_match(IR, OpBST   ) then
            EnableIn <= '0'; -- do not write

            --OR operand 1 with zero to pass through to flag logic
            ALUBlockSel <= ALUFBlock; -- specify f block used
            ALUBlockInstructionSel <= FBlockOR; -- specify or used
            ImmediateOut <= "00000000"; -- or with zero
            ALUOp2Sel <= ImmedOp2; -- specify immediate value used

            --status mask now means which bit of operand 1 we're changing
            --only enable changing of bit b (IR[2:0])
            ALUStatusMask <= "00000000"; -- clear everything except selected bit
            ALUStatusMask(conv_integer(IR(2 downto 0))) <= '1';

            ALUStatusBitChangeEn <= '1'; -- manually changing status register bit
            ALUBitTOp <= '1'; -- performing operation with T status bit
        end if;

        if std_match(IR, OpCOM   ) then -- complement (not)
            ALUStatusMask <= flag_mask_ZCNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUFBlock; -- specify f block used
            ALUBlockInstructionSel <= FBlockNOTA; -- specify not instruction
        end if;

        if std_match(IR, OpCP    ) then -- compare
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits can be changed
            ALUBlockSel <= ALUAddBlock; -- specify add block used
            EnableIn <= '0'; -- do not write
            ALUBlockInstructionSel <= AddBlockSub; -- specify subtract instruction
        end if;

        if std_match(IR, OpCPC   ) then -- compare with carry
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits can be changed
            ALUBlockSel <= ALUAddBlock; -- specify add block used
            EnableIn <= '0'; -- do not write
            ALUBlockInstructionSel <= AddBlockSubCarry; -- specify subtract with carry instruction
        end if;

        if std_match(IR, OpCPI   ) then -- compare with immediate
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits can be changed
            ALUOp2Sel <= ImmedOp2; -- immediate value used
            ALUBlockSel <= ALUAddBlock; -- specify add block used
            EnableIn <= '0'; -- do not write
            SelA(4)  <= '1'; -- only upper registers can be used
            SelIn(4) <= '1'; -- only upper registers can be used
            ALUBlockInstructionSel <= AddBlockSub; -- specify subtract instruction
        end if;

        if std_match(IR, OpDEC   ) then -- specify decrement
            ALUStatusMask <= flag_mask_ZNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUAddBlock; -- specify add block
            ALUBlockInstructionSel <= AddBlockSub; -- specify subtract instruction
            ALUOp2Sel <= ImmedOp2; -- specify immediate term used
            ImmediateOut <= "00000001"; -- subtract 1
        end if;

        if std_match(IR, OpEOR   ) then -- Exclusive or
            ALUStatusMask <= flag_mask_ZNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUFBlock; -- specify F block
            ALUBlockInstructionSel <= FBlockXOR; -- specify XOR instruction
        end if;

        if std_match(IR, OpINC   ) then -- increment
            ALUStatusMask <= flag_mask_ZNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUAddBlock; -- specify add block used
            ALUBlockInstructionSel <= AddBlockAdd; -- specify add instruction
            ALUOp2Sel <= ImmedOp2; -- specify immediate value used
            ImmediateOut <= "00000001"; -- add 1
        end if;

        if std_match(IR, OpLSR   ) then -- logical shift right
            ALUStatusMask <= flag_mask_ZCNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUShiftBlock; -- specify shift block
            ALUBlockInstructionSel <= ShiftBlockLog; -- spefify logical shift instruction
        end if;

        if std_match(IR, OpMUL   ) then -- multiply
            ALUStatusMask <= flag_mask_ZC; -- specify which bits can be changed
            ALUBlockSel <= ALUMulBlock; -- specify multiply block
            if (CycleCount(0) = '0') then -- first cycle
                ALUBlockInstructionSel <= MulBlockLowByte;
                SelIn <= "0000000"; -- write to register 0
            end if;
            if (CycleCount(0) = '1') then -- second cycle
                ALUBlockInstructionSel <= MulBlockHighByte;
                SelIn <= "0000001"; -- write to register 1
            end if;
        end if;

        if std_match(IR, OpNEG   ) then -- negate
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits can be changed
            ALUBlockSel <= ALUAddBlock; -- specify add block
            ALUBlockInstructionSel <= AddBlockNeg; -- specify negate instruction
        end if;

        if std_match(IR, OpOR    ) then -- or
            ALUStatusMask <= flag_mask_ZNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUFBlock; -- specify f block
            ALUBlockInstructionSel <= FBlockOR; -- specify or instruction
        end if;

        if std_match(IR, OpORI   ) then -- or with immediate
            ALUStatusMask <= flag_mask_ZNVS; -- specify which bits can be changed
            ALUOp2Sel <= ImmedOp2; -- specify immediate value used
            ALUBlockSel <= ALUFBlock; -- specify f block
            SelA(4)  <= '1'; -- only upper registers can be used with immediate
            SelIn(4) <= '1'; -- only upper registers can be used with immediate
            ALUBlockInstructionSel <= FBlockOR; -- specify or instruction
        end if;

        if std_match(IR, OpROR   ) then -- rotate right
            ALUStatusMask <= flag_mask_ZCNVS; -- specify which bits can be changed
            ALUBlockSel <= ALUShiftBlock; -- specify shift block
            ALUBlockInstructionSel <= ShiftBlockRot; -- specify rotate instruction
        end if;

        if std_match(IR, OpSBC   ) then -- subtract with carry
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits can be changed
            ALUBlockSel <= ALUAddBlock; -- specify add block
            ALUBlockInstructionSel <= AddBlockSubCarry; -- specify subtract with carry instruction
        end if;

        if std_match(IR, OpSBCI  ) then -- subtract with immediate and carry
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits can be changed
            ALUOp2Sel <= ImmedOp2; -- specify immediate value used
            ALUBlockSel <= ALUAddBlock; -- specify add block
            SelA(4)  <= '1'; -- only upper registers with immediate
            SelIn(4) <= '1'; -- only upper registers with immediate
            ALUBlockInstructionSel <= AddBlockSubCarry; -- specify subtract with carry instruction
        end if;

        if std_match(IR, OpSBIW  ) then -- subtract immediate from word
            ALUStatusMask <= flag_mask_ZCNVS; -- specify which bits can be changed
            ALUOp2Sel <= ImmedOp2; -- specify immediate value used
            ALUBlockSel <= ALUAddBlock; -- specify add block
            ImmediateOut(7 downto 6) <= "00"; -- top 2 bits in immediate set to 0

            if (CycleCount(0) = '0') then -- first cycle
                ALUBlockInstructionSel <= AddBlockSub;
                -- select the first register of the two
                if (IR(5 downto 4) = "00") then
                    SelA <= std_logic_vector(to_unsigned(24, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(24, SelIn'length));
                end if;
                if (IR(5 downto 4) = "01") then
                    SelA <= std_logic_vector(to_unsigned(26, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(26, SelIn'length));
                end if;
                if (IR(5 downto 4) = "10") then
                    SelA <= std_logic_vector(to_unsigned(28, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(28, SelIn'length));
                end if;
                if (IR(5 downto 4) = "11") then
                    SelA <= std_logic_vector(to_unsigned(30, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(30, SelIn'length));
                end if;
            end if;
            if (CycleCount(0) = '1') then -- second cycle
                ALUBlockInstructionSel <= AddBlockSubCarry; -- only process the carry
                ImmediateOut <= "00000000"; -- do not subtract anything else
                -- select the second register of the two
                if (IR(5 downto 4) = "00") then
                    SelA <= std_logic_vector(to_unsigned(25, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(25, SelIn'length));
                end if;
                if (IR(5 downto 4) = "01") then
                    SelA <= std_logic_vector(to_unsigned(27, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(27, SelIn'length));
                end if;
                if (IR(5 downto 4) = "10") then
                    SelA <= std_logic_vector(to_unsigned(29, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(29, SelIn'length));
                end if;
                if (IR(5 downto 4) = "11") then
                    SelA <= std_logic_vector(to_unsigned(31, SelIn'length));
                    SelIn <= std_logic_vector(to_unsigned(31, SelIn'length));
                end if;
            end if;
        end if;

        if std_match(IR, OpSUB   ) then -- subtract
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits can be changed
            ALUBlockSel <= ALUAddBlock; -- specify add block
            ALUBlockInstructionSel <= AddBlockSub; -- specify subtract instruction
        end if;

        if std_match(IR, OpSUBI  ) then -- subtract with immediate
            ALUStatusMask <= flag_mask_ZCNVSH; -- specify which bits can be changed
            ALUOp2Sel <= ImmedOp2; -- specify immediate used
            ALUBlockSel <= ALUAddBlock; -- specify add block
            SelA(4)  <= '1'; -- only upper registers can be used with immediate
            SelIn(4) <= '1'; -- only upper registers can be used with immediate
            ALUBlockInstructionSel <= AddBlockSub; -- specify subtract instruction
        end if;

        if std_match(IR, OpSWAP  ) then -- swap nibbles
            ALUStatusMask <= flag_mask_KEEPALL; -- specify which bits can be changed
            ALUBlockSel <= ALUShiftBlock; -- specify shift block
            ALUBlockInstructionSel <= ShiftBlockSwap; -- specify swap instruction
        end if;
        
        if ( std_match(IR, OpLDX)  or std_match(IR, OpLDXI) or std_match(IR, OpLDXD) or
             std_match(IR, OpLDYI) or std_match(IR, OpLDYD) or
             std_match(IR, OpLDZI) or std_match(IR, OpLDZD) or
             std_match(IR, OpSTX)  or std_match(IR, OpSTXI) or std_match(IR, OpSTXD) or
             std_match(IR, OpSTYI) or std_match(IR, OpSTYD) or
             std_match(IR, OpSTZI) or std_match(IR, OpSTZD) or
             std_match(IR, OpPOP)  or std_match(IR, OpPUSH) ) then
            
            
            EnableIn  <= '0'; -- no input into registers (at least for the first clock)
            if IR(9) = '0' then -- LOAD vs STORE (load)
                -- SelIn already selected properly
                if MemRegAddrM = '0' then
                    -- Send to registers instead of memory
                    RegDataInSel <= "11";   -- data from output of registers
                    SelA <= RegAddr;
                else
                    RegDataInSel <= "01";   -- take data into Rd from the memory data bus
                end if;
            else
                -- SelA already selected properly
                if MemRegAddrM = '0' then
                    -- Send to registers instead of memory
                    RegDataInSel <= "11";   -- data from output of registers
                    SelIn <= RegAddr;
                else
                    DataIOSel <= '1'; -- output data from Rr to memory data bus
                end if;
            end if;
            
            -- Select the special register
            if IR(3 downto 2) = "11" then   -- X
                SpecAddr <= "00";
            end if;
            if IR(3 downto 2) = "10" then   -- Y
                SpecAddr <= "01";
            end if;
            if IR(3 downto 2) = "00" then   -- Z
                SpecAddr <= "10";
            end if;
            if IR(3 downto 0) = "1111" then -- SP (PUSH/POP)
                SpecAddr <= "11";
            end if;
            
            -- Clock dependent stuff
            if CycleCount(0) = '0' then
                if IR(1 downto 0) = "00" then   -- no inc/dec
                    -- No action
                end if;
                if IR(1 downto 0) = "01" then   -- post-increment
                    -- No action
                end if;
                if IR(1 downto 0) = "10" then   -- pre-decrement
                    AddrOffset <= std_logic_vector(to_signed(-1,16));
                    SpecWr <= '1';
                end if;
                if (IR(3 downto 0) = "1111") and (IR(9) = '0') then -- POP
                    -- POP = pre-increment
                    AddrOffset <= std_logic_vector(to_signed(1,16));
                    SpecWr <= '1';
                end if;
            end if;
            if CycleCount(0) = '1' then
                if MemRegAddrM = '1' then
                    OutRd  <= IR(9);        -- Read
                    OutWr  <= not IR(9);    -- Write
                end if;
                
                if IR(9) = '0' then -- (LOAD)
                    EnableIn  <= '1'; -- input into registers
                end if;
                if IR(9) = '1' and MemRegAddrM = '0' then -- Store into register
                    EnableIn <= '1';
                end if;
                
                if IR(1 downto 0) = "00" then   -- no inc/dec
                    -- No action
                end if;
                if IR(1 downto 0) = "01" then   -- post-increment
                    AddrOffset <= std_logic_vector(to_signed(1,16));
                    SpecWr <= '1';
                end if;
                if IR(1 downto 0) = "10" then   -- pre-decrement
                    -- No action
                end if;
                if (IR(3 downto 0) = "1111") and (IR(9) = '1') then -- PUSH
                    -- PUSH = post-decrement
                    AddrOffset <= std_logic_vector(to_signed(-1,16));
                    SpecWr <= '1';
                end if;
            end if;
        end if;
        
        if ( std_match(IR, OpLDDY) or std_match(IR, OpLDDZ) or
             std_match(IR, OpSTDY) or std_match(IR, OpSTDZ) ) then
            
            EnableIn  <= '0'; -- no input into registers (at least for the first clock)
            if IR(9) = '0' then -- LOAD vs STORE (load)
                -- SelIn already selected properly
                if MemRegAddrM = '0' then
                    -- Send to registers instead of memory
                    RegDataInSel <= "11";   -- data from output of registers
                    SelA <= RegAddr;
                else
                    RegDataInSel <= "01";   -- take data into Rd from the memory data bus
                end if;
            else
                -- SelA already selected properly
                if MemRegAddrM = '0' then
                    -- Send to registers instead of memory
                    RegDataInSel <= "11";   -- data from output of registers
                    SelIn <= RegAddr;
                else
                    DataIOSel <= '1'; -- output data from Rr to memory data bus
                end if;
            end if;
            
            -- Select the special register
            if IR(3) = '1' then -- Y
                SpecAddr <= "01";
            end if;
            if IR(3) = '0' then -- Z
                SpecAddr <= "10";
            end if;

            -- specify how much to shift Y/Z
            AddrOffset <= std_logic_vector(to_signed(0,10)) &
                IR(13) & IR(11 downto 10) & IR(2 downto 0);
            
            -- Clock dependent stuff
            if CycleCount(0) = '0' then
                -- No action
            end if;
            if CycleCount(0) = '1' then
                if MemRegAddrM = '1' then
                    OutRd  <= IR(9);        -- Read
                    OutWr  <= not IR(9);    -- Write
                end if;
                
                if (IR(9) = '0') or (MemRegAddrM = '0') then -- (LOAD or register store)
                    EnableIn  <= '1'; -- input into registers
                end if;
            end if;
        end if;
        
        if ( std_match(IR, OpLDS) or std_match(IR, OpSTS) ) then
            EnableIn  <= '0'; -- no input into registers (at least for the first clock)
            if IR(9) = '0' then -- LOAD vs STORE (load)
                -- SelIn already selected properly
                if ProgDBM = '0' then
                    -- Send to registers instead of memory
                    RegDataInSel <= "11";   -- data from output of registers
                    SelA <= RegAddr;
                else
                    RegDataInSel <= "01";   -- take data into Rd from the memory data bus
                end if;
            else -- (store)
                -- SelA already selected properly
                if ProgDBM = '0' then
                    -- Send to registers instead of memory
                    RegDataInSel <= "11";   -- data from output of registers
                    SelIn <= RegAddr;
                else
                    DataIOSel <= '1'; -- output data from Rr to memory data bus
                end if;
            end if;
            
            -- Clock dependent stuff
            if CycleCount = "00" then
                -- No action (waiting for m)
            end if;
            if CycleCount = "01" then
                -- No action (m is output automatically, outside this process)
            end if;
            if CycleCount = "10" then
                -- Keep everything the same (data comes in / goes out)
                if ProgDBM = '1' then
                    OutRd  <= IR(9);        -- Read
                    OutWr  <= not IR(9);    -- Write
                end if;
                
                if (IR(9) = '0') or (ProgDBM = '0') then -- (LOAD or Register store)
                    EnableIn  <= '1'; -- input into registers
                end if;
            end if;
        end if;
        
        if ( std_match(IR, OpLDI) ) then
            SelIn        <= "001" & IR(7 downto 4); -- Missing top bit
            ImmediateOut <= IR(11 downto 8) & IR(3 downto 0);
            RegDataInSel <= "10";                   -- take data from immediate out
        end if;
        
        if ( std_match(IR, OpMOV) ) then
            -- SelIn default is correct (register d)
            SelA         <= "00" & IR(9) & IR(3 downto 0);  -- Register r
            RegDataInSel <= "11";                   -- take data from registers
        end if;
        
        if ( std_match(IR, OpJMP) ) then
            PCUUpdateSel <= "01";   -- next PC taken from ProgDB
            
            if CycleCount = "00" then
            end if;
            if CycleCount = "01" then
            end if;
            if CycleCount = "10" then
            end if;
        end if;
    end process DecodeInstruction;

    -- process to keep track of which step in a two-clock instruction is being run
    UpdateCycleCount: process(clock)
    begin
        -- only update on rising clock
        if rising_edge(clock) then
            -- defaults for 1-cycle instructions
            CycleCount <= "00";
            newIns     <= '1';
            
            -- 2-cycle instructions
            if (std_match(IR, OpMUL)  or std_match(IR, OpADIW) or std_match(IR, OpSBIW) or
                std_match(IR, OpLDX)  or std_match(IR, OpLDXI) or std_match(IR, OpLDXD) or
                std_match(IR, OpLDYI) or std_match(IR, OpLDYD) or std_match(IR, OpLDDY) or
                std_match(IR, OpLDZI) or std_match(IR, OpLDZD) or std_match(IR, OpLDDZ) or
                std_match(IR, OpSTX)  or std_match(IR, OpSTXI) or std_match(IR, OpSTXD) or
                std_match(IR, OpSTYI) or std_match(IR, OpSTYD) or std_match(IR, OpSTDY) or
                std_match(IR, OpSTZI) or std_match(IR, OpSTZD) or std_match(IR, OpSTDZ) or
                std_match(IR, OpPOP)  or std_match(IR, OpPUSH) or
                std_match(IR, OpRJMP) or std_match(IR, OpIJMP)) then
                
                newIns <= '0';  -- multi-clock instructions default to not having new instruction next clock
                if CycleCount = "00" then
                    CycleCount <= "01";
                end if;
                if CycleCount = "01" then
                    newIns <= '1';
                end if;
            end if;
            
            -- 3-cycle instructions
            if (std_match(IR, OpLDS) or std_match(IR, OpSTS) or std_match(IR, OpJMP) or
                std_match(IR, OpRCALL) or std_match(IR, OpICALL)) then
                newIns <= '0';  -- multi-clock instructions default to not having new instruction next clock
                if CycleCount = "00" then
                    CycleCount <= "01";
                end if;
                if CycleCount = "01" then
                    CycleCount <= "10";
                end if;
                if CycleCount = "10" then
                    newIns <= '1';
                end if;
            end if;
            
            -- 4-cycle instructions
            if (std_match(IR, OpCALL) or std_match(IR, OpRET) or std_match(IR, OpRETI)) then
                newIns <= '0';  -- multi-clock instructions default to not having new instruction next clock
                if CycleCount = "00" then
                    CycleCount <= "01";
                end if;
                if CycleCount = "01" then
                    CycleCount <= "10";
                end if;
                if CycleCount = "10" then
                    CycleCount <= "11";
                end if;
                if CycleCount = "11" then
                    newIns <= '1';
                end if;
            end if;
            
            -- conditional branches
            if (std_match(IR, OpBRBC) or std_match(IR, OpBRBS)) then
                -- branch condition
                if (IR(10) xor StatusReg(integer(unsigned(IR(2 downto 0))))) = '1' then
                    newIns <= '0';
                    if CycleCount = "00" then
                        CycleCount <= "01";
                    end if;
                    if CycleCount = "01" then
                        newIns <= '1';
                    end if;
                end if;
            end if;
            
            -- CPSE instruction
            if (std_match(IR, OpCPSE)) then
                -- branching condition
                if UnofficialZeroFlag = '1' then -- 2 or 3 cycle instruction
                    newIns <= '0';
                    
                    if (oneWordNext = '1') then -- 1-word instruction next
                        if CycleCount = "00" then
                            CycleCount <= "01";
                        end if;
                        if CycleCount = "01" then
                            newIns <= '1';
                        end if;
                    else -- 2-word instruction next
                        if CycleCount = "00" then
                            CycleCount <= "01";
                        end if;
                        if CycleCount = "01" then
                            CycleCount <= "10";
                        end if;
                        if CycleCount = "10" then
                            newIns <= '1';
                        end if;
                    end if;
                end if;
                -- else, normal 1-cycle instruction
            end if;
            
            -- other skip instructions
            if (std_match(IR, OpSBRC) or std_match(IR, OpSBRS)) then
                -- branching condition
                if (IR(9) xor RegAIn(integer(to_unsigned(IR(2 downto 0))))) = '0' then -- 2 or 3 cycle instruction
                    newIns <= '0';
                    
                    if (oneWordNext = '1') then -- 1-word instruction next
                        if CycleCount = "00" then
                            CycleCount <= "01";
                        end if;
                        if CycleCount = "01" then
                            newIns <= '1';
                        end if;
                    else -- 2-word instruction next
                        if CycleCount = "00" then
                            CycleCount <= "01";
                        end if;
                        if CycleCount = "01" then
                            CycleCount <= "10";
                        end if;
                        if CycleCount = "10" then
                            newIns <= '1';
                        end if;
                    end if;
                end if;
            end if;
            
        end if;
    end process UpdateCycleCount;
end DataFlow;

