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

--  ALU Blocks for ALUBlockSel
    constant ALUAddBlock    : std_logic_vector(1 downto 0) := "00";
    constant ALUFBlock      : std_logic_vector(1 downto 0) := "01";
    constant ALUShiftBlock  : std_logic_vector(1 downto 0) := "10";
    constant ALUMulBlock    : std_logic_vector(1 downto 0) := "11";
    
--  ALU Block Instructions for BlockInstructionSel
    --F Block
    constant FBlockZERO         : std_logic_vector(3 downto 0) := "0000";
    constant FBlockNOR          : std_logic_vector(3 downto 0) := "0001";
    constant FBlockNOTA         : std_logic_vector(3 downto 0) := "0011";
    constant FBlockNOTB         : std_logic_vector(3 downto 0) := "0101";
    constant FBlockXOR          : std_logic_vector(3 downto 0) := "0110";
    constant FBlockNAND         : std_logic_vector(3 downto 0) := "0111";
    constant FBlockAND          : std_logic_vector(3 downto 0) := "1000";
    constant FBlockXNOR         : std_logic_vector(3 downto 0) := "1001";
    constant FBlockOR           : std_logic_vector(3 downto 0) := "1110";
    constant FBlockONE          : std_logic_vector(3 downto 0) := "1111";
    
    --Shift Block
    --bit 2 - shift 1 vs shift 4
    --bit 1:0 - high bit source: 00 => 0, 01 => A0, 10 => An
    constant ShiftBlockArith    : std_logic_vector(3 downto 0) := "0010";
    constant ShiftBlockLog      : std_logic_vector(3 downto 0) := "0000";
    constant ShiftBlockRot      : std_logic_vector(3 downto 0) := "0001";
    constant ShiftBlockSwap     : std_logic_vector(3 downto 0) := "0100";
    
    --Add Block
    constant AddBlockAdd        : std_logic_vector(3 downto 0) := "0000";
    constant AddBlockSub        : std_logic_vector(3 downto 0) := "0010";
    constant AddBlockAddCarry   : std_logic_vector(3 downto 0) := "0001";
    constant AddBlockSubCarry   : std_logic_vector(3 downto 0) := "0011";
    constant AddBlockNeg        : std_logic_vector(3 downto 0) := "0100";
    
    --Multiply Block
    constant MulBlockLowByte    : std_logic_vector(3 downto 0) := "0000";
    constant MulBlockHighByte    : std_logic_vector(3 downto 0) := "0001";
    
    
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
    constant flag_mask_KEEPALL: std_logic_vector(7 downto 0) := "00000000";
    

--  ALU Operand 2 Select (ALUOp2Sel) Values
    constant RegOp2         : std_logic := '0';     --Operand 2 is from registers
    constant ImmedOp2       : std_logic := '1';     --Operand 2 is immediate
    
    constant StatusBitClear : std_logic := '0';
    constant StatusBitSet   : std_logic := '1';

end package;