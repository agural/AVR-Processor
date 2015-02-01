----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Create Date:     15:08:36 01/25/2015 
-- Design Name:     AVR-Processor
-- Module Name:     ALUShiftBlock - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Shifts or rotates the input argument.
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUShiftBlock is
    port (
        operand     : in  std_logic_vector(2 downto 0);     -- Selects which logic operation to do
        op          : in  std_logic_vector(7 downto 0);     -- Input argument
        carry       : in  std_logic;                        -- Input carry bit
        
        statusV     : out std_logic;                        -- Overflow flag output
        statusC     : out std_logic;                        -- Carry flag output
        result      : out std_logic_vector(7 downto 0)      -- Result output
    );
end ALUShiftBlock;

architecture DataFlow of ALUShiftBlock is
    signal tempOut  : std_logic_vector(7 downto 0);         -- R/W buffer for the result; it's needed
                                                            -- since you can't read directly from result
begin
    result  <= tempOut;
    
    -- Set specific flag bits as per design specs
    statusV <= op(0) XOR tempOut(tempOut'length - 1);
    statusC <= op(0);
    
    process(operand, op, carry)     -- main process
    begin
        if (operand(2) = '1') then                  -- swap
            tempOut(7 downto 4) <= op(3 downto 0);
            tempOut(3 downto 0) <= op(7 downto 4);
        -- Besides swap, all operations shift the non-high bit right.
        -- We just need to differentiate what gets put into the high bit.
        else
            if (operand(1 downto 0) = "00") then    -- logical shift right
                tempOut(7) <= '0';
            elsif (operand(1 downto 0) = "10") then -- arithmetic shift right
                tempOut(7) <= op(7);
            else                                    -- rotate right through C
                tempOut(7) <= carry;
            end if;
            -- All the remaining bits are set to the bit to their left.
            for i in 0 to 6 loop
                tempOut(i) <= op(i+1);
            end loop;
        end if;
    end process;
end DataFlow;

