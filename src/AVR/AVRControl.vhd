-- bring in necessary libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity AVRControl is
    port (
        clock                  : in  std_logic;
        IR                     : in  opcode_word;
        ALUStatusMask          : out std_logic_vector(7 downto 0);
        ALUStatusBitChangeEn   : out std_logic;
        ALUBitClrSet           : out std_logic;
        ALUBitTOp              : out std_logic;
        ALUOp2Sel              : out std_logic;
        ImmediateOut           : out std_logic_vector(7 downto 0);
        ALUBlockSel            : out std_logic_vector(1 downto 0);
        ALUBlockInstructionSel : out std_logic_vector(3 downto 0);
        EnableIn : out std_logic;
        SelIn    : out std_logic_vector(5 downto 0);
        SelA     : out std_logic_vector(5 downto 0);
        SelB     : out std_logic_vector(5 downto 0)
    );
end AVRControl;

architecture DataFlow of AVRControl is
begin
end DataFlow;


