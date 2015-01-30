----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:07:56 01/25/2015 
-- Design Name: 
-- Module Name:    ALUAddBlock - Behavioral 
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

entity ALUAddBlock is
    port (
        operand     : in  std_logic_vector(2 downto 0);
        opA         : in  std_logic_vector(7 downto 0);
        opB         : in  std_logic_vector(7 downto 0);
        carry       : in  std_logic;
        
        statusH     : out std_logic;
        statusV     : out std_logic;
        statusC     : out std_logic;
        result      : out std_logic_vector(7 downto 0)
    );
end ALUAddBlock;

architecture DataFlow of ALUAddBlock is
    signal tempLow  : std_logic_vector(4 downto 0);
    signal tempMid  : std_logic_vector(3 downto 0);
    signal tempHigh : std_logic_vector(1 downto 0);
begin
    
    process(operand, opA, opB, carry)
    begin
        if (operand(2) = '1') then
            tempLow  <= std_logic_vector(signed('1' & (NOT opA(3 downto 0)))                           + to_signed(1,5));
        elsif (operand(1) = '0') then
            tempLow  <= std_logic_vector(signed('0' & opA(3 downto 0)) + signed('0' & opB(3 downto 0)) + signed(std_logic_vector(to_signed(0, 4)) & (operand(0) AND carry)));
        else
            tempLow  <= std_logic_vector(signed('0' & opA(3 downto 0)) - signed('0' & opB(3 downto 0)) - signed(std_logic_vector(to_signed(0, 4)) & (operand(0) AND carry)));
        end if;
    end process;
    
    process(operand, opA, opB, tempLow)
    begin
        if (operand(2) = '1') then
            tempMid  <= std_logic_vector(signed('1' & (NOT opA(6 downto 4)))                           + signed(std_logic_vector(to_signed(0, 3)) & (NOT tempLow(4))));
        elsif (operand(1) = '0') then
            tempMid  <= std_logic_vector(signed('0' & opA(6 downto 4)) + signed('0' & opB(6 downto 4)) + signed(std_logic_vector(to_signed(0, 3)) & tempLow(4)));
        else
            tempMid  <= std_logic_vector(signed('0' & opA(6 downto 4)) - signed('0' & opB(6 downto 4)) - signed(std_logic_vector(to_signed(0, 3)) & tempLow(4)));
        end if;
    end process;
    
    process(operand, opA, opB, tempMid)
    begin
        if (operand(2) = '1') then
            tempHigh <= std_logic_vector(signed('1' & (NOT opA(7 downto 7)))                           + signed(std_logic_vector(to_signed(0, 1)) & (NOT tempMid(3))));
        elsif (operand(1) = '0') then
            tempHigh <= std_logic_vector(signed('0' & opA(7 downto 7)) + signed('0' & opB(7 downto 7)) + signed(std_logic_vector(to_signed(0, 1)) & tempMid(3)));
        else
            tempHigh <= std_logic_vector(signed('0' & opA(7 downto 7)) - signed('0' & opB(7 downto 7)) - signed(std_logic_vector(to_signed(0, 1)) & tempMid(3)));
        end if;
    end process;
    
    process(operand, opA, opB, tempLow, tempMid, tempHigh)
    begin
        result(3 downto 0) <= tempLow(3 downto 0);
        result(6 downto 4) <= tempMid(2 downto 0);
        result(7)          <= tempHigh(0);
        
        statusH <= tempLow(4);
        statusC <= tempHigh(1);
        statusV <= tempMid(3) XOR tempHigh(1);
    end process;
end DataFlow;

