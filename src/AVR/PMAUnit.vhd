----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:35 03/25/2015 
-- Design Name: 
-- Module Name:    PMAUnit - DataFlow 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PMAUnit is
    port (
        ProgAB      : out std_logic_vector(15 downto 0); -- address for program memory
        ProgDB      : in  std_logic_vector(15 downto 0); -- data from program memory
        PCUpdateSel : in  std_logic_vector(1 downto 0);  -- source of next program counter
        NextPC      : out std_logic_vector(15 downto 0); -- next program counter
        PCOffset    : in  std_logic_vector(11 downto 0); -- increment for program counter
        NewIns      : in  std_logic;                     -- indicates new instruction should be loaded
        IR          : out std_logic_vector(15 downto 0); -- instruction register
        NewPC       : in  std_logic_vector(15 downto 0); -- from X, Y, Z register
        Clk         : in  std_logic                      -- system clock
    );
end PMAUnit;

architecture DataFlow of PMAUnit is
    signal PC : std_logic_vector(15 downto 0);
    signal IncrementedPC : std_logic_vector(15 downto 0);
    constant ResetValue : std_logic_vector(15 downto 0) := (others => '0');
begin
    ProgAB <= PC;
    IncrementedPC <= std_logic_vector(unsigned(PC) + unsigned(PCOffset));
    NextPC <= IncrementedPC;
    
    process (Clk)
    begin
        if (rising_edge(Clk)) then
            if (NewIns = '1') then
                IR <= ProgDB;
            end if;
            
            if (PCUpdateSel = "00") then
                PC <= IncrementedPC;
            elsif (PCUpdateSel = "01") then
                PC <= ProgDB;
            elsif (PCUpdateSel = "10") then
                PC <= NewPC;
            elsif (PCUpdateSel = "11") then
                PC <= ResetValue;
            else
                PC <= (others => 'X');
            end if;
        end if;
    end process;
end DataFlow;

