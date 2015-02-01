----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:58 01/25/2015 
-- Design Name: 
-- Module Name:    ALUMulBlock - Behavioral 
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

entity ALUMulBlock is
    port (
        operand     : in  std_logic;
        opA         : in  std_logic_vector(7 downto 0);
        opB         : in  std_logic_vector(7 downto 0);
        
        carry       : out std_logic;
        result      : out std_logic_vector(7 downto 0)
    );
end ALUMulBlock;

architecture DataFlow of ALUMulBlock is
    signal leftover : std_logic_vector(7 downto 0);
    signal partial  : std_logic_vector(11 downto 0);
begin
    result   <= partial(7 downto 0);
    carry    <= partial(8);
    leftover <= std_logic_vector(to_signed(0, 4)) & partial(11 downto 8);
    process(operand, opA, opB)
    begin
        -- compute low byte
        -- we do this by splitting up the operands into low and high nibbles
        -- A * B = (AH + AL) * (BH + BL) = AH * BH + AH * BL + AL * BH + AL * BL
        -- the low byte is the low byte of AH * BL + AL * BH + AL * BL
        if (operand = '0') then
            partial  <= std_logic_vector((signed(opA(3 downto 0) & std_logic_vector(to_signed(0, 2))) *
                                          signed(opB(7 downto 4) & std_logic_vector(to_signed(0, 2)))  ) +
                                         (signed(opA(7 downto 4) & std_logic_vector(to_signed(0, 2))) *
                                          signed(opB(3 downto 0) & std_logic_vector(to_signed(0, 2)))  ) +
                                         (signed(std_logic_vector(to_signed(0, 2)) & opA(3 downto 0)) *
                                          signed(std_logic_vector(to_signed(0, 2)) & opB(3 downto 0))  ));
        -- the high byte is the sum of AH * BH and the leftover from the low byte computation
        else
            partial  <= std_logic_vector((signed(std_logic_vector(to_signed(0, 2)) & opA(7 downto 4)) *
                                          signed(std_logic_vector(to_signed(0, 2)) & opB(7 downto 4))  ) +
                                         signed("0000" & leftover));
        end if;
    end process;
end DataFlow;

