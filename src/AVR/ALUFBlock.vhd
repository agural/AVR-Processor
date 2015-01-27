----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:07:46 01/25/2015 
-- Design Name: 
-- Module Name:    ALUFBlock - Behavioral 
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

entity ALUFBlock is
    port (
        operand     : in  std_logic_vector(3 downto 0);
        opA         : in  std_logic_vector(7 downto 0);
        opB         : in  std_logic_vector(7 downto 0);
        
        result      : out std_logic_vector(7 downto 0)
    );
end ALUFBlock;

architecture DataFlow of ALUFBlock is
begin
    process(operand, opA, opB)
    begin
        -- each bit [i] of result is an F-block MUX of the bit of the operand
        -- indexed by bits [i] of opA and opB
        for i in 0 to 7 loop
            result(i) <= operand(to_integer(unsigned(std_logic_vector(to_unsigned(0,0)) & opA(i) & opB(i))));
        end loop;
    end process;
end DataFlow;

