-- bring in the necessary packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;       --contains conversion functions

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity MEM_TEST_TB is
end MEM_TEST_TB;

architecture TB_ARCHITECTURE of MEM_TEST_TB is 
    signal IR      :  opcode_word;                      -- Instruction Register
    signal ProgDB  :  std_logic_vector(15 downto 0);    -- second word of instruction
    signal Reset   :  std_logic;                        -- system reset signal (active low)
    signal clock   :  std_logic;                        -- system clock
    signal DataAB  :  std_logic_vector(15 downto 0);    -- data address bus
    signal DataDB  :  std_logic_vector(7 downto 0);     -- data data bus
    signal DataRd  :  std_logic;                        -- data read (active low)
    signal DataWr  :  std_logic;                        -- data write (active low)

    signal end_sim :  boolean := false;                 -- end simulation flag
begin
    UUT : entity work.MEM_TEST
        port map (
            IR      => IR,
            ProgDB  => ProgDB,
            Reset   => Reset,
            clock   => clock,
            DataAB  => DataAB,
            DataDB  => DataDB,
            DataRd  => DataRd,
            DataWr  => DataWr
        );
    
    -- Main testing procedure
    process
        procedure run_LDI (
            d : std_logic_vector(3 downto 0);
            k : std_logic_vector(7 downto 0)) is
        begin
            wait until (clock = '1');
                -- 1110kkkkddddkkkk
            IR <= "1110XXXXXXXXXXXX";
            IR(11 downto 8) <= k(7 downto 4);
            IR( 3 downto 0) <= k(3 downto 0);
            IR( 7 downto 4) <= d;
        end procedure;

        procedure run_LDX (
            d : std_logic_vector(4 downto 0)) is
        begin
            wait until (clock = '1');
                -- 1001000ddddd1100
            IR <= "1001000XXXXX1100";
            IR(8 downto 4) <= d;
            wait until (clock = '1');
        end procedure;
    begin
        wait for 25 ns;

        run_LDI("0000", "00000000");
        for i in 0 to 16 loop
            run_LDI(std_logic_vector(to_unsigned(i, 4)), "0000" & std_logic_vector(to_unsigned(i, 4)));
        end loop;
        run_LDX("00000");

        wait until (clock = '1');
        wait until (clock = '1');
        report "DONE WITH SIMULATIONS";

        end_sim <= true;    --end of stimulus events
        wait;               --wait for the simulation to end
    end process;
    
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
end TB_ARCHITECTURE;

