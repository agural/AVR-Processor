----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:13 01/25/2015 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--    constant ALUAddBlock    : std_logic_vector(1 downto 0) := "00";
--    constant ALUFBlock      : std_logic_vector(1 downto 0) := "01";
--    constant ALUShiftBlock  : std_logic_vector(1 downto 0) := "10";
--    constant ALUMulBlock    : std_logic_vector(1 downto 0) := "11";


--component BitSerialMultiplier
--   generic (
--       numbits  :  integer := 8   -- number of bits in the inputs
--   );
--
--   port (
--       A      :  in      std_logic_vector((numbits - 1) downto 0);     -- multiplicand
--       B      :  in      std_logic_vector((numbits - 1) downto 0);     -- multiplier
--       START  :  in      std_logic;                                    -- start calculation
--       CLK    :  in      std_logic;                                    -- clock
--       Q      :  buffer  std_logic_vector((2 * numbits - 1) downto 0); -- product
--       DONE   :  out     std_logic                                     -- calculation completed
--   );
--end component;
--   
--   constant numbits : integer := 8;    -- number of bits in the inputs
--    -- Stimulus signals - signals mapped to the input ports of tested entity
--   signal  A      :   std_logic_vector((numbits - 1) downto 0);     -- multiplicand
--   signal  B      :   std_logic_vector((numbits - 1) downto 0);     -- multiplier
--   signal  START  :   std_logic;                                    -- start calculation
--   signal  CLK    :   std_logic;                                    -- clock
--   signal  Q      :   std_logic_vector((2 * numbits - 1) downto 0); -- product
--   signal  DONE   :   std_logic;                                    -- calculation completed
--   
--   signal  END_SIM     :  BOOLEAN := FALSE;                         -- end simulation flag
--   signal  ExpectedQ :   std_logic_vector((2 * numbits - 1) downto 0); -- product
--   
--begin
--
--   -- Unit Under Test port map
--   UUT : BitSerialMultiplier
--       port map(
--           A     => A    ,
--           B     => B    ,
--           START => START,
--           CLK   => CLK  ,
--           Q     => Q    ,
--           DONE  => DONE 
--       );


entity ALU is
    port (
        clock                   :  in  std_logic;                          -- the system clock
        
        ALUBlockSel             :  in  std_logic_vector(1 downto 0);
        ALUBlockInstructionSel  :  in  std_logic_vector(3 downto 0);
        
        ALUOp2Sel               :  in  std_logic;
        ImmediateOut            :  in  std_logic_vector(7 downto 0);
        
        ALUStatusMask           :  in  std_logic_vector(7 downto 0);
        ALUStatusBitChangeEn    :  in  std_logic;
        ALUBitClrSet            :  in  std_logic;
        ALUBitTOp               :  in  std_logic;
        
        RegAOut                 :  in  std_logic_vector(7 downto 0);
        RegBOut                 :  in  std_logic_vector(7 downto 0);
        
        RegIn                   : out  std_logic_vector(7 downto 0)
    );
end ALU;

architecture DataFlow of ALU is
    component ALUFBlock
        port (
            operand     : in  std_logic_vector(3 downto 0);
            opA         : in  std_logic_vector(7 downto 0);
            opB         : in  std_logic_vector(7 downto 0);
            
            result      : out std_logic_vector(7 downto 0)
        );
    end component;
    
    signal opA      : std_logic_vector(7 downto 0);
    signal opB      : std_logic_vector(7 downto 0);
begin
    opB <= regBOut when (ALUOp2Sel = '0') else ImmediateOut;

    FBlock : ALUFBlock
    port map (ALUBlockInstructionSel, opA, opB, RegIn);
    
    

end DataFlow;

