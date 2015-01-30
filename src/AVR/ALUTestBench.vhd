entity testbench is
end testbench;

architecture TB_ARCHITECTURE of testbench is
    signal IR       : opcode_word;                       -- Instruction Register
    signal OperandA : std_logic_vector(7 downto 0);      -- first operand
    signal OperandB : std_logic_vector(7 downto 0);      -- second operand
    signal clock    : std_logic;                         -- system clock
    signal Result   : std_logic_vector(7 downto 0);      -- ALU result
    signal StatReg  : std_logic_vector(7 downto 0);      -- status register
begin
    uut: entity work.ALUTest port map(
        IR       => IR,
        OperandA => OperandA,
        OperandB => OperandB,
        clock    => clock,
        Result   => Result,
        StatReg  => StatReg
    );
end; 
