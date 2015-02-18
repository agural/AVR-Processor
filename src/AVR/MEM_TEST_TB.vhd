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

        procedure run_LDXI (
            d : std_logic_vector(4 downto 0);
            k : std_logic_vector(7 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(27) & Registers(26));
                -- 1001000ddddd1101
            IR <= "1001000XXXXX1101";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDXI 1";
            assert (DataWr = '1') report "LDXI 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDXI 3";
            assert (DataWr = '1') report "LDXI 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address);
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "LDXI 5";
            if (conv_integer(address) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "LDXI 6";
                assert (DataAB = address) report "LDXI 7";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(address));
                assert (DataRd = '1') report "LDXI 8";
            end if;

            wait until (clock = '1');
            DataDB <= (others => 'Z');
            address := std_logic_vector(unsigned(address) + 1);
            if (conv_integer(d) /= 27) then
                Registers(27) <= address(15 downto 8);
            end if;
            if (conv_integer(d) /= 26) then
                Registers(26) <= address(7 downto 0);
            end if;

            wait for 1 ns;
            assert (DataRd = '1') report "LDXI 9";
            assert (DataWr = '1') report "LDXI 10";
        end procedure;

        procedure run_LDXD (
            d : std_logic_vector(4 downto 0);
            k : std_logic_vector(7 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(27) & Registers(26));
            address := std_logic_vector(unsigned(address) - 1);
            Registers(27) <= address(15 downto 8);
            Registers(26) <= address(7 downto 0);

                -- 1001000ddddd1110
            IR <= "1001000XXXXX1110";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDXD 1";
            assert (DataWr = '1') report "LDXD 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDXD 3";
            assert (DataWr = '1') report "LDXD 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address);
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "LDXD 5";
            if (conv_integer(address) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "LDXD 6";
                assert (DataAB = address) report "LDXD 7";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(address));
                assert (DataRd = '1') report "LDXD 8";
            end if;

            wait until (clock = '1');
            DataDB <= (others => 'Z');

            wait for 1 ns;
            assert (DataRd = '1') report "LDXD 9";
            assert (DataWr = '1') report "LDXD 10";
        end procedure;

        procedure run_LDYI (
            d : std_logic_vector(4 downto 0);
            k : std_logic_vector(7 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(29) & Registers(28));
                -- 1001000ddddd1001
            IR <= "1001000XXXXX1001";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDYI 1";
            assert (DataWr = '1') report "LDYI 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDYI 3";
            assert (DataWr = '1') report "LDYI 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address);
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "LDYI 5";
            if (conv_integer(address) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "LDYI 6";
                assert (DataAB = address) report "LDYI 7";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(address));
                assert (DataRd = '1') report "LDYI 8";
            end if;

            wait until (clock = '1');
            DataDB <= (others => 'Z');
            address := std_logic_vector(unsigned(address) + 1);
            if (conv_integer(d) /= 29) then
                Registers(29) <= address(15 downto 8);
            end if;
            if (conv_integer(d) /= 28) then
                Registers(28) <= address(7 downto 0);
            end if;

            wait for 1 ns;
            assert (DataRd = '1') report "LDYI 9";
            assert (DataWr = '1') report "LDYI 10";
        end procedure;

        procedure run_LDYD (
            d : std_logic_vector(4 downto 0);
            k : std_logic_vector(7 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(29) & Registers(28));
            address := std_logic_vector(unsigned(address) - 1);
            Registers(29) <= address(15 downto 8);
            Registers(28) <= address(7 downto 0);

                -- 1001000ddddd1010
            IR <= "1001000XXXXX1010";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDYD 1";
            assert (DataWr = '1') report "LDYD 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDYD 3";
            assert (DataWr = '1') report "LDYD 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address);
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "LDYD 5";
            if (conv_integer(address) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "LDYD 6";
                assert (DataAB = address) report "LDYD 7";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(address));
                assert (DataRd = '1') report "LDYD 8";
            end if;

            wait until (clock = '1');
            DataDB <= (others => 'Z');

            wait for 1 ns;
            assert (DataRd = '1') report "LDYD 9";
            assert (DataWr = '1') report "LDYD 10";
        end procedure;


        procedure run_LDZI (
            d : std_logic_vector(4 downto 0);
            k : std_logic_vector(7 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(31) & Registers(30));
                -- 1001000ddddd0001
            IR <= "1001000XXXXX0001";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDZI 1";
            assert (DataWr = '1') report "LDZI 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDZI 3";
            assert (DataWr = '1') report "LDZI 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address);
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "LDZI 5";
            if (conv_integer(address) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "LDZI 6";
                assert (DataAB = address) report "LDZI 7";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(address));
                assert (DataRd = '1') report "LDZI 8";
            end if;

            wait until (clock = '1');
            DataDB <= (others => 'Z');
            address := std_logic_vector(unsigned(address) + 1);
            if (conv_integer(d) /= 31) then
                Registers(31) <= address(15 downto 8);
            end if;
            if (conv_integer(d) /= 30) then
                Registers(30) <= address(7 downto 0);
            end if;

            wait for 1 ns;
            assert (DataRd = '1') report "LDZI 9";
            assert (DataWr = '1') report "LDZI 10";
        end procedure;

        procedure run_LDZD (
            d : std_logic_vector(4 downto 0);
            k : std_logic_vector(7 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(31) & Registers(30));
            address := std_logic_vector(unsigned(address) - 1);
            Registers(31) <= address(15 downto 8);
            Registers(30) <= address(7 downto 0);

                -- 1001000ddddd0010
            IR <= "1001000XXXXX0010";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDZD 1";
            assert (DataWr = '1') report "LDZD 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDZD 3";
            assert (DataWr = '1') report "LDZD 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address);
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "LDZD 5";
            if (conv_integer(address) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "LDZD 6";
                assert (DataAB = address) report "LDZD 7";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(address));
                assert (DataRd = '1') report "LDZD 8";
            end if;

            wait until (clock = '1');
            DataDB <= (others => 'Z');

            wait for 1 ns;
            assert (DataRd = '1') report "LDZD 9";
            assert (DataWr = '1') report "LDZD 10";
        end procedure;


        procedure run_LDDY (
            d : std_logic_vector(4 downto 0);
            q : std_logic_vector(5 downto 0);
            k : std_logic_vector(7 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(29) & Registers(28)) + q;

                -- 10q0qq0ddddd1qqq
            IR <= "10X0XX0XXXXX1XXX";
            IR(8 downto 4) <= d;
            IR(13) <= q(5);
            IR(11 downto 10) <= q(4 downto 3);
            IR(2 downto 0) <= q(2 downto 0);

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDDY 1";
            assert (DataWr = '1') report "LDDY 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDDY 3";
            assert (DataWr = '1') report "LDDY 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address) report "LDDY 5";
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "LDDY 6";
            if (conv_integer(address) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "LDDY 7";
                assert (DataAB = address) report "LDDY 8";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(address));
                assert (DataRd = '1') report "LDDY 9";
            end if;

            wait until (clock = '1');
            DataDB <= (others => 'Z');

            wait for 1 ns;
            assert (DataRd = '1') report "LDDY 10";
            assert (DataWr = '1') report "LDDY 11";
        end procedure;

        procedure run_LDDZ (
            d : std_logic_vector(4 downto 0);
            q : std_logic_vector(5 downto 0);
            k : std_logic_vector(7 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(31) & Registers(30)) + q;

                -- 10q0qq0ddddd0qqq
            IR <= "10X0XX0XXXXX0XXX";
            IR(8 downto 4) <= d;
            IR(13) <= q(5);
            IR(11 downto 10) <= q(4 downto 3);
            IR(2 downto 0) <= q(2 downto 0);

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDDZ 1";
            assert (DataWr = '1') report "LDDZ 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDDZ 3";
            assert (DataWr = '1') report "LDDZ 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address) report "LDDZ 5";
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "LDDZ 6";
            if (conv_integer(address) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "LDDZ 7";
                assert (DataAB = address) report "LDDZ 8";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(address));
                assert (DataRd = '1') report "LDDZ 9";
            end if;

            wait until (clock = '1');
            DataDB <= (others => 'Z');

            wait for 1 ns;
            assert (DataRd = '1') report "LDDZ 10";
            assert (DataWr = '1') report "LDDZ 11";
        end procedure;

        procedure run_LDS (
            d : std_logic_vector(4 downto 0);
            k : std_logic_vector(7 downto 0);
            m : std_logic_vector(15 downto 0)) is
        begin
                -- 1001000ddddd0000
            IR <= "1001000XXXXX0000";
            IR(8 downto 4) <= d;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDS 1";
            assert (DataWr = '1') report "LDS 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDS 3";
            assert (DataWr = '1') report "LDS 4";
            ProgDB <= m;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "LDS 5";
            assert (DataWr = '1') report "LDS 6";
            if (conv_integer(m) > 95) then
                assert (DataAB = m) report "LDS 7";
            end if;

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "LDS 8";
            assert (DataWr = '1') report "LDS 9";
            if (conv_integer(m) > 95) then
                assert (DataAB = m) report "LDS 10";
            end if;
            ProgDB <= (others => 'Z');

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataWr = '1') report "LDS 11";
            if (conv_integer(m) > 95) then
                Registers(conv_integer(d)) <= k;
                assert (DataRd = '0') report "LDS 12";
                assert (DataAB = m) report "LDS 13";
                DataDB <= k;
            else
                Registers(conv_integer(d)) <= Registers(conv_integer(m));
                assert (DataRd = '1') report "LDS 14";
            end if;

            wait until (clock = '1');
            DataDB <= (others => 'Z');

            wait for 1 ns;
            assert (DataRd = '1') report "LDS 15";
            assert (DataWr = '1') report "LDS 16";
        end procedure;

        procedure run_MOV (
            d : std_logic_vector(4 downto 0);
            r : std_logic_vector(4 downto 0)) is
        begin
                -- 001011rdddddrrrr
            IR <= "001011XXXXXXXXXX";
            IR(8 downto 4) <= d;
            IR(9) <= r(4);
            IR(3 downto 0) <= r(3 downto 0);
            Registers(conv_integer(d)) <= Registers(conv_integer(r));

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "MOV 1";
            assert (DataWr = '1') report "MOV 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "MOV 3";
            assert (DataWr = '1') report "MOV 4";
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
            assert (DataRd = '1') report "STX 1";
            assert (DataWr = '1') report "STX 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "STX 3";
            assert (DataWr = '1') report "STX 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address) report "STX 5";
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "STX 6";
            if (conv_integer(address) > 95) then
                assert (DataWr = '0') report "STX 7";
                assert (DataAB = address) report "STX 8";
                assert (DataDB = Registers(conv_integer(d))) report "STX 9";
            else
                Registers(conv_integer(address)) <= Registers(conv_integer(d));
                assert (DataWr = '1') report "STX 10";
            end if;

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "STX 11";
            assert (DataWr = '1') report "STX 12";
        end procedure;

        procedure run_STXI (
            d : std_logic_vector(4 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(27) & Registers(26));
                -- 1001001rrrrr1101
            IR <= "1001001XXXXX1101";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "STXI 1";
            assert (DataWr = '1') report "STXI 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "STXI 3";
            assert (DataWr = '1') report "STXI 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address) report "STXI 6";
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "STXI 7";
            if (conv_integer(address) > 95) then
                assert (DataWr = '0') report "STXI 8";
                assert (DataAB = address) report "STXI 9";
                assert (DataDB = Registers(conv_integer(d))) report "STXI 10";
            else
                Registers(conv_integer(address)) <= Registers(conv_integer(d));
                assert (DataWr = '1') report "STXI 11";
            end if;

            wait until (clock = '1');
            address := std_logic_vector(unsigned(address) + 1);
            if (conv_integer(d) /= 27) then
                Registers(27) <= address(15 downto 8);
            end if;
            if (conv_integer(d) /= 26) then
                Registers(26) <= address(7 downto 0);
            end if;

            wait for 1 ns;
            assert (DataRd = '1') report "STXI 12";
            assert (DataWr = '1') report "STXI 13";
        end procedure;

        procedure run_STXD (
            d : std_logic_vector(4 downto 0)) is
            variable address : std_logic_vector(15 downto 0);
        begin
            address := (Registers(27) & Registers(26));
            address := std_logic_vector(unsigned(address) - 1);
            Registers(27) <= address(15 downto 8);
            Registers(26) <= address(7 downto 0);

                -- 1001001rrrrr1110
            IR <= "1001001XXXXX1110";
            IR(8 downto 4) <= d;
            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "STXD 1";
            assert (DataWr = '1') report "STXD 2";

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "STXD 3";
            assert (DataWr = '1') report "STXD 4";
            if (conv_integer(address) > 95) then
                assert (DataAB = address) report "STXD 6";
            end if;

            wait until (clock = '0');
            wait for 1 ns;
            assert (DataRd = '1') report "STXD 7";
            if (conv_integer(address) > 95) then
                assert (DataWr = '0') report "STXD 8";
                assert (DataAB = address) report "STXD 9";
                assert (DataDB = Registers(conv_integer(d))) report "STXD 10";
            else
                Registers(conv_integer(address)) <= Registers(conv_integer(d));
                assert (DataWr = '1') report "STXD 11";
            end if;

            wait until (clock = '1');
            wait for 1 ns;
            assert (DataRd = '1') report "STXD 12";
            assert (DataWr = '1') report "STXD 13";
        end procedure;

    begin
        IR <= (others => '0');
        Reset <= '1'; -- No reset
        DataDB <= (others => 'Z');
        wait for 25 ns;

        wait until (clock = '1');
        report "START SIMULATIONS";

        for i in 0 to 95 loop
            -- Set register 27 (high byte of X)
            run_LDI("1011", "00000000");
            -- Set register 26 (low byte of X)
            run_LDI("1010", std_logic_vector(to_unsigned(i, 8)));

            -- Put value in register 16
            run_LDI("0000", std_logic_vector(to_unsigned(i, 8)));

            -- Copy from register 16 to each register
            run_STX("10000");

            if (i < 32) then
                -- Set register 27 (high byte of X)
                run_LDI("1011", "00000000");
                -- Set register 26 (low byte of X)
                run_LDI("1010", "11111111"); -- somewhere in memory
                -- Test store (check value in register)
                run_STX(std_logic_vector(to_unsigned(i, 5)));
            end if;
        end loop;
        -- all registers and I/O have a valid value now

        -- test LDX
        -- loads value into each register and then stores to make sure value is correct
        for reg in 0 to 31 loop
            for i in 0 to 100 loop -- go through enough to check Registers, IO, and Memory
                -- Set register 27 (high byte of X)
                run_LDI("1011", "00000000");
                -- Set register 26 (low byte of X)
                run_LDI("1010", std_logic_vector(to_unsigned(i, 8)));
                run_LDX(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 8)));
                run_STX(std_logic_vector(to_unsigned(reg, 5)));
            end loop;

            for i in 1 to 10 loop -- check non-zero values for upper byte
                -- Set register 27 (high byte of X)
                run_LDI("1011", std_logic_vector(to_unsigned(i, 8)));
                -- Set register 26 (low byte of X)
                run_LDI("1010", std_logic_vector(to_unsigned(i, 8)));
                run_LDX(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 8)));
                run_STX(std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with LDX";

        -- test LDXI
        -- Set register 27 (high byte of X)
        run_LDI("1011", "00000000");
        -- Set register 26 (low byte of X)
        run_LDI("1010", "00000000");
        for reg in 0 to 31 loop
            for i in 0 to 10 loop -- go through Registers, IO, and Memory, and inc upper byte
                run_LDXI(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 8)));
                run_STX (std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with LDXI";

        -- test LDXD
        -- Set register 27 (high byte of X)
        run_LDI("1011", "00000001");
        -- Set register 26 (low byte of X)
        run_LDI("1010", "00000000");
        for reg in 0 to 10 loop
            for i in 0 to 9 loop -- go through Registers, IO, and Memory, and inc upper byte
                run_LDXD(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 8)));
                run_STX (std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with LDXD";

        -- test LDYI
        -- Set register 29 (high byte of Y)
        run_LDI("1101", "00000000");
        -- Set register 28 (low byte of Y)
        run_LDI("1100", "00000000");
        for reg in 0 to 31 loop
            for i in 0 to 10 loop -- go through Registers, IO, and Memory, and inc upper byte
                run_LDYI(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 8)));
                run_STX (std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with LDYI";

        -- test LDYD
        -- Set register 29 (high byte of Y)
        run_LDI("1101", "00000001");
        -- Set register 28 (low byte of Y)
        run_LDI("1100", "00000000");
        for reg in 0 to 10 loop
            for i in 0 to 9 loop -- go through Registers, IO, and Memory, and inc upper byte
                run_LDYD(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 8)));
                run_STX (std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with LDYD";

        -- test LDZI
        -- Set register 31 (high byte of Z)
        run_LDI("1111", "00000000");
        -- Set register 30 (low byte of Z)
        run_LDI("1110", "00000000");
        for reg in 0 to 31 loop
            for i in 0 to 10 loop -- go through Registers, IO, and Memory, and inc upper byte
                run_LDZI(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 8)));
                run_STX (std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with LDZI";

        -- test LDZD
        -- Set register 31 (high byte of Z)
        run_LDI("1111", "00000001");
        -- Set register 30 (low byte of Z)
        run_LDI("1110", "00000000");
        for reg in 0 to 10 loop
            for i in 0 to 9 loop -- go through Registers, IO, and Memory, and inc upper byte
                run_LDZD(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 8)));
                run_STX (std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with LDZD";

        -- fill registers with distinct values to make errors easier to detect
        for i in 0 to 31 loop
            -- Set register i to i (fill with distinct values)
            run_LDI(std_logic_vector(to_unsigned(i, 5)), std_logic_vector(to_unsigned(i, 8)));
        end loop;

        -- test LDDY
        for reg in 0 to 31 loop
            for start in 94 to 96 loop -- values near IO to mem border
                -- Set register 29 (high byte of Y)
                run_LDI("1101", "00000000");
                -- Set register 28 (low byte of Y)
                run_LDI("1100", std_logic_vector(to_unsigned(start, 8)));
                for i in 0 to 10 loop
                    run_LDDY(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 8)));
                    run_STX (std_logic_vector(to_unsigned(reg, 5)));
                end loop;
            end loop;
        end loop;
        report "Done with LDDY";

        -- fill registers with distinct values to make errors easier to detect
        for i in 0 to 31 loop
            -- Set register i to i (fill with distinct values)
            run_LDI(std_logic_vector(to_unsigned(i, 5)), std_logic_vector(to_unsigned(i, 8)));
        end loop;

        -- test LDDZ
        for reg in 0 to 31 loop
            for start in 94 to 96 loop -- values near IO to mem border
                -- Set register 31 (high byte of Z)
                run_LDI("1111", "00000000");
                -- Set register 30 (low byte of Z)
                run_LDI("1110", std_logic_vector(to_unsigned(start, 8)));
                for i in 0 to 10 loop
                    run_LDDZ(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 8)));
                    run_STX (std_logic_vector(to_unsigned(reg, 5)));
                end loop;
            end loop;
        end loop;
        report "Done with LDDZ";

        -- test LDS
        for reg in 0 to 31 loop
            for i in 0 to 100 loop -- go through Registers, IO, and Memory
                run_LDS(std_logic_vector(to_unsigned(reg, 5)), std_logic_vector(to_unsigned(i, 8)), std_logic_vector(to_unsigned(i, 16)));
                run_STX(std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with LDS";

        -- test LDS
        for i in 0 to 31 loop
            for j in 0 to 31 loop
                run_MOV(std_logic_vector(to_unsigned(i, 5)), std_logic_vector(to_unsigned(j, 5)));

                -- Set register 27 (high byte of X)
                run_LDI("1011", "00000000");
                -- Set register 26 (low byte of X)
                run_LDI("1010", "11111111"); -- somewhere in memory
                -- try to store (and check value in register)
                run_STX(std_logic_vector(to_unsigned(i, 5)));
            end loop;
        end loop;
        report "Done with MOV";

        -- test STXI
        for reg in 0 to 5 loop
            -- Set register 27 (high byte of X)
            run_LDI("1011", "00000000");
            -- Set register 26 (low byte of X)
            run_LDI("1010", "00011100"); -- start after X registers
            for i in 0 to 100 loop
                run_STXI(std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with STXI";

        -- test STXD
        for reg in 0 to 5 loop
            -- Set register 27 (high byte of X)
            run_LDI("1011", "00000000");
            -- Set register 26 (low byte of X)
            run_LDI("1010", std_logic_vector(to_unsigned(150, 8))); -- start in memory
            for i in 0 to 100 loop
                run_STXD(std_logic_vector(to_unsigned(reg, 5)));
            end loop;
        end loop;
        report "Done with STXD";
        
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

