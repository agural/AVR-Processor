----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Design Name:     AVR-Processor
-- Module Name:     PMAUnit - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Handles fetching instructions from program memory.
--                  Also keeps and updated program counter.
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------

-- bring in necessary libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity that handles fetching instructions from program memory
entity PMAUnit is
    port (
        clock                   : in  std_logic;                    -- system clock
        reset                   : in  std_logic;                    -- resets the system
        
        ProgAB                  : out std_logic_vector(15 downto 0);-- address of program memory to fetch
        ProgDB                  : in  std_logic_vector(15 downto 0);-- data from program memory
        IR                      : out opcode_word;                  -- instruction register
        
        NewPC                   : in  std_logic_vector(15 downto 0);-- control register-set PC value
        NextPC                  : out std_logic_vector(15 downto 0);-- value of the next PC (after adding the offset)
        PCOffset                : in  std_logic_vector(11 downto 0);-- signed offset to add to PC
        PCUUpdateSel            : in  std_logic_vector( 1 downto 0);-- selects which input source to use to update PC
        newIns                  : in  std_logic;                    -- signal to latch the instruction register output
    );
end PMAUnit;

architecture DataFlow of PMAUnit is
    signal PC               is std_logic_vector(15 downto 0);   -- the program counter
    signal IRstore          is std_logic_vector(15 downto 0);   -- holds the instruction
    signal PCOffsetResult   is std_logic_vector(15 downto 0);   -- result of the PC offset add
    
    constant ResetAddr: std_logic_vector(15 downto 0) := "0000000000000000";    -- reset address
begin
    ProgAB <= PC;                               -- address to fetch is current program counter
    NextPC <= PCOffsetResult;                   -- next program counter value is after the offset
    IR     <= IRstore;                          -- always output latched IR value
    PCOffsetResult <= PC + ("0000" & PCOffset); -- normal PC update value
    
    -- Latches the current instruction
    UpdateIR: process(clock)
    begin
        if rising_edge(clock) and newIns = '1' then
            IRstore <= ProgDB;
        end if;
    end process UpdateIR;
    
    -- Latches the next program counter value
    UpdatePC: process(clock)
    begin
        if rising_edge(clock) then
            PC <= PCOffsetResult when PCUUpdateSel = "00",
                  ProgDB         when PCUUpdateSel = "01",
                  NewPC          when PCUUpdateSel = "10",
                  ResetAddr      when others;
        end if;
    end process UpdatePC;
end Behavioral;

