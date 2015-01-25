-----------------------------------------------------------------------------
--
--  AVR opcode package
--
--  This package defines opcode constants for the complete AVR instruction
--  set.  Not all variants of the AVR implement all instructions.
--
--  Revision History
--      4/27/98   Glen George		initial revision
--      4/14/00   Glen George		updated comments
--      4/22/02   Glen George		added new instructions
--      4/22/02   Glen George		updated comments
--      5/16/02   Glen George		fixed LPM instruction constant
--
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package ALUCommands is

   subtype  opcode_word  is  std_logic_vector(15 downto 0);

--  ALU commands

   constant thing    :  opcode_word := "000111----------";   -- ADC Rd, Rr


end package;