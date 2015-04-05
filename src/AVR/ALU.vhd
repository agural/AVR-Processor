----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Design Name:     AVR-Processor
-- Module Name:     ALU - Structural 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Connects the F-Block, Add block, Shift block, and Multiply
--                  blocks using multiplexers to compute the final output and
--                  update the status flags
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity ALU is
    port (
        clock                   :  in std_logic;                    -- system clock

        ALUBlockSel             :  in std_logic_vector(1 downto 0); -- which block is used
        ALUBlockInstructionSel  :  in std_logic_vector(3 downto 0); -- instruction for the block

        ALUOp2Sel               :  in std_logic;                    -- second input (register/immediate)
        ImmediateOut            :  in std_logic_vector(7 downto 0); -- value of immediate

        ALUStatusMask           :  in std_logic_vector(7 downto 0); -- which status bits can be changed
        ALUStatusBitChangeEn    :  in std_logic;                    -- instruction to change status
        ALUBitClrSet            :  in std_logic;                    -- set or clear status bits
        ALUBitTOp               :  in std_logic;                    -- instruction to change flag T
        statusZmod              :  in std_logic;                    -- whether to do standard or modified Z update

        RegAOut                 :  in std_logic_vector(7 downto 0); -- first register
        RegBOut                 :  in std_logic_vector(7 downto 0); -- second register

        RegIn                   : out std_logic_vector(7 downto 0); -- result
        RegStatus               : out std_logic_vector(7 downto 0)  -- status register
    );
end ALU;

architecture Structural of ALU is
    signal opA      : std_logic_vector(7 downto 0); -- first operand
    signal opB      : std_logic_vector(7 downto 0); -- second operand
    signal status   : std_logic_vector(7 downto 0); -- status register
    signal carry    : std_logic;                    -- latched carry bit

    -- output signals from Fblock
    signal F_result  : std_logic_vector(7 downto 0); -- result of F block

    -- output signals from shift
    signal shift_result  : std_logic_vector(7 downto 0); -- result of shift block
    signal shift_statusV : std_logic;                    -- flag V from shift
    signal shift_statusC : std_logic;                    -- flag C from shift

    -- output signals from add
    signal add_result  : std_logic_vector(7 downto 0);  -- result of add block
    signal add_statusH : std_logic;                     -- flag H from add
    signal add_statusV : std_logic;                     -- flag V from add
    signal add_statusC : std_logic;                     -- flag C from add

    -- output signals for mul
    signal mul_result  : std_logic_vector(7 downto 0); -- result of mul block
    signal mul_statusC : std_logic;                    -- flag C from mul

    -- new signals for status
    signal statusH : std_logic; -- new flag H
    signal statusV : std_logic; -- new flag V
    signal statusC : std_logic; -- new flag C

    signal ALUResult : std_logic_vector(7 downto 0); -- result from ALU

begin
    opA <= regAOut; -- first input is usually first register
    -- choose between second register and immediate for second input
    opB <= regBOut when (ALUOp2Sel = '0') else ImmediateOut;
    -- output the status bits
    RegStatus <= status;

    -- connect instruction, inputs, and output to F Block
    FBlock : entity work.ALUFBlock
    port map (
        operand => ALUBlockInstructionSel,
        opA => opA,
        opB => opB,
        result => F_result
    );

    -- connect instruction, input, output, and status to Shift Block
    ShiftBlock : entity work.ALUShiftBlock
    port map (
        operand => ALUBlockInstructionSel(2 downto 0),
        op      => opA,
        carry   => carry,

        statusV => shift_statusV,
        statusC => shift_statusC,
        result  => shift_result
    );
    
    -- connect instruction, inputs, output, and status to Shift Block
    AddBlock : entity work.ALUAddBlock
    port map (
        operand => ALUBlockInstructionSel(2 downto 0),
        opA     => opA,
        opB     => opB,
        carry   => carry,

        statusH => add_statusH,
        statusV => add_statusV,
        statusC => add_statusC,
        result  => add_result
    );
    
    -- connect instruction, inputs, output, and status to Shift Block
    MulBlock : entity work.ALUMulBlock
    port map (
        operand => ALUBlockInstructionSel(0),
        opA     => opA,
        opB     => opB,

        carry   => mul_statusC,
        result  => mul_result
    );

    -- multiplexer to select which result to use
    ALUResult <= F_result     when (ALUBlockSel = ALUFBlock)     else
                 shift_result when (ALUBlockSel = ALUShiftBlock) else
                 add_result   when (ALUBlockSel = ALUAddBlock)   else
                 mul_result   when (ALUBlockSel = ALUMulBlock)   else
                 (others => 'X');

    -- multiplexer to select which H flag to use
    statusH <= 'X'           when (ALUBlockSel = ALUFBlock)     else
               'X'           when (ALUBlockSel = ALUShiftBlock) else
               add_statusH   when (ALUBlockSel = ALUAddBlock)   else
               'X'           when (ALUBlockSel = ALUMulBlock)   else
               'X';

    -- multiplexer to select which V flag to use
    statusV <= '0'           when (ALUBlockSel = ALUFBlock)     else
               shift_statusV when (ALUBlockSel = ALUShiftBlock) else
               add_statusV   when (ALUBlockSel = ALUAddBlock)   else
               'X'           when (ALUBlockSel = ALUMulBlock)   else
               'X';

    -- multiplexer to select which C flag to use
    statusC <= '1'           when (ALUBlockSel = ALUFBlock)     else    -- 1 for COM (others don't matter)
               shift_statusC when (ALUBlockSel = ALUShiftBlock) else
               add_statusC   when (ALUBlockSel = ALUAddBlock)   else
               mul_statusC   when (ALUBlockSel = ALUMulBlock)   else
               'X';

    
    -- connect the new status bits, result, and instructions to status handler
    StatusBlock : entity work.ALUStatus
    port map (
        clk => clock,
        
        ALUResult => ALUResult,
        statusMask => ALUStatusMask,

        statusH => statusH,
        statusV => statusV,
        statusC => statusC,
        statusZmod  => statusZmod,

        bitChangeEn => ALUStatusBitChangeEn,
        bitClrSet   => ALUBitClrSet,
        bitT        => ALUBitTOp,

        status => status,
        result => RegIn
    );

    -- save the old carry on clock edges for instructions that need it
    SaveCarry : process(clock)
    begin
        -- only store on rising clock
        if (rising_edge(clock)) then
            -- update carry bit
            carry <= status(flag_C);
        end if;
    end process SaveCarry;
end Structural;

