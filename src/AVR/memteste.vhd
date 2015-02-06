----------------------------------------------------------------------------
--
--  Atmel AVR Data Memory Test Entity Declaration
--
--  This is the entity declaration which must be used for building the data
--  memory access portion of the AVR design for testing.
--
--  Revision History:
--     24 Apr 98  Glen George       Initial revision.
--     25 Apr 00  Glen George       Fixed entity name and updated comments.
--      2 May 02  Glen George       Updated comments.
--      3 May 02  Glen George       Fixed Reset signal type.
--     23 Jan 06  Glen George       Updated comments.
--     21 Jan 08  Glen George       Updated comments.
--
----------------------------------------------------------------------------


--
--  MEM_TEST
--
--  This is the data memory access testing interface.  It just brings all
--  the important data memory access signals out for testing along with the
--  Instruction Register and Program Data Bus.
--
--  Inputs:
--    IR     - Instruction Register (16 bits)
--    ProgDB - program memory data bus (16 bits)
--    Reset  - active low reset signal
--    clock  - the system clock
--
--  Outputs:
--    DataAB - data memory address bus (16 bits)
--    DataDB - data memory data bus (8 bits)
--    DataRd - data read (active low)
--    DataWr - data write (active low)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library opcodes;
use opcodes.opcodes.all;


entity  MEM_TEST  is

    port (
        IR      :  in     opcode_word;                      -- Instruction Register
        ProgDB  :  in     std_logic_vector(15 downto 0);    -- second word of instruction
        Reset   :  in     std_logic;                        -- system reset signal (active low)
        clock   :  in     std_logic;                        -- system clock
        DataAB  :  out    std_logic_vector(15 downto 0);    -- data address bus
        DataDB  :  inout  std_logic_vector(7 downto 0);     -- data data bus
        DataRd  :  out    std_logic;                        -- data read (active low)
        DataWr  :  out    std_logic                         -- data write (active low)
    );

end  MEM_TEST;

architecture Structural of MEM_TEST is

    signal MemRegAddr   : std_logic_vector(15 downto 0);-- register-based indirect memory access

    signal ImmediateOut : std_logic_vector(7 downto 0); -- value of immediate

    signal EnableIn     : std_logic;                    -- whether or not to write to register
    signal SelIn        : std_logic_vector(6 downto 0); -- register to write to
    signal SelA         : std_logic_vector(6 downto 0); -- first register to read
    signal SelB         : std_logic_vector(6 downto 0); -- second register to read

    signal DataIOSel    : std_logic;                    -- selects whether data is input or output
    signal AddrOffset   : std_logic_vector(15 downto 0);-- offset of address
    signal SpecAddr     : std_logic_vector(1 downto 0); -- selects X, Y, Z, or SP
    signal SpecWr       : std_logic;                    -- whether to write to the special addresses

    signal RegDataInSel : std_logic_vector(1 downto 0); -- selects which input goes to register in
    signal MemAddr      : std_logic_vector(15 downto 0);-- memory address (16 bits)

begin
    ControlUnit : entity work.AVRControl
    port map (
        clock                  => clock,
        IR                     => IR,
        ProgDB                 => ProgDB,
        MemRegAddr             => MemRegAddr,


        -- ALUStatusMask          => 
        -- ALUStatusBitChangeEn   => 
        -- ALUBitClrSet           => 
        -- ALUBitTOp              => 
        -- ALUOp2Sel              => 
        ImmediateOut           => ImmediateOut,
        -- ALUBlockSel            => 
        -- ALUBlockInstructionSel => 

        EnableIn               => EnableIn,
        SelIn                  => SelIn,
        SelA                   => SelA,
        SelB                   => SelB,

        DataIOSel              => DataIOSel,
        AddrOffset             => AddrOffset,
        SpecAddr               => SpecAddr,
        SpecWr                 => SpecWr,

        RegDataInSel           => RegDataInSel,
        MemAddr                => MemAddr
    );

    Registers : entity work.AVRRegisters
    port map (
        clock    => clock,
        EnableIn => EnableIn,
        SelIn    => SelIn,
        SelA     => SelA,
        SelB     => SelB,

        ALUIn        => (others => 'X'),
        RegDataImm   => ImmediateOut,
        RegDataInSel => RegDataInSel,

        RegAOut  => open,
        RegBOut  => open,

        SpecOut  => open,
        SpecAddr => SpecAddr,
        SpecWr   => SpecWr,

        MemRegData => DataDB,
        AddrOffset => AddrOffset,
        MemRegAddr => MemRegAddr,
        DataIOSel  => DataIOSel,

        Reset      => Reset
    );


end Structural;

