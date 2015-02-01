----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Create Date:     15:08:58 01/25/2015 
-- Design Name:     AVR-Processor
-- Module Name:     ALUMulBlock - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Multiplies the input arguments.
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUMulBlock is
    port (
        operand     : in  std_logic;                        -- Selects which step (low or high byte)
                                                            -- of the multiply we're doing
        opA         : in  std_logic_vector(7 downto 0);     -- Argument A
        opB         : in  std_logic_vector(7 downto 0);     -- Argument B
        
        carry       : out std_logic;                        -- Carry flag output
        result      : out std_logic_vector(7 downto 0)      -- Result output
    );
end ALUMulBlock;

architecture DataFlow of ALUMulBlock is
    signal partial  : std_logic_vector(13 downto 0);        -- Temporary R/W signal for holding the result
                                                            -- of a partial multiplication
    signal leftover : std_logic_vector(5 downto 0);         -- Leftover from the low byte computation
                                                            -- that must be added into the high byte
begin
    process (operand, opA, opB)     -- Main process
    begin
        -- compute low byte
        -- we do this by splitting up the operands into low and high nibbles
        -- A * B = (AH + AL) * (BH + BL) = AH * BH + AH * BL + AL * BH + AL * BL
        -- the low byte is the low byte of AH * BL + AL * BH + AL * BL
        if (operand = '0') then
            partial  <= std_logic_vector(("00" & unsigned(opA(3 downto 0)) * unsigned(opB(7 downto 4)) & "0000") +
                                         ("00" & unsigned(opA(7 downto 4)) * unsigned(opB(3 downto 0)) & "0000") +
                                         ("000000" & unsigned(opA(3 downto 0)) * unsigned(opB(3 downto 0))));
        -- the high byte is the sum of AH * BH and the leftover from the low byte computation
        else
            partial  <= std_logic_vector(("000000" & unsigned(opA(7 downto 4)) * unsigned(opB(7 downto 4))) +
                                          unsigned("00000000" & leftover));
        end if;
    end process;
    
    process (partial)       -- Done with most of the work; just need to move signals around
    begin
        leftover <= std_logic_vector(partial(13 downto 8)); -- Only care when computing low byte
        carry    <= partial(8);                             -- Only care when computing high byte

        result   <= partial(7 downto 0);                    -- Desired result
    end process;
end DataFlow;

