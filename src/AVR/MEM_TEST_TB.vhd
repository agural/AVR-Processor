-- bring in the necessary packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;       --contains conversion functions
use ieee.std_logic_unsigned.all;

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

    -- define the registers
    constant NUM_REGS : integer := 96; -- number of registers (including IO)
    type REG_ARRAY is array (0 to NUM_REGS-1) of std_logic_vector(7 downto 0);
    signal Registers : REG_ARRAY;

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
                -- 1110kkkkddddkkkk
            IR <= "1110XXXXXXXXXXXX";
            IR(11 downto 8) <= k(7 downto 4);
            IR( 3 downto 0) <= k(3 downto 0);
            IR( 7 downto 4) <= d;
            Registers(conv_integer('1' & d)) <= k;
            wait until (clock = '1');
        end procedure;

        procedure run_LDX (
            d : std_logic_vector(4 downto 0);
            k : std_logic_vector(7 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(27) & Registers(26));
                -- 1001000ddddd1100 report integer'image(reg);
            IR <= "1001000XXXXX1100";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "DataRd error 1";
            assert (DataWr = '1') report "DataWr error 1";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "DataRd error 2";
            assert (DataWr = '1') report "DataWr error 2";
            if (conv_integer(address) > 95) then
                assert (DataAB = address) report "AB error 1";
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "DataWr error 3";
            if (conv_integer(address) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "DataRd error 3a";
                assert (DataAB = address) report "AB error 2";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(address));
                assert (DataRd = '1') report "DataRd error 3b";
            end if;

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "DataRd error 4";
            assert (DataWr = '1') report "DataWr error 4";
            DataDB <= (others => 'Z');

        end procedure;

        procedure run_STX (
            d : std_logic_vector(4 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(27) & Registers(26));
                -- 1001001rrrrr1100
            IR <= "1001001XXXXX1100";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1');
            assert (DataWr = '1');

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1');
            assert (DataWr = '1');
            if (conv_integer(address) > 95) then
                assert (DataAB = address);
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1');
            if (conv_integer(address) > 95) then
                assert (DataWr = '0');
                assert (DataAB = address);
                assert (DataDB = Registers(conv_integer(d)));
            else
                Registers(conv_integer(address)) <= Registers(conv_integer(d));
                assert (DataWr = '1');
            end if;

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1');
            assert (DataWr = '1');
        end procedure;
    begin
        IR <= (others => '0');
        wait for 25 ns;

        wait until (clock = '1');
        report "START SIMULATIONS";

        for reg in 0 to 31 loop
            for i in 0 to 255 loop -- go through enough to check Registers, IO, and Memory
                -- Set register 27 (high byte of X)
                run_LDI("1011", "00000000");
                -- Set register 26 (low byte of X)
                run_LDI("1010", std_logic_vector(to_unsigned(i, 8)));
                run_LDX(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(reg, 8)));
                run_STX(std_logic_vector(to_unsigned(reg, 5)));
            end loop;

            for i in 0 to 255 loop -- check non-zero values for upper byte
                -- Set register 27 (high byte of X)
                run_LDI("1011", std_logic_vector(to_unsigned(i, 8)));
                -- Set register 26 (low byte of X)
                run_LDI("1010", std_logic_vector(to_unsigned(i, 8)));
                run_LDX(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(reg, 8)));
                run_STX(std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;

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

