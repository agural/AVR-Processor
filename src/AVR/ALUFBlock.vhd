----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Create Date:     15:07:46 01/25/2015
-- Design Name:     AVR-Processor
-- Module Name:     ALUFBlock - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Computes logical operations on two arguments.
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUFBlock is
    port (
        operand     : in  std_logic_vector(3 downto 0);     -- Selects which logic operation to do
        opA         : in  std_logic_vector(7 downto 0);     -- Argument A
        opB         : in  std_logic_vector(7 downto 0);     -- Argument B
        
        result      : out std_logic_vector(7 downto 0)      -- Result of logic operation
    );
end ALUFBlock;

architecture DataFlow of ALUFBlock is
begin
    process(operand, opA, opB)
    begin
        -- each bit [i] of result is an F-block MUX of the bit of the operand
        -- indexed by bits [i] of opA and opB
        for i in 0 to 7 loop
            if (is_x(operand) or is_x(opA) or is_x(opB)) then
                result(i) <= 'X';
            else
                result(i) <= operand(to_integer(unsigned(std_logic_vector(to_unsigned(0,0)) & opA(i) & opB(i))));
            end if;
        end loop;
    end process;
end DataFlow;

