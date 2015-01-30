----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:26 01/25/2015 
-- Design Name: 
-- Module Name:    ALUStatus - Behavioral 
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

entity ALUStatus is
    port (
        clk         : in  std_logic;    -- for status output DFF
        
        ALUResult   : in  std_logic_vector(7 downto 0);
        statusMask  : in  std_logic_vector(7 downto 0);
        
        statusH     : in  std_logic;    -- input flags from ALU calculation
        statusV     : in  std_logic;
        statusC     : in  std_logic;
        
        bitChangeEn : in  std_logic;    -- allow change to individual status bits outside normal mode
        bitClrSet   : in  std_logic;    -- if bitChangeEn, sets or clears bits according to mask
        bitT        : in  std_logic;    -- if bitChangeEn, BST operation; else BLD operation
        
        status      : out std_logic_vector(7 downto 0); -- DFF status output
        result      : out std_logic_vector(7 downto 0)  -- CL  result output (no DFF)
    );
end ALUStatus;

architecture DataFlow of ALUStatus is
    signal temp_status  : std_logic_vector(7 downto 0);
    signal statusN      : std_logic;
begin
    statusN <= ALUResult(ALUResult'length - 1); -- high bit is sign bit
    
    process(ALUResult, statusMask, statusH, statusV, statusN, statusC, bitChangeEn, bitClrSet, bitT)
    begin
        result <= ALUResult;
        if (bitT = '0' AND bitChangeEn = '0') then  -- Normal operation
            -- C
            if (statusMask(0) = '1') then
                temp_status(0) <= statusC;
            end if;
            
            -- Z
            if (statusMask(1) = '1') then
                if (ALUResult = std_logic_vector(to_unsigned(0, ALUResult'length))) then
                    temp_status(1) <= '1';
                else
                    temp_status(1) <= '0';
                end if;
            end if;
            
            -- N
            if (statusMask(2) = '1') then
                temp_status(2) <= statusN;
            end if;
            
            -- V
            if (statusMask(3) = '1') then
                temp_status(3) <= statusV;
            end if;
            
            -- S
            if (statusMask(4) = '1') then
                temp_status(4) <= statusN XOR statusV;
            end if;
            
            -- H
            if (statusMask(5) = '1') then
                temp_status(5) <= statusH;
            end if;
        elsif (bitT = '1') then                     -- BLD / BST
            if (bitChangeEn = '1') then
                if ((ALUResult AND statusMask) = std_logic_vector(to_unsigned(0, 8))) then
                    temp_status(6) <= '0';
                else
                    temp_status(6) <= '1';
                end if;
            else
                if (statusMask(6) = '1') then
                    result <= ALUResult OR statusMask;
                else
                    result <= ALUResult AND (not statusMask);
                end if;
            end if;
        else                                        -- BCLR / BSET
            if (bitClrSet = '1') then
                temp_status <= temp_status OR statusMask;
            else
                temp_status <= temp_status AND (not statusMask);
            end if;
        end if;
    end process;

    process(clk)
    begin
        if (rising_edge(clk)) then
            status <= temp_status;
        end if;
    end process;
end DataFlow;

