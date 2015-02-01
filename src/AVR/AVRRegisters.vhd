----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Create Date:     15:07:46 01/25/2015
-- Design Name:     AVR-Processor
-- Module Name:     AVRRegisters - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Stores 32 8-bit registers, which can be viewed at any time
--                  and can be updated on clock edges
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------

-- bring in necessary libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

-- entity specifying which registers to read, and whether or not to update
-- one of the registers
entity AVRRegisters is
    port (
        clock    : in  std_logic;                    -- system clock
        EnableIn : in  std_logic;                    -- specifies write
        SelIn    : in  std_logic_vector(4 downto 0); -- register to write to
        SelA     : in  std_logic_vector(4 downto 0); -- register to read from
        SelB     : in  std_logic_vector(4 downto 0); -- register to read from
        RegIn    : in  std_logic_vector(7 downto 0); -- value to write to register

        RegAOut  : out std_logic_vector(7 downto 0); -- first output
        RegBOut  : out std_logic_vector(7 downto 0)  -- second output
    );
end AVRRegisters;

architecture DataFlow of AVRRegisters is
    constant NUM_REGS : integer := 32; -- number of registers

    -- define the registers
    type REG_ARRAY is array (0 to NUM_REGS-1) of std_logic_vector(7 downto 0);
    signal Registers : REG_ARRAY;
begin

    RegAOut <= Registers(to_integer(unsigned(SelA))); -- report value of first register
    RegBOut <= Registers(to_integer(unsigned(SelB))); -- report value of second register

    -- process to update value in one register if requested
    WriteRegister: process (clock)
    begin
        -- write on rising edge of clock when update is requested
        if rising_edge(clock) and EnableIn = '1' then
            -- write value to selected register
            Registers(to_integer(unsigned(SelIn))) <= RegIn;
        end if;
    end process WriteRegister;
end DataFlow;

