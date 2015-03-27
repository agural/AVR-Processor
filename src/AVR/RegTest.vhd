----------------------------------------------------------------------------
--
--  Atmel AVR Register Array Test Entity Declaration
--
--  This is the entity declaration which must be used for building the
--  register array portion of the AVR design for testing.
--
--  Revision History:
--     17 Apr 98  Glen George       Initial revision.
--     20 Apr 98  Glen George       Fixed minor syntax bugs.
--     22 Apr 02  Glen George       Updated comments.
--     18 Apr 04  Glen George       Updated comments and formatting.
--     21 Jan 06  Glen George       Updated comments.
--
----------------------------------------------------------------------------


--
--  REG_TEST
--
--  This is the register array testing interface.  It just brings all the
--  important register array signals out for testing along with the
--  Instruction Register.
--
--  Inputs:
--    IR      - Instruction Register (16 bits)
--    RegIn   - input to the register array (8 bits)
--    clock   - the system clock
--
--  Outputs:
--    RegAOut - register bus A output (8 bits), eventually will connect to ALU
--    RegBOut - register bus B output (8 bits), eventually will connect to ALU
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library opcodes;
use opcodes.opcodes.all;


entity  REG_TEST  is

    port(
        IR       :  in  opcode_word;                        -- Instruction Register
        RegIn    :  in  std_logic_vector(7 downto 0);       -- input register bus
        clock    :  in  std_logic;                          -- system clock
        RegAOut  :  out std_logic_vector(7 downto 0);       -- register bus A out
        RegBOut  :  out std_logic_vector(7 downto 0)        -- register bus B out
    );

end  REG_TEST;

architecture Stuctural of REG_TEST is
    -- Signals between control unit and registers
    signal EnableIn : std_logic;
    signal SelIn    : std_logic_vector(6 downto 0);
    signal SelA     : std_logic_vector(6 downto 0);
    signal SelB     : std_logic_vector(6 downto 0);

    signal RegDataInSel : std_logic_vector(1 downto 0); -- select value to update registers
    signal SpecAddr     : std_logic_vector(1 downto 0); -- selects X, Y, Z, or SP
    signal SpecWr       : std_logic;                    -- whether to write to the special addresses
    signal AddrOffset   : std_logic_vector(15 downto 0); -- offset for address
    signal MemRegAddr   : std_logic_vector(15 downto 0); -- register-based indirect memory access
    signal DataIOSel    : std_logic;                 -- selects whether data is input or output
    signal MemRegData   : std_logic_vector(7 downto 0);
    
    -- Unused signals from Control Unit (should go to ALU)
    signal ALUStatusMask : std_logic_vector(7 downto 0);
    signal ALUStatusBitChangeEn : std_logic;
    signal ALUBitClrSet : std_logic;
    signal ALUBitTOp : std_logic;
    signal ALUOp2Sel : std_logic;
    signal ImmediateOut : std_logic_vector(7 downto 0);
    signal ALUBlockSel  : std_logic_vector(1 downto 0);
    signal ALUBlockInstructionSel : std_logic_vector(3 downto 0);

begin

    Registers : entity work.AVRRegisters
    port map (
        clock    => clock,
        EnableIn => EnableIn,
        SelIn    => SelIn,
        SelA     => SelA,
        SelB     => SelB,

        ALUIn        => RegIn,
        RegDataImm   => ImmediateOut,
        RegDataInSel => RegDataInSel,

        RegAOut  => RegAOut,
        RegBOut  => RegBOut,

        SpecOut  => open,
        SpecAddr => SpecAddr,
        SpecWr   => SpecWr,

        MemRegData => MemRegData,
        AddrOffset => AddrOffset,
        MemRegAddr => MemRegAddr,
        DataIOSel  => DataIOSel,
        
        DebugReg   => open,

        Reset      => '1' -- no reset
    );

    ControlUnit : entity work.AVRControl
    port map (
        clock                  => clock,
        IR                     => IR,
        ProgDB                 => (others => 'X'),
        MemRegAddr             => MemRegAddr,

        ALUStatusMask          => ALUStatusMask,
        ALUStatusBitChangeEn   => ALUStatusBitChangeEn,
        ALUBitClrSet           => ALUBitClrSet,
        ALUBitTOp              => ALUBitTOp,
        ALUOp2Sel              => ALUOp2Sel,
        ImmediateOut           => ImmediateOut,
        ALUBlockSel            => ALUBlockSel,
        ALUBlockInstructionSel => ALUBlockInstructionSel,

        EnableIn               => EnableIn,
        SelIn                  => SelIn,
        SelA                   => SelA,
        SelB                   => SelB,

        DataIOSel              => DataIOSel,
        AddrOffset             => AddrOffset,
        SpecAddr               => SpecAddr,
        SpecWr                 => SpecWr,

        RegDataInSel           => RegDataInSel,
        MemAddr                => open

    );

end Stuctural;

