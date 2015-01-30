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
    signal tempA    : std_logic_vector(8 downto 0);
    signal tempB    : std_logic_vector(8 downto 0);
    signal tempC    : std_logic_vector(8 downto 0);
    signal tempLow  : std_logic_vector(4 downto 0);
    signal tempMid  : std_logic_vector(3 downto 0);
    signal tempHigh : std_logic_vector(1 downto 0);
begin
    tempLow <= std_logic_vector(signed('0' & tempA(3 downto 0)) +
                                signed(tempB(8) & tempB(3 downto 0)) +
                                signed(tempC(8) & tempC(3 downto 0)));
    tempMid <= std_logic_vector(signed('0' & tempA(6 downto 4)) +
                                signed(tempB(8) & tempB(6 downto 4)) +
                                signed(tempC(8) & tempC(6 downto 4)) +
                                signed(std_logic_vector(to_signed(0, 3)) & (operand(1) XOR tempLow(4))));
    tempHigh<= std_logic_vector(signed(tempA(8 downto 7)) +
                                signed(tempB(8 downto 7)) +
                                signed(tempC(8 downto 7)) +
                                signed(std_logic_vector(to_signed(0, 1)) & (operand(1) XOR tempMid(3))));
    
    result(3 downto 0) <= tempLow(3 downto 0);
    result(6 downto 4) <= tempMid(2 downto 0);
    result(7) <= tempHigh(0);
    
    statusH <= tempLow(4);
    statusC <= tempHigh(1);
    statusV <= tempMid(3) XOR tempHigh(1);

    process(operand, opA, opB, carry)
    begin
        if (operand(2) = '1') then          -- negate opA
            tempA <= NOT ('0' & opA);
            tempB <= std_logic_vector(to_signed(1, opB'length + 1));
            tempC <= std_logic_vector(to_signed(0, opB'length + 1));
        elsif (operand(1) = '0') then       -- addition
            if (operand(0) = '0') then          -- no carry
                tempA <= '0' & opA;
                tempB <= '0' & opB;
                tempC <= std_logic_vector(to_signed(0, opB'length + 1));
            else                                -- carry
                tempA <= '0' & opA;
                tempB <= '0' & opB;
                tempC <= std_logic_vector(to_signed(0, opB'length)) & carry;
            end if;
        else                                -- subtraction
            if (operand(0) = '0') then          -- no carry
                tempA <= '0' & opA;
                tempB <= std_logic_vector(-signed('0' & opB));
                tempC <= std_logic_vector(to_signed(0, opB'length + 1));
            else                                -- carry
                tempA <= '0' & opA;
                tempB <= std_logic_vector(-signed('0' & opB));
                if (carry = '1') then
                    tempC <= std_logic_vector(to_signed(-1, opB'length + 1));
                else
                    tempC <= std_logic_vector(to_signed(0, opB'length + 1));
                end if;
            end if;
        end if;
    end process;
end DataFlow;

