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

library opcodes;
use opcodes.opcodes.all;


entity REG_TEST_TB is

procedure ADC_OP 
    (signal OP1        : in    integer;
     signal OP2        : in    integer;
     signal Registers  : inout REG_ARRAY;
     signal IR         : out   opcode_word;
     signal NextRegIn  : out   std_logic_vector(7 downto 0);
     signal ExpRegAOut : out   std_logic_vector(7 downto 0);
     signal ExpRegBOut : out   std_logic_vector(7 downto 0)) is
begin
    IR := "000111----------";
    ExpRegAOut := "00000000";
    ExpRegBOut := "00000000";
end ADC_OP;

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
    
    constant NUM_REGS : integer := 32;
    type REG_ARRAY is array (0 to NUM_REGS-1) of std_logic_vector(7 downto 0);
    signal Registers : REG_ARRAY;
    
    signal IR           :   opcode_word;                        -- Instruction Register
    signal RegIn        :   std_logic_vector(7 downto 0);       -- input register bus
    signal clock        :   std_logic;                          -- system clock
    signal RegAOut      :   std_logic_vector(7 downto 0);       -- register bus A out
    signal RegBOut      :   std_logic_vector(7 downto 0);  
    
 
    signal ExpRegAOut      :   std_logic_vector(7 downto 0);    -- expected register bus A out
    signal ExpRegBOut      :   std_logic_vector(7 downto 0);    -- expected register bus B out

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
        
    process
    begin
        for I in 0 to (NUM_REGS-1) loop
            Registers(I) := "00000000";
        end loop;
        ADC_OP(0,0,Registers, IR, RegIn, ExpRegAOut, ExpRegBOut);
        wait for 20 ns;
        
        END_SIM <= TRUE;    --end of stimulus events
        wait;               --wait for the simulation to end
    end process;
    
    CLOCK_CLK : process
  
    begin

        -- this process generates a 20 ns period, 50% duty cycle clock

        -- only generate clock if still simulating

        if END_SIM = FALSE then
            CLK <= '0';
            wait for 10 ns;
        else
            wait;
        end if;

        if END_SIM = FALSE then
            CLK <= '1';
            wait for 10 ns;
        else
            wait;
        end if;

    end process;


     


end TB_ARCHITECTURE;





