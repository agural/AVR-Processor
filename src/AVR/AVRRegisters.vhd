-- bring in necessary libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity AVRRegisters is
    port (
        clock       :   in  std_logic;
        EnableIn    :   in  std_logic;
        SelIn       :   in  std_logic_vector(5 downto 0);
        SelA        :   in  std_logic_vector(5 downto 0);
        SelB        :   in  std_logic_vector(5 downto 0);
        RegIn       :   in  std_logic_vector(7 downto 0);

        RegAOut     :   out std_logic_vector(7 downto 0);
        RegBOut     :   out std_logic_vector(7 downto 0)
    );
end AVRRegisters;

architecture DataFlow of AVRRegisters is
begin
end DataFlow;


