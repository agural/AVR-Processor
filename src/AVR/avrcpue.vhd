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
--    Debug  - debug return value (0 for no error)
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
        DataDB  :  inout  std_logic_vector( 7 downto 0);   -- data memory data bus
        
        IRDebug :  out    std_logic_vector(15 downto 0);   -- current instruction
        Debug   :  out    std_logic_vector( 7 downto 0)    -- R16 debug output
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
    
    signal ALUResult              : std_logic_vector(7 downto 0);
    signal ALUStatReg             : std_logic_vector(7 downto 0);

    -- Signals between ALU and Registers
    signal RegA         : std_logic_vector(7 downto 0);     -- first operand
    signal RegB         : std_logic_vector(7 downto 0);     -- second operand
        
    -- Signals between Control Unit and Registers
    signal EnableIn     : std_logic;                        -- enable writing to register
    signal SelIn        : std_logic_vector(6 downto 0);     -- select input register for writing
    signal SelA         : std_logic_vector(6 downto 0);     -- register to output at regA
    signal SelB         : std_logic_vector(6 downto 0);     -- register to output at regB
    signal MemRegAddr   : std_logic_vector(15 downto 0);    -- register-based indirect memory access

    signal DataIOSel    : std_logic;                        -- selects whether data is input or output
    signal AddrOffset   : std_logic_vector(15 downto 0);    -- offset of address
    signal SpecAddr     : std_logic_vector(1 downto 0);     -- selects X, Y, Z, or SP
    signal SpecWr       : std_logic;                        -- whether to write to the special addresses
    signal RetAddrSel   : std_logic_vector(1 downto 0);     -- writes stack (SP) entry to return addr buffer

    signal RegDataInSel : std_logic_vector(1 downto 0);     -- selects which input goes to register in
    signal MemAddr      : std_logic_vector(15 downto 0);    -- memory address (16 bits)

    -- Signals between Control Unit and DMA / Memory
    signal DMARead      : std_logic;
    signal DMAWrite     : std_logic;
    
    -- Signals between Control Unit and PMA Unit
    signal IR           : opcode_word;  -- Instruction Register
    signal PCUpdateSel  : std_logic_vector(1 downto 0);  -- source of next program counter
    signal NextPC       : std_logic_vector(15 downto 0); -- next program counter
    signal PCOffset     : std_logic_vector(11 downto 0); -- increment for program counter
    signal NewIns       : std_logic;                     -- indicates new instruction should be loaded

    -- Signals between Registers and PMA Unit
    signal NewPCZ       : std_logic_vector(15 downto 0); -- jump to address stored in Z register
    signal RetAddrRd    : std_logic_vector(15 downto 0); -- jump to address stored in latest stack entry
begin
    IRDebug <= IR;  -- route IR to the debug output
    
    -- Connect the ALU to the testing interface (reads input values and gives
    -- status and result)
    ALU : entity work.ALU
    port map (
        clock                   => clock,

        ALUBlockSel             => ALUBlockSel,
        ALUBlockInstructionSel  => ALUBlockInstructionSel,

        ALUOp2Sel               => ALUOp2Sel,
        ImmediateOut            => ImmediateOut,

        ALUStatusMask           => ALUStatusMask,
        ALUStatusBitChangeEn    => ALUStatusBitChangeEn,
        ALUBitClrSet            => ALUBitClrSet,
        ALUBitTOp               => ALUBitTOp,

        RegAOut                 => RegA,
        RegBOut                 => RegB,

        RegIn                   => ALUResult,
        RegStatus               => ALUStatReg
    );

    -- Connect the Control Unit to the testing interface (reads instruction
    -- and tells ALU what to do)
    ControlUnit : entity work.AVRControl
    port map (
        clock                   => clock,
        IR                      => IR,
        ProgDB                  => ProgDB,
        MemRegAddr              => MemRegAddr,

        ALUStatusMask           => ALUStatusMask,
        ALUStatusBitChangeEn    => ALUStatusBitChangeEn,
        ALUBitClrSet            => ALUBitClrSet,
        ALUBitTOp               => ALUBitTOp,
        ALUOp2Sel               => ALUOp2Sel,
        ImmediateOut            => ImmediateOut,
        ALUBlockSel             => ALUBlockSel,
        ALUBlockInstructionSel  => ALUBlockInstructionSel,
        
        EnableIn                => EnableIn,
        SelIn                   => SelIn,
        SelA                    => SelA,
        SelB                    => SelB,
        
        ALUResult               => ALUResult,
        ALUStatReg              => ALUStatReg,
        
        DataIOSel               => DataIOSel,
        AddrOffset              => AddrOffset,
        SpecAddr                => SpecAddr,
        SpecWr                  => SpecWr,
        RetAddrSel              => RetAddrSel,

        OutRd                   => DMARead,
        OutWr                   => DMAWrite,
        RegDataInSel            => RegDataInSel,
        MemAddr                 => MemAddr,
        
        PCUpdateSel             => PCUpdateSel,
        NextPC                  => NextPC,
        PCOffset                => PCOffset,
        NewIns                  => NewIns
    );
    
    Registers : entity work.AVRRegisters
    port map (
        clock           => clock,
        Reset           => Reset,
        
        EnableIn        => EnableIn,
        SelIn           => SelIn,
        SelA            => SelA,
        SelB            => SelB,

        ALUIn           => ALUResult,
        RegDataImm      => ImmediateOut,
        RegDataInSel    => RegDataInSel,

        RegAOut         => RegA,
        RegBOut         => RegB,

        SpecOut         => NewPCZ,
        SpecAddr        => SpecAddr,
        SpecWr          => SpecWr,

        MemRegData      => DataDB,
        AddrOffset      => AddrOffset,
        MemRegAddr      => MemRegAddr,
        DataIOSel       => DataIOSel,
        
        RetAddrSel      => RetAddrSel,
        RetAddrRd       => RetAddrRd,
        RetAddrWr       => NextPC,
        
        DebugReg        => Debug
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
    
    PMA : entity work.PMAUnit
    port map (
        ProgAB      => ProgAB,
        ProgDB      => ProgDB,
        PCUpdateSel => PCUpdateSel,
        NextPC      => NextPC,
        PCOffset    => PCOffset,
        NewIns      => NewIns,
        IR          => IR,
        NewPCZ      => NewPCZ,
        NewPCS      => RetAddrRd,
        
        Reset       => Reset,
        Clk         => Clock
    );

end Structural;