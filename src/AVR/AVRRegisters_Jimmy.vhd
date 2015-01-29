----------------------------------------------------------------------------
--  AVR Registers
--  General purpose registers for the AVR processor. There are 32 8-bit 
--  general purpose registers.
--
--
--  Revision History:
--      01/26/15        Peter Cuy       initial version
--
----------------------------------------------------------------------------
-- bring in the necessary packages
library  ieee;
use  ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
entity AVRRegisters is
    port (
        clock       :   in  std_logic;                          --the system clock
        EnableIn    :   in  std_logic;
        SelIn       :   in  std_logic_vector(5 downto 0);
        SelA        :   in  std_logic_vector(5 downto 0);
        SelB        :   in  std_logic_vector(5 downto 0);
        RegIn       :   in  std_logic_vector(7 downto 0);
        
        RegAOut     :   out std_logic_vector(7 downto 0);       -- register bus A out
        RegBOut     :   out std_logic_vector(7 downto 0)        -- register bus B out
    );
end AVRRegisters;

architecture DataFlow of AVRRegisters is
    constant NUM_REGS : integer := 32;
    type REG_ARRAY is array (0 to NUM_REGS-1) of std_logic_vector(7 downto 0);
    signal Registers : REG_ARRAY;
begin

    OutputRegA: process (SelA)
    begin
        RegAOut <= Registers(to_integer(unsigned(SelA)));
    end process OutputRegA;
    
    OutputRegB: process (SelB)
    begin
        RegBOut <= Registers(to_integer(unsigned(SelB)));
    end process OutputRegB;
    
    StoreInput: process (clock)
    begin
        if rising_edge(clock) and EnableIn = '1' then
            Registers(to_integer(unsigned(SelIn))) <= RegIn;
        end if;
    end process StoreInput;

end DataFlow;