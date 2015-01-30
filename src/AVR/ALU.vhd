library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity ALU is
    port (
        clock                   :  in  std_logic;                          -- the system clock
        
        ALUBlockSel             :  in  std_logic_vector(1 downto 0);
        ALUBlockInstructionSel  :  in  std_logic_vector(3 downto 0);
        
        ALUOp2Sel               :  in  std_logic;
        ImmediateOut            :  in  std_logic_vector(7 downto 0);
        
        ALUStatusMask           :  in  std_logic_vector(7 downto 0);
        ALUStatusBitChangeEn    :  in  std_logic;
        ALUBitClrSet            :  in  std_logic;
        ALUBitTOp               :  in  std_logic;
        
        RegAOut                 :  in  std_logic_vector(7 downto 0);
        RegBOut                 :  in  std_logic_vector(7 downto 0);
        
        RegIn                   : inout  std_logic_vector(7 downto 0);
        RegStatus               : inout  std_logic_vector(7 downto 0)
    );
end ALU;

architecture DataFlow of ALU is
    signal opA      : std_logic_vector(7 downto 0);
    signal opB      : std_logic_vector(7 downto 0);

    -- garbage signals for Fblock
    signal F_result  : std_logic_vector(7 downto 0);

    -- garbage signals for shift
    signal shift_statusN : std_logic;
    signal shift_statusV : std_logic;
    signal shift_statusC : std_logic;
    signal shift_result  : std_logic_vector(7 downto 0);

    -- garbage signals for add
    signal add_statusH : std_logic;
    signal add_statusV : std_logic;
    signal add_statusC : std_logic;
    signal add_result  : std_logic_vector(7 downto 0);

    -- garbage signals for mul
    signal mul_result  : std_logic_vector(7 downto 0);

    -- garbage signals for status
    signal status_statusH : std_logic;
    signal status_statusV : std_logic;
    signal status_statusN : std_logic;
    signal status_statusC : std_logic;

    signal ALUResult : std_logic_vector(7 downto 0);


begin
    opA <= regAOut;
    opB <= regBOut when (ALUOp2Sel = '0') else ImmediateOut;

    FBlock : entity work.ALUFBlock
    port map (
        operand => ALUBlockInstructionSel,
        opA => opA,
        opB => opB,
        result => F_result
    );

    ShiftBlock : entity work.ALUShiftBlock
    port map (
        operand => ALUBlockInstructionSel(2 downto 0),
        opA     => opA,
        carry   => RegStatus(flag_C),

        statusN => shift_statusN,
        statusV => shift_statusV,
        statusC => shift_statusC,
        result  => shift_result
    );
    
    AddBlock : entity work.ALUAddBlock
    port map (
        operand => ALUBlockInstructionSel(2 downto 0),
        opA     => opA,
        opB     => opB,
        carry   => RegStatus(flag_C),

        statusH => add_statusH,
        statusV => add_statusV,
        statusC => add_statusC,
        result  => add_result
    );
    
    MulBlock : entity work.ALUMulBlock
    port map (
        operand => ALUBlockInstructionSel(0),
        opA     => opA,
        opB     => opB,

        carry   => RegStatus(flag_C),
        result  => mul_result
    );

    ALUResult <= F_result     when (ALUBlockSel = ALUFBlock)     else
                 shift_result when (ALUBlockSel = ALUShiftBlock) else
                 add_result   when (ALUBlockSel = ALUAddBlock)   else
                 mul_result   when (ALUBlockSel = ALUMulBlock)   else
                 (others => 'X');

    
    StatusBlock : entity work.ALUStatus
    port map (
        clk => clock,

        ALUResult => ALUResult,
        statusMask => ALUStatusMask,

        statusH => status_statusH,
        statusV => status_statusV,
        statusN => status_statusN,
        statusC => status_statusC,

        bitChangeEn => ALUStatusBitChangeEn,
        bitClrSet   => ALUBitClrSet,
        bitT        => ALUBitTOp,

        status => RegStatus,
        result => RegIn
    );
end DataFlow;

