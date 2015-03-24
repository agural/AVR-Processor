----------------------------------------------------------------------------
--
--  Atmel AVR ALU Test Bench
--
--  This test bench checks each ALU instruction for all possible input values.
--  The results, status registers, and timings are all verified.
--
--  Revision History:
--      01/28/15    Bryan He        initial version
--
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;


entity ALU_TEST_TB is
end ALU_TEST_TB;

architecture TB_ARCHITECTURE of ALU_TEST_TB is
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
       -- answers of different lengths (to help compute flags)
       variable answer   : std_logic_vector(7 downto 0);
       variable answer7  : std_logic_vector(7 downto 0);
       variable answer8  : std_logic_vector(8 downto 0);
       variable answer15 : std_logic_vector(15 downto 0);
       variable answer16 : std_logic_vector(16 downto 0);
       variable answer4  : std_logic_vector(4 downto 0);
       variable status   : std_logic_vector(7 downto 0);
       variable temp     : std_logic_vector(7 downto 0);
       constant max_value : integer := ((2 ** 8) - 1); -- maximum possible input
    begin
        -- give valid values
        IR <= (others => '0');
        OperandA <= (others => '0');
        OperandB <= (others => '0');
        wait for 20 ns;
        wait until (clock = '1');
        report "START SIMULATION";

        -- initially status is unknown (so do not check values)
        status := (others => '-');
        
        -- clear all status bits
        IR <= "1001010010001000";
        status(flag_c) := '0';
        wait for 20 ns;
        IR <= "1001010010011000";
        status(flag_Z) := '0';
        wait for 20 ns;
        IR <= "1001010010101000";
        status(flag_N) := '0';
        wait for 20 ns;
        IR <= "1001010010111000";
        status(flag_V) := '0';
        wait for 20 ns;
        IR <= "1001010011001000";
        status(flag_S) := '0';
        wait for 20 ns;
        IR <= "1001010011011000";
        status(flag_H) := '0';
        wait for 20 ns;
        
        
        -- Test NEG
        for i in 0 to max_value loop
            --    "1001010ddddd0001";
            wait until (clock = '1');
            IR <= "1001010XXXXX0001";
            OperandA <= std_logic_vector(to_unsigned(i, 8));
            OperandB <= "00000000";
            wait until (clock = '1');
            
            answer  := std_logic_vector(-signed(OperandA));
            answer4 := std_logic_vector(-signed('0' & OperandA(3 downto 0)));
            answer7 := std_logic_vector(-signed('0' & OperandA(6 downto 0)));
            answer8 := std_logic_vector(-signed('0' & OperandA));

            if (answer = "00000000") then
                status(flag_Z) := '1';
            else
                status(flag_Z) := '0';
            end if;

            status(flag_N) := answer(7);
            status(flag_C) := answer8(8);
            status(flag_H) := answer4(4);
            status(flag_V) := answer8(8) xor answer7(7);
            status(flag_S) := status(flag_N) xor status(flag_V);

            -- verify that result matches
            assert (std_match(Result, answer))
                report "Wrong answer for NEG(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) &
                    " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
            severity ERROR;

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for NEG(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH NEG";
        

        -- Test SBCI
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "0100KKKKddddKKKK";
                IR <= "0100XXXXXXXXXXXX";
                temp := std_logic_vector(to_unsigned(j, 8));
                IR(11 downto 8) <= temp(7 downto 4);
                IR(3 downto 0) <= temp(3 downto 0);
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                wait until (clock = '1');
                answer := std_logic_vector(unsigned(OperandA) - unsigned(temp) - ("0000000" & status(flag_C)));
                answer8 := std_logic_vector(unsigned('0' & OperandA) - unsigned('0' & temp) - ("00000000" & status(flag_C)));
                answer7 := std_logic_vector(unsigned('0' & OperandA(6 downto 0)) - unsigned('0' & temp(6 downto 0)) - ("000000" & status(flag_C)));
                answer4 := std_logic_vector(unsigned('0' & OperandA(3 downto 0)) - unsigned('0' & temp(3 downto 0)) - ("000" & status(flag_C)));

                if (answer = "00000000") then
                    status(flag_Z) := '1';
                else
                    status(flag_Z) := '0';
                end if;

                status(flag_c) := answer8(8);
                status(flag_N) := answer(7);
                if (answer8(8) = answer7(7)) then
                    status(flag_V) := '0';
                else
                    status(flag_V) := '1';
                end if;
                status(flag_S) := status(flag_N) xor status(flag_V);
                status(flag_H) := answer4(4);

                -- verify that result matches
                assert (std_match(Result, answer))
                    report "Wrong answer for SBCI(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(temp))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for SBCI(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(temp))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH SBCI";
        

        -- Test SUBI
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "0101KKKKddddKKKK";
                IR <= "0101XXXXXXXXXXXX";
                temp := std_logic_vector(to_unsigned(j, 8));
                IR(11 downto 8) <= temp(7 downto 4);
                IR(3 downto 0) <= temp(3 downto 0);
                wait until (clock = '1');
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                wait until (clock = '1');
                answer := std_logic_vector(unsigned(OperandA) - unsigned(temp));
                answer8 := std_logic_vector(unsigned('0' & OperandA) - unsigned('0' & temp));
                answer7 := std_logic_vector(unsigned('0' & OperandA(6 downto 0)) - unsigned('0' & temp(6 downto 0)));
                answer4 := std_logic_vector(unsigned('0' & OperandA(3 downto 0)) - unsigned('0' & temp(3 downto 0)));

                if (answer = "00000000") then
                    status(flag_Z) := '1';
                else
                    status(flag_Z) := '0';
                end if;

                status(flag_c) := answer8(8);
                status(flag_N) := answer(7);
                if (answer8(8) = answer7(7)) then
                    status(flag_V) := '0';
                else
                    status(flag_V) := '1';
                end if;
                status(flag_S) := status(flag_N) xor status(flag_V);
                status(flag_H) := answer4(4);

                -- verify that result matches
                assert (std_match(Result, answer))
                    report "Wrong answer for SUBI(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(temp))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for SUBI(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(temp))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH SUBI";
        

        -- Test Not
        for i in 0 to max_value loop
            --    "1001010ddddd0000";
            IR <= "1001010XXXXX0000";
            wait until (clock = '1');
            OperandA <= std_logic_vector(to_unsigned(i, 8));
            OperandB <= "00000000";
            wait until (clock = '1');
            answer := not OperandA;

            if (answer = "00000000") then
                status(flag_Z) := '1';
            else
                status(flag_Z) := '0';
            end if;

            status(flag_C) := '1';
            status(flag_N) := answer(7);
            status(flag_V) := '0';
            status(flag_S) := status(flag_N) xor status(flag_V);

            -- verify that result matches
            assert (std_match(Result, answer))
                report "Wrong answer for NOT(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) &
                    " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
            severity ERROR;

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for NOT(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH NOT";

        -- Test Dec
        for i in 0 to max_value loop
            --    "1001010ddddd1010";
            IR <= "1001010XXXXX1010";
            wait until (clock = '1');
            OperandA <= std_logic_vector(to_unsigned(i, 8));
            OperandB <= "00000000";
            wait until (clock = '1');
            answer := std_logic_vector(unsigned(OperandA) - "00000001");

            if (answer = "00000000") then
                status(flag_Z) := '1';
            else
                status(flag_Z) := '0';
            end if;

            status(flag_N) := answer(7);
            if (answer = "01111111") then
                status(flag_V) := '1';
            else
                status(flag_V) := '0';
            end if;
            status(flag_S) := status(flag_N) xor status(flag_V);

            -- verify that result matches
            assert (std_match(Result, answer))
                report "Wrong answer for DEC(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) &
                    " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
            severity ERROR;

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for DEC(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH DEC";

        -- Test Inc
        for i in 0 to max_value loop
            --    "1001010ddddd0011";
            IR <= "1001010XXXXX0011";
            OperandA <= std_logic_vector(to_unsigned(i, 8));
            OperandB <= "00000000";
            wait until (clock = '1');
            wait until (clock = '1');
            answer := std_logic_vector(unsigned(OperandA) + "00000001");

            if (answer = "00000000") then
                status(flag_Z) := '1';
            else
                status(flag_Z) := '0';
            end if;

            status(flag_N) := answer(7);
            if (answer = "10000000") then
                status(flag_V) := '1';
            else
                status(flag_V) := '0';
            end if;
            status(flag_S) := status(flag_N) xor status(flag_V);

            -- verify that result matches
            assert (std_match(Result, answer))
                report "Wrong answer for INC(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) &
                    " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
            severity ERROR;

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for INC(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH INC";

        -- Test SBC
        -- clear carry flag
        IR <= "1001010010001000";
        status(flag_c) := '0';
        wait for 20 ns;
        
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "000010rdddddrrrr";
                wait until (clock = '1');
                IR <= "000010XXXXXXXXXX";
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= std_logic_vector(to_unsigned(j, 8));
                wait for 10 ns;
                
                answer  := std_logic_vector(unsigned(OperandA) - unsigned(OperandB) - ("0000000" & status(flag_C)));
                answer8 := std_logic_vector(unsigned('0' & OperandA) - unsigned('0' & OperandB) - ("00000000" & status(flag_C)));
                answer7 := std_logic_vector(unsigned('0' & OperandA(6 downto 0)) - unsigned('0' & OperandB(6 downto 0)) - ("000000" & status(flag_C)));
                answer4 := std_logic_vector(unsigned('0' & OperandA(3 downto 0)) - unsigned('0' & OperandB(3 downto 0)) - ("000" & status(flag_C)));

                if (answer = "00000000") then
                    status(flag_Z) := '1';
                else
                    status(flag_Z) := '0';
                end if;

                status(flag_C) := answer8(8);
                status(flag_N) := answer(7);
                if (answer8(8) = answer7(7)) then
                    status(flag_V) := '0';
                else
                    status(flag_V) := '1';
                end if;
                status(flag_S) := status(flag_N) xor status(flag_V);
                status(flag_H) := answer4(4);

                -- verify that result matches
                assert (std_match(Result, answer))
                    report "Wrong answer for SBC(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for SBC(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH SBC";


         -- Test Sub
         for i in 0 to max_value loop
             for j in 0 to max_value loop
                 --    "000110rdddddrrrr";
                 IR <= "000110XXXXXXXXXX";
                 OperandA <= std_logic_vector(to_unsigned(i, 8));
                 OperandB <= std_logic_vector(to_unsigned(j, 8));
                 wait until (clock = '1');
                 wait until (clock = '1');
                 answer := std_logic_vector(unsigned(OperandA) - unsigned(OperandB));
                 answer8 := std_logic_vector(unsigned('0' & OperandA) - unsigned('0' & OperandB));
                 answer7 := std_logic_vector(unsigned('0' & OperandA(6 downto 0)) - unsigned('0' & OperandB(6 downto 0)));
                 answer4 := std_logic_vector(unsigned('0' & OperandA(3 downto 0)) - unsigned('0' & OperandB(3 downto 0)));

                 if (answer = "00000000") then
                     status(flag_Z) := '1';
                 else
                     status(flag_Z) := '0';
                 end if;

                 status(flag_c) := answer8(8);
                 status(flag_N) := answer(7);
                 if (answer8(8) = answer7(7)) then
                     status(flag_V) := '0';
                 else
                     status(flag_V) := '1';
                 end if;
                 status(flag_S) := status(flag_N) xor status(flag_V);
                 status(flag_H) := answer4(4);

                 -- verify that result matches
                 assert (std_match(Result, answer))
                     report "Wrong answer for SUB(" &
                         integer'image(to_integer(unsigned(OperandA))) & ", " &
                         integer'image(to_integer(unsigned(OperandB))) & ") = " &
                         integer'image(to_integer(unsigned(answer))) &
                         " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                 severity ERROR;

                 -- verify that result matches
                 assert (std_match(StatReg, status))
                     report "Wrong status for SUB(" &
                         integer'image(to_integer(unsigned(OperandA))) & ", " &
                         integer'image(to_integer(unsigned(OperandB))) & ") = " &
                         integer'image(to_integer(unsigned(answer))) & " (Got " &
                         integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                         integer'image(to_integer(unsigned(status))) & ")"
                 severity ERROR;
             end loop;
         end loop;

         report "DONE WITH SUB";


        -- Test Add with carry
        -- clear carry flag
        IR <= "1001010010001000";
        status(flag_c) := '0';
        wait for 20 ns;

        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "000111rdddddrrrr";
                wait until (clock = '1');
                IR <= "000111XXXXXXXXXX";
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= std_logic_vector(to_unsigned(j, 8));
                wait for 10 ns;
                
                answer := std_logic_vector(unsigned(OperandA) + unsigned(OperandB) + ("0000000" & status(flag_C)));
                answer8 := std_logic_vector(unsigned('0' & OperandA) + unsigned('0' & OperandB) + ("00000000" & status(flag_C)));
                answer7 := std_logic_vector(unsigned('0' & OperandA(6 downto 0)) + unsigned('0' & OperandB(6 downto 0)) + ("000000" & status(flag_C)));
                answer4 := std_logic_vector(unsigned('0' & OperandA(3 downto 0)) + unsigned('0' & OperandB(3 downto 0)) + ("000" & status(flag_C)));

                if (answer = "00000000") then
                    status(flag_Z) := '1';
                else
                    status(flag_Z) := '0';
                end if;

                status(flag_C) := answer8(8);
                status(flag_N) := answer(7);
                if (answer8(8) = answer7(7)) then
                    status(flag_V) := '0';
                else
                    status(flag_V) := '1';
                end if;
                status(flag_S) := status(flag_N) xor status(flag_V);
                status(flag_H) := answer4(4);

                -- verify that result matches
                assert (std_match(Result, answer))
                    report "Wrong answer for ADC(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for ADC(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH ADC";


        -- Test add
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "000011rdddddrrrr";
                IR <= "000011XXXXXXXXXX";
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= std_logic_vector(to_unsigned(j, 8));
                wait until (clock = '1');
                wait until (clock = '1');
                answer := std_logic_vector(unsigned(OperandA) + unsigned(OperandB));
                answer8 := std_logic_vector(unsigned('0' & OperandA) + unsigned('0' & OperandB));
                answer7 := std_logic_vector(unsigned('0' & OperandA(6 downto 0)) + unsigned('0' & OperandB(6 downto 0)));
                answer4 := std_logic_vector(unsigned('0' & OperandA(3 downto 0)) + unsigned('0' & OperandB(3 downto 0)));

                if (answer = "00000000") then
                    status(flag_Z) := '1';
                else
                    status(flag_Z) := '0';
                end if;

                status(flag_C) := answer8(8);
                status(flag_N) := answer(7);
                if (answer8(8) = answer7(7)) then
                    status(flag_V) := '0';
                else
                    status(flag_V) := '1';
                end if;
                status(flag_S) := status(flag_N) xor status(flag_V);
                status(flag_H) := answer4(4);

                -- verify that result matches
                assert (std_match(Result, answer))
                    report "Wrong answer for ADD(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for ADD(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH ADD";

        -- Test BSET
        for i in 0 to 7 loop
            --    "100101000sss1000";
            IR <= "100101000XXX1000";
            IR(6 downto 4) <= std_logic_vector(to_unsigned(i, 3));
            OperandA <= "00000000";
            OperandB <= "00000000";
            wait until (clock = '1');
            wait until (clock = '1');
            answer := (0 => status(i), others => '0');
            status(i) := '1';

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for BSET(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH BSET";


        -- Test BCLR
        for i in 0 to 7 loop
            --    "100101001sss1000";
            IR <= "100101001XXX1000";
            IR(6 downto 4) <= std_logic_vector(to_unsigned(i, 3));
            OperandA <= "00000000";
            OperandB <= "11111111";
            wait until (clock = '1');
            wait until (clock = '1');
            answer := (0 => status(i), others => '0');
            status(i) := '0';

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for BCLR(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH BCLR";


        -- Test Swap
        for i in 0 to max_value loop
            --    "1001010ddddd0010";
            IR <= "1001010XXXXX0010";
            OperandA <= std_logic_vector(to_unsigned(i, 8));
            OperandB <= "00000000";
            wait until (clock = '1');
            wait until (clock = '1');
            answer := (OperandA(3 downto 0) & OperandA(7 downto 4));

            -- verify that result matches
            assert (std_match(Result, answer))
                report "Wrong answer for SWAP(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) &
                    " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
            severity ERROR;

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for SWAP(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH SWAP";

        -- Test Rotate Right
        for i in 0 to max_value loop
            --    "1001010ddddd0111";
            IR <= "1001010XXXXX0111";
            OperandA <= std_logic_vector(to_unsigned(i, 8));
            OperandB <= "00000000";
            wait until (clock = '1');
            wait until (clock = '1');
            answer := (OperandA(0) & OperandA(7 downto 1));

            if (answer = "00000000") then
                status(flag_Z) := '1';
            else
                status(flag_Z) := '0';
            end if;

            status(flag_C) := OperandA(0);
            status(flag_N) := answer(7);
            status(flag_V) := status(flag_N) xor status(flag_C);
            status(flag_S) := status(flag_N) xor status(flag_V);

            -- verify that result matches
            assert (std_match(Result, answer))
                report "Wrong answer for ROR(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) &
                    " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
            severity ERROR;

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for ROR(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH ROR";

        -- Test Logical Shift
        for i in 0 to max_value loop
            --    "1001010ddddd0110";
            IR <= "1001010XXXXX0110";
            OperandA <= std_logic_vector(to_unsigned(i, 8));
            OperandB <= "00000000";
            wait until (clock = '1');
            wait until (clock = '1');
            answer := ('0' & OperandA(7 downto 1));

            if (answer = "00000000") then
                status(flag_Z) := '1';
            else
                status(flag_Z) := '0';
            end if;

            status(flag_C) := OperandA(0);
            status(flag_N) := answer(7);
            status(flag_V) := status(flag_N) xor status(flag_C);
            status(flag_S) := status(flag_N) xor status(flag_V);

            -- verify that result matches
            assert (std_match(Result, answer))
                report "Wrong answer for LSR(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) &
                    " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
            severity ERROR;

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for LSR(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH LSR";


        -- Test Arithmetic Shift
        for i in 0 to max_value loop
            --    "1001010ddddd0101";
            IR <= "1001010XXXXX0101";
            OperandA <= std_logic_vector(to_unsigned(i, 8));
            OperandB <= "00000000";
            wait until (clock = '1');
            wait until (clock = '1');
            answer := (OperandA(7) & OperandA(7 downto 1));

            if (answer = "00000000") then
                status(flag_Z) := '1';
            else
                status(flag_Z) := '0';
            end if;

            status(flag_C) := OperandA(0);
            status(flag_N) := answer(7);
            status(flag_V) := status(flag_N) xor status(flag_C);
            status(flag_S) := status(flag_N) xor status(flag_V);

            -- verify that result matches
            assert (std_match(Result, answer))
                report "Wrong answer for ASR(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) &
                    " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
            severity ERROR;

            -- verify that result matches
            assert (std_match(StatReg, status))
                report "Wrong status for ASR(" &
                    integer'image(i) & ") = " &
                    integer'image(to_integer(unsigned(answer))) & " (Got " &
                    integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                    integer'image(to_integer(unsigned(status))) & ")"
            severity ERROR;
        end loop;

        report "DONE WITH ASR";

        -- Test And I
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                wait until (clock = '1');
                --    "0110KKKKddddKKKK";
                IR <= "0111XXXXXXXXXXXX";
                temp := std_logic_vector(to_unsigned(j, 8));
                IR(11 downto 8) <= temp(7 downto 4);
                IR(3 downto 0)  <= temp(3 downto 0);
                wait until (clock = '1');
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= "XXXXXXXX";
                wait until (clock = '1');
                answer := (OperandA and std_logic_vector(to_unsigned(j, 8)));

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
                    report "Wrong answer for ANDI(" &
                        integer'image(i) & ", " &
                        integer'image(j) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for ANDI(" &
                        integer'image(i) & ", " &
                        integer'image(j) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH ANDI";


        -- Test OrI
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "0110KKKKddddKKKK";
                IR <= "0110XXXXXXXXXXXX";
                temp := std_logic_vector(to_unsigned(j, 8));
                IR(11 downto 8) <= temp(7 downto 4);
                IR(3 downto 0)  <= temp(3 downto 0);
                wait until (clock = '1');
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= "XXXXXXXX";
                wait until (clock = '1');
                answer := (OperandA or std_logic_vector(to_unsigned(j, 8)));

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
                    report "Wrong answer for ORI(" &
                        integer'image(i) & ", " &
                        integer'image(j) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for ORI(" &
                        integer'image(i) & ", " &
                        integer'image(j) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH ORI";

        -- Test Or
        OperandB <= "00000000"; -- prevent warnings from X...X from ORI test
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "001010rdddddrrrr";
                IR <= "001010XXXXXXXXXX";
                wait until (clock = '1');
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= std_logic_vector(to_unsigned(j, 8));
                wait until (clock = '1');
                answer := (OperandA or OperandB);

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
                    report "Wrong answer for OR(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for OR(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH OR";



        -- Test And
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "001000rdddddrrrr";
                IR <= "001000XXXXXXXXXX";
                wait until (clock = '1');
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= std_logic_vector(to_unsigned(j, 8));
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

        -- Test Exclusive Or
        for i in 0 to max_value loop
            for j in 0 to max_value loop
                --    "001001rdddddrrrr";
                IR <= "001001XXXXXXXXXX";
                wait until (clock = '1');
                OperandA <= std_logic_vector(to_unsigned(i, 8));
                OperandB <= std_logic_vector(to_unsigned(j, 8));
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
                    report "Wrong answer for EOR(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) &
                        " (Got " & integer'image(to_integer(unsigned(Result))) & ")"
                severity ERROR;

                -- verify that result matches
                assert (std_match(StatReg, status))
                    report "Wrong status for EOR(" &
                        integer'image(to_integer(unsigned(OperandA))) & ", " &
                        integer'image(to_integer(unsigned(OperandB))) & ") = " &
                        integer'image(to_integer(unsigned(answer))) & " (Got " &
                        integer'image(to_integer(unsigned(StatReg))) & " instead of " &
                        integer'image(to_integer(unsigned(status))) & ")"
                severity ERROR;
            end loop;
        end loop;

        report "DONE WITH EOR";

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

