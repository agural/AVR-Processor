----------------------------------------------------------------------------
--
--  Atmel AVR Register Array Test Bench
--
--  Revision History:
--      01/25/15    Peter Cuy       initial version
--
----------------------------------------------------------------------------
-- bring in the necessary packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;       --contains conversion functions

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity REG_TEST_TB is
end REG_TEST_TB;

architecture TB_ARCHITECTURE of REG_TEST_TB is 
    component REG_TEST
        port (
            IR       :  in  opcode_word;                        -- Instruction Register
            RegIn    :  in  std_logic_vector(7 downto 0);       -- input register bus
            clock    :  in  std_logic;                          -- system clock
            RegAOut  :  out std_logic_vector(7 downto 0);       -- register bus A out
            RegBOut  :  out std_logic_vector(7 downto 0)  
        );
    end component;
    
    signal IR           :   opcode_word;                        -- Instruction Register
    signal RegIn        :   std_logic_vector(7 downto 0);       -- input register bus
    signal clock        :   std_logic;                          -- system clock
    signal RegAOut      :   std_logic_vector(7 downto 0);       -- register bus A out
    signal RegBOut      :   std_logic_vector(7 downto 0);
    
    signal  END_SIM     :  BOOLEAN := FALSE;                   -- end simulation flag

begin
    UUT : REG_TEST
        port map(
            IR      =>  IR     , 
            RegIn   =>  RegIn  , 
            clock   =>  clock  , 
            RegAOut =>  RegAOut, 
            RegBOut =>  RegBOut 
        );
    
    -- Main testing procedure
    process
    begin
        wait for 25 ns;
        
        -- initialize all registers to 0
        IR <= "0000110000000000";
        wait for 10 ns;
        RegIn <= "00000000";
        wait for 10 ns;
        IR <= "0000110000010001";
        wait for 10 ns;
        RegIn <= "00000001";
        wait for 10 ns;
        IR <= "0000110000100010";
        wait for 10 ns;
        RegIn <= "00000010";
        wait for 10 ns;
        IR <= "0000110000110011";
        wait for 10 ns;
        RegIn <= "00000011";
        wait for 10 ns;
        IR <= "0000110001000100";
        wait for 10 ns;
        RegIn <= "00000100";
        wait for 10 ns;
        IR <= "0000110001010101";
        wait for 10 ns;
        RegIn <= "00000101";
        wait for 10 ns;
        IR <= "0000110001100110";
        wait for 10 ns;
        RegIn <= "00000110";
        wait for 10 ns;
        IR <= "0000110001110111";
        wait for 10 ns;
        RegIn <= "00000111";
        wait for 10 ns;
        IR <= "0000110010001000";
        wait for 10 ns;
        RegIn <= "00001000";
        wait for 10 ns;
        IR <= "0000110010011001";
        wait for 10 ns;
        RegIn <= "00001001";
        wait for 10 ns;
        IR <= "0000110010101010";
        wait for 10 ns;
        RegIn <= "00001010";
        wait for 10 ns;
        IR <= "0000110010111011";
        wait for 10 ns;
        RegIn <= "00001011";
        wait for 10 ns;
        IR <= "0000110011001100";
        wait for 10 ns;
        RegIn <= "00001100";
        wait for 10 ns;
        IR <= "0000110011011101";
        wait for 10 ns;
        RegIn <= "00001101";
        wait for 10 ns;
        IR <= "0000110011101110";
        wait for 10 ns;
        RegIn <= "00001110";
        wait for 10 ns;
        IR <= "0000110011111111";
        wait for 10 ns;
        RegIn <= "00001111";
        wait for 10 ns;
        IR <= "0000111100000000";
        wait for 10 ns;
        RegIn <= "00010000";
        wait for 10 ns;
        IR <= "0000111100010001";
        wait for 10 ns;
        RegIn <= "00010001";
        wait for 10 ns;
        IR <= "0000111100100010";
        wait for 10 ns;
        RegIn <= "00010010";
        wait for 10 ns;
        IR <= "0000111100110011";
        wait for 10 ns;
        RegIn <= "00010011";
        wait for 10 ns;
        IR <= "0000111101000100";
        wait for 10 ns;
        RegIn <= "00010100";
        wait for 10 ns;
        IR <= "0000111101010101";
        wait for 10 ns;
        RegIn <= "00010101";
        wait for 10 ns;
        IR <= "0000111101100110";
        wait for 10 ns;
        RegIn <= "00010110";
        wait for 10 ns;
        IR <= "0000111101110111";
        wait for 10 ns;
        RegIn <= "00010111";
        wait for 10 ns;
        IR <= "0000111110001000";
        wait for 10 ns;
        RegIn <= "00011000";
        wait for 10 ns;
        IR <= "0000111110011001";
        wait for 10 ns;
        RegIn <= "00011001";
        wait for 10 ns;
        IR <= "0000111110101010";
        wait for 10 ns;
        RegIn <= "00011010";
        wait for 10 ns;
        IR <= "0000111110111011";
        wait for 10 ns;
        RegIn <= "00011011";
        wait for 10 ns;
        IR <= "0000111111001100";
        wait for 10 ns;
        RegIn <= "00011100";
        wait for 10 ns;
        IR <= "0000111111011101";
        wait for 10 ns;
        RegIn <= "00011101";
        wait for 10 ns;
        IR <= "0000111111101110";
        wait for 10 ns;
        RegIn <= "00011110";
        wait for 10 ns;
        IR <= "0000111111111111";
        wait for 10 ns;
        RegIn <= "00011111";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011000111110";
		  wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000011");
        assert(RegBOut = "00011110");
        RegIn <= "10000100";
		  wait until (clock = '1');
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111011000110";
		  wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001100");
        assert(RegBOut = "00010110");
        RegIn <= "10101110";
		  wait until (clock = '1');
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000011110000";
        wait for 10 ns;
        assert(RegAOut = "00010000");
        RegIn <= "11110001";
        wait for 10 ns;
        
        END_SIM <= TRUE;    --end of stimulus events
        wait;               --wait for the simulation to end
    end process;
    
    -- Clock process definitions
    CLOCK_CLK : process
    begin
        -- this process generates a 20 ns period, 50% duty cycle clock
        -- only generate clock if still simulating
        if end_sim = false then
            clock <= '0';
            wait for 10 ns;
        else
            wait;
        end if;
  
        if end_sim = false then
            clock <= '1';
            wait for 10 ns;
        else
            wait;
        end if;
   end process;
end TB_ARCHITECTURE;





