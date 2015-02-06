----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Design Name:     AVR-Processor
-- Module Name:     DMAUnit - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Controlls addressing to external memory
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity DMAUnit is
    port (
        clock       : in  std_logic;                        -- system clock
        MemAddr     : in  std_logic_vector(15 downto 0);    -- memory address to access (input)
        InRd        : in  std_logic;                        -- when to read from memory
        InWr        : in  std_logic;                        -- when to write to memory
        
        OutRd       : out std_logic;                        -- timed output for when to read from memory
        OutWr       : out std_logic;                        -- timed output for when to write to memory
        MemAB       : out std_logic_vector(15 downto 0)     -- memory address (latched output)
    );
end DMAUnit;

architecture DataFlow of DMAUnit is
begin
    OutRd <= InRd or clock;
    OutWr <= InWr or clock;
    
    -- process to latch the address output
    UpdateAddress: process(clock)
    begin
        -- only update on falling clock
        if falling_edge(clock) then
            MemAB <= MemAddr;
        end if;
    end process UpdateAddress;
end DataFlow;

