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
       variable status   : std_logic_vector(7 downto 0);
       constant max_value : integer := ((2 ** 8) - 1); -- maximum possible input
    begin
        status := (others => '-');
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "001000rdddddrrrr";
                IR <= "001000XXXXXXXXXX";
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= std_logic_vector(to_unsigned(j, 8));
                wait until (clock = '1');
                wait until (clock = '1');
                answer := (OperandA and OperandB);

                if (answer = "00000000") then
                    status(flag_Z) := '1';
                else
                    status(flag_Z) := '0';
                end if;

                status(flag_N) := answer(7);
                status(flag_V) := '0';
                status(flag_S) := status(flag_N) xor status(flag_V);

                -- verify that result matches
                assert (std_match(Result, answer))
                    report "Wrong answer for AND(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for AND(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH AND";

        status := (others => '-');
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "001001rdddddrrrr";
                IR <= "001001XXXXXXXXXX";
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= std_logic_vector(to_unsigned(j, 8));
                wait until (clock = '1');
                wait until (clock = '1');
                answer := (OperandA xor OperandB);

                if (answer = "00000000") then
                    status(flag_Z) := '1';
                else
                    status(flag_Z) := '0';
                end if;

                status(flag_N) := answer(7);
                status(flag_V) := '0';
                status(flag_S) := status(flag_N) xor status(flag_V);

                -- verify that result matches
                assert (std_match(Result, answer))
                    report "Wrong answer for XOR(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for XOR(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH SIMULATIONS";
        end_sim <= true; -- done with simulations
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

