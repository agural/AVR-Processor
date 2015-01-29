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
        clock    : in  std_logic;                    -- system clock
        EnableIn : in  std_logic;                    -- specifies write
        SelIn    : in  std_logic_vector(5 downto 0); -- register to write to
        SelA     : in  std_logic_vector(5 downto 0); -- register to read from
        SelB     : in  std_logic_vector(5 downto 0); -- register to read from
        RegIn    : in  std_logic_vector(7 downto 0); -- value to write to register

        RegAOut  : out std_logic_vector(7 downto 0); -- first output
        RegBOut  : out std_logic_vector(7 downto 0)  -- second output
    );
end AVRRegisters;

architecture DataFlow of AVRRegisters is
begin
end DataFlow;


