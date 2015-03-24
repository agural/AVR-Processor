----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Design Name:     AVR-Processor
-- Module Name:     Progmem - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     This component just describes a simple program ROM for the
--                  AVR CPU.
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------

--
--  PROG_MEMORY
--
--  This is the program memory component.  It is just a fixed ROM with no
--  timing information.  It is meant to be connected to the AVR CPU. The ROM
--  is always enabled and may be changed when Reset it active.
--
--  Inputs:
--    ProgAB - address bus (16 bits)
--    Reset  - system reset (active low)
--
--  Outputs:
--    ProgDB - program memory data bus (16 bits)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity ProgMemory is
    port (
        ProgAB  :  in   std_logic_vector(15 downto 0);  -- program address bus
        Reset   :  in   std_logic;                      -- system reset
        ProgDB  :  out  std_logic_vector(15 downto 0)   -- program data bus
    );
end ProgMemory;


architecture ROM of ProgMemory is

    -- define the type for the ROM (an array)
    type  ROMtype  is array(0 to 333) of std_logic_vector(15 downto 0);

    -- define the actual ROM (initialized to a simple program)
    signal  ROMbits  :  ROMtype  :=  ( X"9488", X"94F8", X"94C8", X"94B8",
                                       X"9498", X"94D8", X"94A8", X"94E8",
                                       X"9448", X"9418", X"9478", X"9408",
                                       X"9428", X"9468", X"9458", X"9438",
                                       X"E000", X"2E00", X"2E10", X"2E20",
                                       X"2E30", X"2E40", X"2E50", X"2E60",
                                       X"2E70", X"F807", X"F813", X"F821",
                                       X"F836", X"F840", X"F855", X"F864",
                                       X"F872", X"ED4F", X"2E84", X"E044",
                                       X"2E94", X"E74F", X"2EA4", X"E041",
                                       X"2EB4", X"EF4D", X"2EC4", X"E440",
                                       X"2ED4", X"EF47", X"2EE4", X"E140",
                                       X"2EF4", X"FA85", X"FA92", X"FAA7",
                                       X"FAB0", X"FAC1", X"FAD6", X"FAE3",
                                       X"FAF4", X"EF0F", X"EF1F", X"E020",
                                       X"E730", X"E040", X"E75E", X"E76E",
                                       X"E870", X"E485", X"E890", X"EFA0",
                                       X"EFBF", X"E5C5", X"EADA", X"E7E0",
                                       X"E3FF", X"1F01", X"1F02", X"1F21",
                                       X"1F95", X"1D60", X"0F95", X"0F01",
                                       X"0F24", X"0D70", X"9600", X"9650",
                                       X"231C", X"231D", X"220F", X"7FCF",
                                       X"7F0F", X"7FDF", X"9505", X"95B5",
                                       X"95E5", X"95D5", X"9500", X"9500",
                                       X"95C0", X"95C0", X"1710", X"175A",
                                       X"15F3", X"0710", X"0751", X"0715",
                                       X"0750", X"E4E0", X"E7FF", X"371F",
                                       X"37E0", X"3AF0", X"2FE3", X"951A",
                                       X"940A", X"95EA", X"951A", X"2F1C",
                                       X"271D", X"271C", X"2721", X"2720",
                                       X"2788", X"9583", X"9563", X"9563",
                                       X"9403", X"95AA", X"E8F0", X"95A6",
                                       X"95E6", X"9546", X"95F6", X"9501",
                                       X"9561", X"9401", X"9551", X"2B21",
                                       X"2B2C", X"2B61", X"6F1F", X"679D",
                                       X"9517", X"9537", X"9507", X"9407",
                                       X"9507", X"E5F0", X"0B01", X"47F0",
                                       X"0AA4", X"E79F", X"E781", X"47AF",
                                       X"0B91", X"4A80", X"E08D", X"E090",
                                       X"9740", X"9700", X"E7EF", X"E7FF",
                                       X"1B01", X"1BE1", X"1BF4", X"E5E0",
                                       X"E7F1", X"574F", X"57E0", X"5AF0",
                                       X"9552", X"94A2", X"95B2", X"93AF",
                                       X"93BF", X"93CF", X"93DF", X"93EF",
                                       X"93FF", X"900F", X"901F", X"EFBF",
                                       X"EFAF", X"EFDF", X"ECC0", X"E0F0",
                                       X"E8E0", X"9200", X"5555", X"9210",
                                       X"AAAA", X"922C", X"923E", X"924D",
                                       X"925D", X"926C", X"9279", X"8288",
                                       X"929A", X"82A8", X"AEBC", X"82CA",
                                       X"8ADE", X"82E9", X"92F1", X"8300",
                                       X"9312", X"8320", X"8F36", X"8341",
                                       X"AF57", X"A360", X"EFDF", X"EEC0",
                                       X"937A", X"9389", X"AF9F", X"E0B0",
                                       X"E0A0", X"EFDF", X"EFCF", X"EFFF",
                                       X"ECE0", X"9000", X"AAAA", X"9010",
                                       X"5555", X"907C", X"909E", X"914D",
                                       X"915C", X"9069", X"8178", X"916A",
                                       X"8CFE", X"9041", X"80D0", X"9022",
                                       X"AD14", X"940C", X"00F2", X"E56A",
                                       X"E57A", X"C002", X"EA85", X"CFFB",
                                       X"EFE9", X"E0F0", X"9409", X"E0B0",
                                       X"E0C0", X"940E", X"0146", X"D04A",
                                       X"E4E6", X"E0F1", X"9509", X"17CB",
                                       X"F010", X"940C", X"00FF", X"F3DC",
                                       X"F3D1", X"F411", X"940C", X"00FF",
                                       X"E659", X"0F55", X"F7A5", X"2BBB",
                                       X"F012", X"940C", X"00FF", X"2BCC",
                                       X"F372", X"F412", X"940C", X"00FF",
                                       X"2BBB", X"F74A", X"1BCB", X"F013",
                                       X"940C", X"00FF", X"95CA", X"F71B",
                                       X"30B1", X"F70C", X"94F8", X"F2FF",
                                       X"940E", X"014A", X"F6E7", X"FBE1",
                                       X"F6D6", X"FBE3", X"F2C6", X"0FEE",
                                       X"F410", X"940C", X"00FF", X"0FEE",
                                       X"F690", X"F015", X"940C", X"00FF",
                                       X"1367", X"CFFE", X"1367", X"940C",
                                       X"0130", X"1368", X"E860", X"FD66",
                                       X"EF6F", X"FD63", X"940C", X"0130",
                                       X"FD67", X"EA65", X"FF60", X"E060",
                                       X"FF65", X"940C", X"0130", X"FF61",
                                       X"940C", X"0000", X"EFBF", X"E7CF",
                                       X"E0D0", X"9508", X"EF9F", X"E7AF",
                                       X"E6E6", X"9518"                    );


begin
    -- the address has changed - read the new value
    ProgDB <= ROMbits(CONV_INTEGER(ProgAB)) when (CONV_INTEGER(ProgAB) <= ROMbits'high)  else
              X"E0C0";

    -- process to handle Reset
    process(Reset)
    begin
        -- check if Reset is low now
        if  (Reset = '0')  then
            -- reset is active - initialize the ROM (nothing for now)
        end if;
    end process;
end ROM;
