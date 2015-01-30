library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;


entity testbench is
end testbench;

architecture TB_ARCHITECTURE of testbench is
    signal IR       : opcode_word;                       -- Instruction Register
    signal OperandA : std_logic_vector(7 downto 0);      -- first operand
    signal OperandB : std_logic_vector(7 downto 0);      -- second operand
    signal clock    : std_logic;                         -- system clock
    signal Result   : std_logic_vector(7 downto 0);      -- ALU result
    signal StatReg  : std_logic_vector(7 downto 0);      -- status register

    -- signal used to stop clock signal generators
    signal end_sim : boolean := false;
begin
    uut: entity work.ALU_TEST port map(
        IR       => IR,
        OperandA => OperandA,
        OperandB => OperandB,
        clock    => clock,
        Result   => Result,
        StatReg  => StatReg
    );

    -- generate the stimulus and test the design
    tb : process
	     variable answer   : std_logic_vector(7 downto 0);
    begin
        --    "001001rdddddrrrr";
        IR <= "001001XXXXXXXXXX";
        OperandA <= "00000001";
        OperandB <= "00000000";
        wait for 100 ns;
		  answer := (OperandA xor OperandB);

        -- verify that result matches
        assert (std_match(Result, answer))
            report "Wrong answer for XOR(" &
                integer'image(to_integer(unsigned(OperandA))) & ", " &
                integer'image(to_integer(unsigned(OperandB))) & ") = " &
					 integer'image(to_integer(unsigned(answer))) &
                " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
        severity ERROR;

        wait; -- will wait forever
    end process tb;

    -- Clock process definitions
    CLOCK_CLK : process
    begin
        -- this process generates a 20 ns period, 50% duty cycle clock
        -- only generate clock if still simulating
        if end_sim = false then
            clock <= '0';
            wait for 10 ns;
        else
            wait;
        end if;
  
        if end_sim = false then
            clock <= '1';
            wait for 10 ns;
        else
            wait;
        end if;
   end process;


end; 

