----------------------------------------------------------------------------
--  AVR Processor Control Block
--  Revision History:
--      01/26/15        Peter Cuy       initial version
--
----------------------------------------------------------------------------
-- bring in the necessary packages
library  ieee;
use  ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;


entity AVRControl is
    port (
            clock                   :  in  std_logic;                          --the system clock
            IR                      :  in  opcode_word;                        -- Instruction Register
            ALUStatusMask           :  out  std_logic_vector(7 downto 0);
            ALUStatusBitChangeEn    :  out  std_logic;
            ALUBitClrSet            :  out  std_logic;
            ALUBitTOp               :  out  std_logic;
            ALUOp2Sel               :  out  std_logic;
            ImmediateOut            :  out  std_logic_vector(7 downto 0);
            ALUBlockSel             :  out  std_logic_vector(1 downto 0);
            ALUBlockInstructionSel  :  out  std_logic_vector(3 downto 0);
            
            --Outputs to registers
            EnableIn    :   out  std_logic;
            SelIn       :   out  std_logic_vector(5 downto 0);
            SelA        :   out  std_logic_vector(5 downto 0);
            SelB        :   out  std_logic_vector(5 downto 0)
        );
end AVRControl;

architecture DataFlow of AVRControl is
    signal CycleCount  :   std_logic := '0';
begin

    DecodeInstruction: process (IR)
    begin
        ALUOp2Sel <= RegOp2;        --default operand 2 is from register
        EnableIn <= '1';            --enable input to register by default
        SelA <= IR(8 downto 4);
        SelB <= IR(9) & IR(3 downto 0);
        SelIn <= IR(8 downto 4);
        ImmediateOut <= IR(11 downto 8) & IR(3 downto 0);
        
        ALUBitClrSet <= StatusBitClear;
        ALUStatusBitChangeEn <= '0';
        ALUBitTOp <= '0';
        
        if std_match(IR, OpADC   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUBlockSel <= ALUAddBlock;
            ALUBlockInstructionSel <= AddBlockAddCarry;
        end if;

        if std_match(IR, OpADD   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUBlockSel <= ALUAddBlock;
            ALUBlockInstructionSel <= AddBlockAdd;
        end if;
        
        if std_match(IR, OpADIW  ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUOp2Sel<= ImmedOp2;
            ALUBlockSel <= ALUAddBlock;
            ImmediateOut(7 downto 6) <= "00";
            
            if (CycleCount = '0') then
                BlockInstructionSel <= AddBlockAdd;
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
            if (CycleCount = '1') then
                BlockInstructionSel <= AddBlockAddCarry;
                ImmediateOut <= "00000000";
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
        
        if std_match(IR, OpAND   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
            ALUBlockSel <= ALUFBlock;
            ALUBlockInstructionSel <= FBlockAND;
        end if;
        
        if std_match(IR, OpANDI  ) then 
            ALUOp2Sel<= ImmedOp2;
            ALUStatusMask <= flag_mask_ZNVS;
            ALUBlockSel <= ALUFBlock;
            SelA(5)  <= '1';
            SelIn(5) <= '1';
            ALUBlockInstructionSel <= FBlockAND;
        end if;
        
        if std_match(IR, OpASR   ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUBlockSel <= ALUShiftBlock;
            ALUBlockInstructionSel <= ShiftBlockArith;
        end if;
        
        if std_match(IR, OpBCLR  ) then 
            --OR operand 1 with zero to pass through to flag logic
            ALUBlockSel <= ALUFBlock;
            ALUBlockInstructionSel <= FBlockOR;
            ImmediateOut <= "00000000";
            
            --only enable changing of bit s (IP[6:4]) of status register
            ALUStatusMask <= "00000000";
            ALUStatusMask(to_integer(unsigned(IP(6 downto 4)))) <= "1";
            ALUBitClrSet <= StatusBitClear;
            EnableIn <= '0';
            
            ALUStatusBitChangeEn <= '1'; --manually changing status register bit
            
        end if;
        
        if std_match(IR, OpBLD   ) then 
            --OR operand 1 with zero to pass through to flag logic
            ALUBlockSel <= ALUFBlock;
            ALUBlockInstructionSel <= FBlockOR;
            ImmediateOut <= "00000000";
            
            --status mask now means which bit of operand 1 we're changing
            --only enable changing of bit b (IP[2:0])
            ALUStatusMask <= "00000000";
            ALUStatusMask(to_integer(unsigned(IP(2 downto 0)))) <= "1";
            ALUBitTOp <= '1'; --performing operation with T status bit
        end if;
        
        if std_match(IR, OpBSET  ) then 
            --OR operand 1 with zero to pass through to flag logic
            ALUBlockSel <= ALUFBlock;
            ALUBlockInstructionSel <= FBlockOR;
            ImmediateOut <= "00000000";
            
            --only enable changing of bit s (IP[6:4]) of status register
            ALUStatusMask <= "00000000";
            ALUStatusMask(to_integer(unsigned(IP(6 downto 4)))) <= "1";
            ALUBitClrSet <= StatusBitSet;
            EnableIn <= '0';
            
            ALUStatusBitChangeEn <= '1'; --manually changing status register bit
        end if;
        
        if std_match(IR, OpBST   ) then 
            EnableIn <= '0';
            
            --OR operand 1 with zero to pass through to flag logic
            ALUBlockSel <= ALUFBlock;
            ALUBlockInstructionSel <= FBlockOR;
            ImmediateOut <= "00000000";
            
            --status mask now means which bit of operand 1 we're changing
            --only enable changing of bit b (IP[2:0])
            ALUStatusMask <= "00000000";
            ALUStatusMask(to_integer(unsigned(IP(2 downto 0)))) <= "1";
            
            ALUStatusBitChangeEn <= '1'; --manually changing status register bit
            ALUBitTOp <= '1'; --performing operation with T status bit
        end if;
        
        if std_match(IR, OpCOM   ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUBlockSel <= ALUFBlock;
            ALUBlockInstructionSel <= FBlockNOTA;
        end if;
        
        if std_match(IR, OpCP    ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUBlockSel <= ALUAddBlock;
            EnableIn <= '0';
            ALUBlockInstructionSel <= AddBlockSub;
        end if;
        
        if std_match(IR, OpCPC   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUBlockSel <= ALUAddBlock;
            EnableIn <= '0';
            ALUBlockInstructionSel <= AddBlockSubCarry;
        end if;
        
        if std_match(IR, OpCPI   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUOp2Sel<= ImmedOp2;
            ALUBlockSel <= ALUAddBlock;
            EnableIn <= '0';
            SelA(5)  <= '1';
            SelIn(5) <= '1';
            ALUBlockInstructionSel <= AddBlockSub;
        end if;
        
        if std_match(IR, OpDEC   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
            ALUBlockSel <= ALUAddBlock;
            ALUBlockInstructionSel <= AddBlockSub;
        end if;
        
        if std_match(IR, OpEOR   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
            ALUBlockSel <= ALUFBlock;
            ALUBlockInstructionSel <= FBlockXOR;
        end if;
        
        if std_match(IR, OpINC   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
            ALUBlockSel <= ALUAddBlock;
            ALUBlockInstructionSel <= AddBlockAdd;
        end if;
        
        if std_match(IR, OpLSR   ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUBlockSel <= ALUShiftBlock;
            ALUBlockInstructionSel <= ShiftBlockLog;
        end if;
        
        if std_match(IR, OpMUL   ) then 
            ALUStatusMask <= flag_mask_ZC;
            ALUBlockSel <= ALUMulBlock;
            if (CycleCount = '0') then
                ALUBlockInstructionSel <= MulBlockLowByte;
                SelIn <= "00000";
            end if;
            if (CycleCount = '1') then
                ALUBlockInstructionSel <= MulBlockHighByte;
                SelIn <= "00001";
            end if;
        end if;
        
        if std_match(IR, OpNEG   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUBlockSel <= ALUAddBlock;
            ALUBlockInstructionSel <= AddBlockNeg;
        end if;
        
        if std_match(IR, OpOR    ) then 
            ALUStatusMask <= flag_mask_ZNVS;
            ALUBlockSel <= ALUFBlock;
            ALUBlockInstructionSel <= FBlockOR;
        end if;
        
        if std_match(IR, OpORI   ) then 
            ALUStatusMask <= flag_mask_ZNVS;
            ALUOp2Sel<= ImmedOp2;
            ALUBlockSel <= ALUFBlock;
            SelA(5)  <= '1';
            SelIn(5) <= '1';
            ALUBlockInstructionSel <= FBlockOR;
        end if;
        
        if std_match(IR, OpROR   ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUBlockSel <= ALUShiftBlock;
            ALUBlockInstructionSel <= ShiftBlockRot;
        end if;
        
        if std_match(IR, OpSBC   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUBlockSel <= ALUAddBlock;
            ALUBlockInstructionSel <= AddBlockSubCarry;
        end if;
        
        if std_match(IR, OpSBCI  ) then
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUOp2Sel<= ImmedOp2;   
            ALUBlockSel <= ALUAddBlock;
            SelA(5)  <= '1';
            SelIn(5) <= '1';    
            ALUBlockInstructionSel <= AddBlockSubCarry;            
        end if;
        
        if std_match(IR, OpSBIW  ) then 
            ALUStatusMask <= flag_mask_ZCNVS;
            ALUOp2Sel<= ImmedOp2;
            ALUBlockSel <= ALUAddBlock;
            ImmediateOut(7 downto 6) <= "00";
            
            if (CycleCount = '0') then
                BlockInstructionSel <= AddBlockSub;
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
            if (CycleCount = '1') then
                BlockInstructionSel <= AddBlockSubCarry;
                ImmediateOut <= "00000000";
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
        
        if std_match(IR, OpSUB   ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUBlockSel <= ALUAddBlock;
            ALUBlockInstructionSel <= AddBlockSub;
        end if;
        
        if std_match(IR, OpSUBI  ) then 
            ALUStatusMask <= flag_mask_ZCNVSH;
            ALUOp2Sel<= ImmedOp2;
            ALUBlockSel <= ALUAddBlock;
            SelA(5)  <= '1';
            SelIn(5) <= '1';
            ALUBlockInstructionSel <= AddBlockSub;
        end if;
        
        if std_match(IR, OpSWAP  ) then 
            ALUStatusMask <= flag_mask_KEEPALL;
            ALUBlockSel <= ALUShiftBlock;
            ALUBlockInstructionSel <= ShiftBlockSwap;
        end if;
        
        
    end process DecodeInstruction;
    
    
    UpdateCycleCount: process(clock)
    begin
        if rising_edge(clock) then
            CycleCount <= '0';
            if CycleCount = '0' and ( std_match(IR, OpMUL) or std_match(IR, OpADIW) or std_match(IR, OpSBIW) ) then
                CycleCount <= '1';
            end if;
        end if;
    end process UpdateCycleCount;
    
end DataFlow;