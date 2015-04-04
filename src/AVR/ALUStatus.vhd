----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Create Date:     15:10:26 01/25/2015 
-- Design Name:     AVR-Processor
-- Module Name:     ALUStatus - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     The main purpose of this block is to maintain the status flags.
--                  However, it's also responsible for specialty commands associated
--                  with the status flags: BCLR, BLD, BSET, BST
--                  Because of this, the module can modify the ALU result, producing
--                  the "official" result that gets sent to the register.
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity ALUStatus is
    port (
        clk         : in  std_logic;                    -- For status output DFF
        
        ALUResult   : in  std_logic_vector(7 downto 0); -- Unofficial result of operation
        statusMask  : in  std_logic_vector(7 downto 0); -- Masks which flags the operation changes
        
        statusH     : in  std_logic;                    -- Input flags from ALU calculation
        statusV     : in  std_logic;                    -- If a flag isn't here, it can be computed from ALUResult
        statusC     : in  std_logic;
        
        bitChangeEn : in  std_logic;                    -- Allow change to individual status bits outside normal mode
        bitClrSet   : in  std_logic;                    -- If bitChangeEn, sets or clears bits according to mask
        bitT        : in  std_logic;                    -- If bitChangeEn, BST operation; else BLD operation
        
        status      : out std_logic_vector(7 downto 0); -- DFF status output
        result      : out std_logic_vector(7 downto 0)  -- CL  result output (no DFF)
    );
end ALUStatus;

architecture DataFlow of ALUStatus is
    signal old_status   : std_logic_vector(7 downto 0); -- Keeps track of the pre-instruction status
    signal temp_status  : std_logic_vector(7 downto 0); -- Keeps track of the post-instruction status
    signal statusN      : std_logic;                    -- Useful temporary signal for computing other flags
begin
    statusN <= ALUResult(ALUResult'length - 1);         -- High bit is sign bit
    
    -- Main process handles figuring out what the new flags should be
    process(ALUResult, statusMask, statusH, statusV, statusN, statusC, bitChangeEn, bitClrSet, bitT)
    begin
        result <= ALUResult;
        temp_status <= old_status;
        if (bitT = '0' AND bitChangeEn = '0') then  -- "Normal instruction" operation
            -- C-flag
            if (statusMask(flag_C) = '1') then
                temp_status(flag_C) <= statusC;
            else
                temp_status(flag_C) <= old_status(flag_C);
            end if;
            
            -- Z-flag
            if (statusMask(flag_Z) = '1') then
                if (ALUResult = std_logic_vector(to_unsigned(0, ALUResult'length))) then
                    temp_status(flag_Z) <= '1';
                else
                    temp_status(flag_Z) <= '0';
                end if;
            else
                temp_status(flag_Z) <= old_status(flag_Z);
            end if;
            
            -- N-flag
            if (statusMask(flag_N) = '1') then
                temp_status(flag_N) <= statusN;
            else
                temp_status(flag_N) <= old_status(flag_N);
            end if;
            
            -- V-flag
            if (statusMask(flag_V) = '1') then
                temp_status(flag_V) <= statusV;
            else
                temp_status(flag_V) <= old_status(flag_V);
            end if;
            
            -- S-flag
            if (statusMask(flag_S) = '1') then
                temp_status(flag_S) <= statusN XOR statusV;
            else
                temp_status(flag_S) <= old_status(flag_S);
            end if;
            
            -- H-flag
            if (statusMask(flag_H) = '1') then
                temp_status(flag_H) <= statusH;
            else
                temp_status(flag_H) <= old_status(flag_H);
            end if;
        elsif (bitT = '1') then                     -- BLD or BST instruction operation
            if (bitChangeEn = '1') then             -- BST instruction
                if ((ALUResult AND statusMask) = std_logic_vector(to_unsigned(0, ALUResult'length))) then
                    temp_status(flag_T) <= '0';
                else
                    temp_status(flag_T) <= '1';
                end if;
            else                                    -- BLD instruction
                if (old_status(flag_T) = '1') then
                    result <= ALUResult OR statusMask;
                else
                    result <= ALUResult AND (not statusMask);
                end if;
            end if;
        else                                        -- BCLR or BSET instruction operation
            if (bitClrSet = '1') then               -- BSET instruction
                temp_status <= old_status OR statusMask;
            else                                    -- BCLR instruction
                temp_status <= old_status AND (not statusMask);
            end if;
        end if;
    end process;

    -- This process actually handles the update...
    -- old_status needs to be put through a DFF
    process(clk)
    begin
        if (rising_edge(clk)) then
            old_status <= temp_status;
        end if;
    end process;
    status <= temp_status;
end DataFlow;

