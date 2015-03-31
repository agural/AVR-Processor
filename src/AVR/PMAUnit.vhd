----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Design Name:     AVR-Processor
-- Module Name:     PMAUnit - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Keeps an updated program counter (PC) and is responsible for
--                  fetching new instructions.
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
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
        PCUpdateSel : in  std_logic_vector( 1 downto 0);  -- source of next program counter
        NextPC      : out std_logic_vector(15 downto 0); -- next program counter
        PCOffset    : in  std_logic_vector(11 downto 0); -- increment for program counter
        NewIns      : in  std_logic;                     -- indicates new instruction should be loaded
        IR          : out std_logic_vector(15 downto 0); -- instruction register
        NewPCZ      : in  std_logic_vector(15 downto 0); -- from Z register
        NewPCS      : in  std_logic_vector(15 downto 0); -- from stack
        
        Reset       : in  std_logic;                     -- reset
        Clk         : in  std_logic                      -- system clock
    );
end PMAUnit;

architecture DataFlow of PMAUnit is
    signal PC               : std_logic_vector(15 downto 0);
    signal IncrementedPC    : std_logic_vector(15 downto 0);
    constant ResetValue     : std_logic_vector(15 downto 0) := (others => '0');
begin
    ProgAB          <= PC;
    IncrementedPC   <= std_logic_vector(signed(PC) + signed(PCOffset));
    NextPC          <= IncrementedPC;
    
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
                PC <= NewPCZ;
            elsif (PCUpdateSel = "11") then
                PC <= NewPCS;
            else
                PC <= (others => 'X');
            end if;
            
            if (Reset = '0') then
                PC <= ResetValue;
            end if;
        end if;
    end process;
end DataFlow;

