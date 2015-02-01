----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Create Date:     15:07:56 01/25/2015 
-- Design Name:     AVR-Processor
-- Module Name:     ALUAddBlock - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Adds the input arguments.
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUAddBlock is
    port (
        operand     : in  std_logic_vector(2 downto 0);     -- Selects which logic operation to do
        opA         : in  std_logic_vector(7 downto 0);     -- Argument A
        opB         : in  std_logic_vector(7 downto 0);     -- Argument B
        carry       : in  std_logic;                        -- Input carry flag
        
        statusH     : out std_logic;                        -- Half-carry flag output
        statusV     : out std_logic;                        -- Overflow flag output
        statusC     : out std_logic;                        -- Carry flag output
        result      : out std_logic_vector(7 downto 0)      -- Result output
    );
end ALUAddBlock;

architecture DataFlow of ALUAddBlock is
    signal tempLow  : std_logic_vector(4 downto 0);         -- Result of the bottom nibble add/sub computation
                                                            -- (allows for computation of H-flag)
    signal tempMid  : std_logic_vector(3 downto 0);         -- Result of top nibble (except high bit) add/sub computation
                                                            -- (allows for computation of V-flag)
    signal tempHigh : std_logic_vector(1 downto 0);         -- Result of top bit add/sub computation
                                                            -- (allows for computation of C-flag)
begin
    
    -- This first process computes the low nibble of the result
    process(operand, opA, opB, carry)
    begin
        if (operand(2) = '1') then      -- NEG
            tempLow  <= std_logic_vector(signed('1' & (NOT opA(3 downto 0)))                           + to_signed(1,5));
        elsif (operand(1) = '0') then   -- ADD
            tempLow  <= std_logic_vector(signed('0' & opA(3 downto 0)) + signed('0' & opB(3 downto 0)) + signed(std_logic_vector(to_signed(0, 4)) & (operand(0) AND carry)));
        else                            -- SUB
            tempLow  <= std_logic_vector(signed('0' & opA(3 downto 0)) - signed('0' & opB(3 downto 0)) - signed(std_logic_vector(to_signed(0, 4)) & (operand(0) AND carry)));
        end if;
    end process;
    
    -- Now we compute the middle part of the result, using the carry from the low nibble computation
    process(operand, opA, opB, tempLow)
    begin
        if (operand(2) = '1') then      -- NEG
            tempMid  <= std_logic_vector(signed('1' & (NOT opA(6 downto 4)))                           + signed(std_logic_vector(to_signed(0, 3)) & (NOT tempLow(4))));
        elsif (operand(1) = '0') then   -- ADD
            tempMid  <= std_logic_vector(signed('0' & opA(6 downto 4)) + signed('0' & opB(6 downto 4)) + signed(std_logic_vector(to_signed(0, 3)) & tempLow(4)));
        else                            -- SUB
            tempMid  <= std_logic_vector(signed('0' & opA(6 downto 4)) - signed('0' & opB(6 downto 4)) - signed(std_logic_vector(to_signed(0, 3)) & tempLow(4)));
        end if;
    end process;
    
    -- Finally, compute the high bit of the result, using the carry from the middle computation
    process(operand, opA, opB, tempMid)
    begin
        if (operand(2) = '1') then      -- NEG
            tempHigh <= std_logic_vector(signed('1' & (NOT opA(7 downto 7)))                           + signed(std_logic_vector(to_signed(0, 1)) & (NOT tempMid(3))));
        elsif (operand(1) = '0') then   -- ADD
            tempHigh <= std_logic_vector(signed('0' & opA(7 downto 7)) + signed('0' & opB(7 downto 7)) + signed(std_logic_vector(to_signed(0, 1)) & tempMid(3)));
        else                            -- SUB
            tempHigh <= std_logic_vector(signed('0' & opA(7 downto 7)) - signed('0' & opB(7 downto 7)) - signed(std_logic_vector(to_signed(0, 1)) & tempMid(3)));
        end if;
    end process;
    
    -- We've computed all the partial sums
    -- Now we can produce the result and flags
    process(operand, opA, opB, tempLow, tempMid, tempHigh)
    begin
        -- Piece together the temporary result into our final result
        result(3 downto 0) <= tempLow(3 downto 0);
        result(6 downto 4) <= tempMid(2 downto 0);
        result(7)          <= tempHigh(0);
        
        -- Compute the flags
        statusH <= tempLow(4);
        statusC <= tempHigh(1);
        statusV <= tempMid(3) XOR tempHigh(1);
    end process;
end DataFlow;

