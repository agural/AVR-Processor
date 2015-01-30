----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:36 01/25/2015 
-- Design Name: 
-- Module Name:    ALUShiftBlock - Behavioral 
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

entity ALUShiftBlock is
    port (
        operand     : in  std_logic_vector(2 downto 0);
        opA         : in  std_logic_vector(7 downto 0);
        carry       : in  std_logic;
        
        statusV     : out std_logic;
        statusC     : out std_logic;
        result      : out std_logic_vector(7 downto 0)
    );
end ALUShiftBlock;

architecture DataFlow of ALUShiftBlock is
    signal tempOut  : std_logic_vector(7 downto 0);
begin
    result  <= tempOut;
    
    statusV <= opA(0) XOR tempOut(tempOut'length - 1);
    statusC <= opA(0);
    
    process(operand, opA, carry)
    begin
        if (operand(2) = '1') then                  -- swap
            tempOut(7 downto 4) <= opA(3 downto 0);
            tempOut(3 downto 0) <= opA(7 downto 4);
        else
            if (operand(1 downto 0) = "00") then    -- logical shift right
                tempOut(7) <= '0';
            elsif (operand(1 downto 0) = "10") then -- arithmetic shift right
                tempOut(7) <= opA(7);
            else                                    -- rotate right through C
                tempOut(7) <= carry;
            end if;
            for i in 0 to 6 loop
                tempOut(i) <= opA(i+1);
            end loop;
        end if;
    end process;
end DataFlow;

