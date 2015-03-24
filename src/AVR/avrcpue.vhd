----------------------------------------------------------------------------
--
--  Atmel AVR CPU Entity Declaration
--
--  This is the entity declaration for the complete AVR CPU.  The design
--  should implement this entity to make testing possible.
--
--  Revision History:
--     11 May 98  Glen George       Initial revision.
--      9 May 00  Glen George       Updated comments.
--      7 May 02  Glen George       Updated comments.
--     21 Jan 08  Glen George       Updated comments.
--
----------------------------------------------------------------------------


--
--  AVR_CPU
--
--  This is the complete entity declaration for the AVR CPU.  It is used to
--  test the complete design.
--
--  Inputs:
--    ProgDB - program memory data bus (16 bits)
--    Reset  - active low reset signal
--    INT0   - active low interrupt
--    INT1   - active low interrupt
--    clock  - the system clock
--
--  Outputs:
--    ProgAB - program memory address bus (16 bits)
--    DataAB - data memory address bus (16 bits)
--    DataWr - data write signal
--    DataRd - data read signal
--
--  Inputs/Outputs:
--    DataDB - data memory data bus (8 bits)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library opcodes;
use opcodes.opcodes.all;


entity AVR_CPU is
    port (
        clock   :  in     std_logic;                       -- system clock
        Reset   :  in     std_logic;                       -- reset signal (active low)
        
        INT0    :  in     std_logic;                       -- interrupt signal (active low)
        INT1    :  in     std_logic;                       -- interrupt signal (active low)
        
        ProgAB  :  out    std_logic_vector(15 downto 0);   -- program memory address bus
        ProgDB  :  in     std_logic_vector(15 downto 0);   -- program memory data bus
        
        DataWr  :  out    std_logic;                       -- data memory write enable (active low)
        DataRd  :  out    std_logic;                       -- data memory read enable (active low)
        DataAB  :  out    std_logic_vector(15 downto 0);   -- data memory address bus
        DataDB  :  inout  std_logic_vector(7 downto 0)     -- data memory data bus
    );
end AVR_CPU;


architecture Structural of AVR_CPU is
    -- Signals between Control Unit and ALU
    signal ALUBlockSel            : std_logic_vector(1 downto 0);
    signal ALUBlockInstructionSel : std_logic_vector(3 downto 0);

    signal ALUOp2Sel              : std_logic;
    signal ImmediateOut           : std_logic_vector(7 downto 0);

    signal ALUStatusMask          : std_logic_vector(7 downto 0);
    signal ALUStatusBitChangeEn   : std_logic;
    signal ALUBitClrSet           : std_logic;
    signal ALUBitTOp              : std_logic;

    signal RegIn                  : std_logic_vector(7 downto 0);

    -- Signals between ALU and Registers
    signal RegA         : std_logic_vector(7 downto 0);      -- first operand
    signal RegB         : std_logic_vector(7 downto 0);      -- second operand
    signal ALUResult    : std_logic_vector(7 downto 0);      -- ALU result
    signal ALUStatReg   : std_logic_vector(7 downto 0);      -- status register
        
    -- Signals between Control Unit and Registers
    signal EnableIn     : std_logic;
    signal SelIn        : std_logic_vector(6 downto 0);
    signal SelA         : std_logic_vector(6 downto 0);
    signal SelB         : std_logic_vector(6 downto 0);
    
    -- Signals between Control Unit and DMA / Memory
    signal MemRegAddr   : std_logic_vector(15 downto 0);-- register-based indirect memory access
    signal ImmediateOut : std_logic_vector(7 downto 0); -- value of immediate

    signal DataIOSel    : std_logic;                    -- selects whether data is input or output
    signal AddrOffset   : std_logic_vector(15 downto 0);-- offset of address
    signal SpecAddr     : std_logic_vector(1 downto 0); -- selects X, Y, Z, or SP
    signal SpecWr       : std_logic;                    -- whether to write to the special addresses

    signal RegDataInSel : std_logic_vector(1 downto 0); -- selects which input goes to register in
    signal MemAddr      : std_logic_vector(15 downto 0);-- memory address (16 bits)

    signal DMARead      : std_logic;
    signal DMAWrite     : std_logic;
    
    -- Signals between Control Unit and PMA Unit
    signal IR           : opcode_word;  -- Instruction Register

begin
    -- Connect the ALU to the testing interface (reads input values and gives
    -- status and result)
    ALU : entity work.ALU
    port map (
        clock => clock,

        ALUBlockSel => ALUBlockSel,
        ALUBlockInstructionSel => ALUBlockInstructionSel,

        ALUOp2Sel => ALUOp2Sel,
        ImmediateOut => ImmediateOut,

        ALUStatusMask => ALUStatusMask,
        ALUStatusBitChangeEn => ALUStatusBitChangeEn,
        ALUBitClrSet => ALUBitClrSet,
        ALUBitTOp => ALUBitTOp,

        RegAOut => RegA,
        RegBOut => RegB,

        RegIn => Result,
        RegStatus => StatReg
    );

    -- Connect the Control Unit to the testing interface (reads instruction
    -- and tells ALU what to do)
    ControlUnit : entity work.AVRControl
    port map (
        clock                  => clock,
        IR                     => IR,
        ProgDB                 => ProgDB,
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

        OutRd                  => DMARead,
        OutWr                  => DMAWrite,
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

        ALUIn        => ALUResult,
        RegDataImm   => ImmediateOut,
        RegDataInSel => RegDataInSel,

        RegAOut  => RegA,
        RegBOut  => RegB,

        SpecOut  => open,
        SpecAddr => SpecAddr,
        SpecWr   => SpecWr,

        MemRegData => DataDB,
        AddrOffset => AddrOffset,
        MemRegAddr => MemRegAddr,
        DataIOSel  => DataIOSel,

        Reset      => Reset
    );

    DMA : entity work.DMAUnit
    port map (
        clock   => clock,
        MemAddr => MemAddr,
        MemAB   => DataAB,
        InRd    => DMARead,
        InWr    => DMAWrite,
        OutRd   => DataRd,
        OutWr   => DataWr
    );

end Structural;