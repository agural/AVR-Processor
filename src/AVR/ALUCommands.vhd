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


--  ALU Flags
    constant flag_C     :   integer := 0;
    constant flag_Z     :   integer := 1;
    constant flag_N     :   integer := 2;
    constant flag_V     :   integer := 3;
    constant flag_S     :   integer := 4;
    constant flag_H     :   integer := 5;
    constant flag_T     :   integer := 6;
    constant flag_I     :   integer := 7;
    
--  ALU Flag Masks                            ITHSVNZC
    constant flag_mask_ZCNVSH : std_logic_vector(7 downto 0) := "00111111";
    constant flag_mask_ZCNVS  : std_logic_vector(7 downto 0) := "00011111";
    constant flag_mask_ZNVS   : std_logic_vector(7 downto 0) := "00011110";
    constant flag_mask_T      : std_logic_vector(7 downto 0) := "01000000";
    constant flag_mask_ZC     : std_logic_vector(7 downto 0) := "00000011";
--  ALU commands



end package;