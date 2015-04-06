----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Design Name:     AVR-Processor
-- Module Name:     Datamem - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     This component just describes a simple data RAM for the
--                  AVR CPU. Size: 64K x 8.
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
    -- define the type for the RAM
    type  RAMtype  is array (0 to 65535) of std_logic_vector(7 downto 0);

    -- now define the RAM itself (initialized to X)
    signal  RAMbits  :  RAMtype  := (others => (others => 'X'));
    
    -- debugging...
    signal  debugData : std_logic_vector(47 downto 0);
    
begin
    debugData(47 downto 40) <= RAMbits(65535);
    debugData(39 downto 32) <= RAMbits(65534);
    debugData(31 downto 24) <= RAMbits(65533);
    debugData(23 downto 16) <= RAMbits(65532);
    debugData(15 downto  8) <= RAMbits(65531);
    debugData(7  downto  0) <= RAMbits(65530);
    process
    begin
            -- wait for an input to change
        wait on  RE, WE, DataAB;

            -- first check if reading (active low read enable)
        if  (RE = '0')  then
            -- reading, put the data out
            DataDB <= RAMbits(CONV_INTEGER(DataAB));
        else
            -- not reading, send data bus to hi-Z
            DataDB <= "ZZZZZZZZ";
        end if;

        -- now check if writing
        if  (WE'event and (WE = '1'))  then
            -- rising edge of write - write the data
            RAMbits(CONV_INTEGER(DataAB)) <= DataDB;
            -- wait for the update to happen
            wait for 0 ns;
        end if;

        -- finally check if WE low with the address changing
        if  (DataAB'event and (WE = '0'))  then
            -- address changed with WE low - trash the old location
            RAMbits(CONV_INTEGER(DataAB'delayed)) <= DataDB'delayed;
        end if;
    end process;
end  RAM;
