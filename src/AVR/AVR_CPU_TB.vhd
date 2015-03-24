----------------------------------------------------------------------------
--
--  Atmel AVR CPU Test Bench
--
--  This test bench runs the AVR CPU on program memory. The program memory
--  has the instructions to run the CPU through a suite of tests.
--
--  Revision History:
--      03/24/15    Albert Gural    Initial version.
--
----------------------------------------------------------------------------

-- bring in the necessary packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity AVR_CPU_TEST_TB is
end AVR_CPU_TEST_TB;

architecture TB_ARCHITECTURE of AVR_CPU_TEST_TB is 
    signal Clock   :  std_logic;                        -- system clock
    signal Reset   :  std_logic;                        -- system reset signal (active low)
    
    signal INT0    :  std_logic;                        -- interrupt 0
    signal INT1    :  std_logic;                        -- interrupt 1
    
    signal end_sim :  boolean := false;                 -- end simulation flag
begin
    UUT : entity work.AVR_CPU_TEST
        port map (
            Clock   => Clock,
            Reset   => Reset,
            INT0    => INT0,
            INT1    => INT1
        );
    
    -- Main testing procedure
    process
    begin
        report "Hi!";

        wait until (clock = '1');
        wait until (clock = '1');
        report "DONE WITH SIMULATIONS"; 
        end_sim <= true;    --end of stimulus events
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
