----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Design Name:     AVR-Processor
-- Module Name:     Datamem (small) - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     This component just describes a simple data RAM for the
--                  AVR CPU. Size: 64K x 8. The RAM is actually only 640 bytes
--                  (0000-007F and FE00-FFFF) and any reads outside that address
--                  range return 'X' and writes outside the range generate errors.
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------


--
--  DATA_MEMORY
--
--  This is the data memory component.  It is just a 64 Kbyte RAM with no
--  timing information.  It is meant to be connected to the AVR CPU.
--
--  Inputs:
--    RE     - read enable (active low)
--    WE     - write enable (active low)
--    DataAB - memory address bus (16 bits)
--
--  Inputs/Outputs:
--    DataDB - memory data bus (8 bits)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity DataMemory is
    port (
        RE      : in     std_logic;             	    -- read enable (active low)
        WE      : in     std_logic;		                -- write enable (active low)
        DataAB  : in     std_logic_vector(15 downto 0); -- memory address bus
        DataDB  : inout  std_logic_vector(7 downto 0)   -- memory data bus
    );
end DataMemory;

architecture RAM of DataMemory is
    -- define the type for the RAM (128 byte RAM)
    type  RAMtype  is array (0 to 127) of std_logic_vector(7 downto 0);

    -- now define the RAMs (initialized to X)
    signal  RAMbits0000  :  RAMtype  := (others => (others => 'X'));
    signal  RAMbitsFE00  :  RAMtype  := (others => (others => 'X'));
    signal  RAMbitsFE80  :  RAMtype  := (others => (others => 'X'));
    signal  RAMbitsFF00  :  RAMtype  := (others => (others => 'X'));
    signal  RAMbitsFF80  :  RAMtype  := (others => (others => 'X'));

begin
    process
    begin
            -- wait for an input to change
        wait on  RE, WE, DataAB;

            -- first check if reading
        if  (RE = '0')  then
            -- reading, put the data out (check address)
            if  (CONV_INTEGER(DataAB) < 128)  then
                DataDB <= RAMbits0000(CONV_INTEGER(DataAB));
            elsif  (CONV_INTEGER(DataAB) >= 16#FF80#)  then
                DataDB <= RAMbitsFF80(CONV_INTEGER(DataAB - 16#FF80#));
            elsif  (CONV_INTEGER(DataAB) >= 16#FF00#)  then
                DataDB <= RAMbitsFF00(CONV_INTEGER(DataAB - 16#FF00#));
            elsif  (CONV_INTEGER(DataAB) >= 16#FE80#)  then
                DataDB <= RAMbitsFE80(CONV_INTEGER(DataAB - 16#FE80#));
            elsif  (CONV_INTEGER(DataAB) >= 16#FE00#)  then
                DataDB <= RAMbitsFE00(CONV_INTEGER(DataAB - 16#FE00#));
            else
                    -- out of any allowable address range - set output to X
                DataDB <= "XXXXXXXX";
                end if;
        else
            -- not reading, send data bus to hi-Z
            DataDB <= "ZZZZZZZZ";
        end if;

        -- now check if writing
        if  (WE'event and (WE = '1'))  then
            -- rising edge of write - write the data (check which address range)
            if  (CONV_INTEGER(DataAB) < 128)  then
                RAMbits0000(CONV_INTEGER(DataAB)) <= DataDB;
            elsif  (CONV_INTEGER(DataAB) >= 16#FF80#)  then
                RAMbitsFF80(CONV_INTEGER(DataAB - 16#FF80#)) <= DataDB;
            elsif  (CONV_INTEGER(DataAB) >= 16#FF00#)  then
                RAMbitsFF00(CONV_INTEGER(DataAB - 16#FF00#)) <= DataDB;
            elsif  (CONV_INTEGER(DataAB) >= 16#FE80#)  then
                RAMbitsFE80(CONV_INTEGER(DataAB - 16#FE80#)) <= DataDB;
            elsif  (CONV_INTEGER(DataAB) >= 16#FE00#)  then
                RAMbitsFE00(CONV_INTEGER(DataAB - 16#FE00#)) <= DataDB;
                else
                    -- out of any allowable address range - generate an error
                    assert (false)
                        report  "Attempt to write to a non-existant address"
                        severity  ERROR;
                end if;
            -- wait for the update to happen
            wait for 0 ns;
        end if;

        -- finally check if WE low with the address changing
        if  (DataAB'event and (WE = '0'))  then
            REPORT "Glitch on Data Address bus"
            SEVERITY  ERROR;
        end if;
    end process;
end RAM;
