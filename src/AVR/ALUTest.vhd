----------------------------------------------------------------------------
--
--  Atmel AVR ALU Test Entity Declaration
--
--  This is the entity declaration which must be used for building the ALU
--  portion of the AVR design for testing.
--
--  Revision History:
--     17 Apr 98  Glen George       Initial revision.
--     20 Apr 98  Glen George       Fixed minor syntax bugs.
--     18 Apr 04  Glen George       Updated comments and formatting.
--     21 Jan 06  Glen George       Updated comments.
--     28 Jan 15  Bryan He          Added connections to ALU and control block
--
----------------------------------------------------------------------------


--
--  ALU_TEST
--
--  This is the ALU testing interface.  It just brings all the important
--  ALU signals out for testing along with the Instruction Register.
--
--  Inputs:
--    IR       - Instruction Register (16 bits)
--    OperandA - first operand to ALU (8 bits) - looks like the output
--               of the register array
--    OperandB - second operand to ALU (8 bits) - looks like the output
--               of the register array
--    clock    - the system clock
--
--  Outputs:
--    Result   - result of the ALU operation selected by the Instruction
--               Register (8 bits)
--    StatReg  - Status Register contents (8 bits)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library opcodes;
use opcodes.opcodes.all;


entity  ALU_TEST  is

    port(
        IR        :  in  opcode_word;                       -- Instruction Register
        OperandA  :  in  std_logic_vector(7 downto 0);      -- first operand
        OperandB  :  in  std_logic_vector(7 downto 0);      -- second operand
        clock     :  in  std_logic;                         -- system clock
        Result    :  out std_logic_vector(7 downto 0);      -- ALU result
        StatReg   :  out std_logic_vector(7 downto 0)       -- status register
    );

end  ALU_TEST;

architecture Structural of ALU_TEST is
    -- Communication between Control Unit and ALU
    signal ALUBlockSel            : std_logic_vector(1 downto 0);
    signal ALUBlockInstructionSel : std_logic_vector(3 downto 0);

    signal ALUOp2Sel              : std_logic;
    signal ImmediateOut           : std_logic_vector(7 downto 0);

    signal ALUStatusMask          : std_logic_vector(7 downto 0);
    signal ALUStatusBitChangeEn   : std_logic;
    signal ALUBitClrSet           : std_logic;
    signal ALUBitTOp              : std_logic;

    signal RegIn                  : std_logic_vector(7 downto 0);

    -- Unused signals from Control Unit (should go to registers)
    signal EnableIn : std_logic;
    signal SelIn    : std_logic_vector(6 downto 0);
    signal SelA     : std_logic_vector(6 downto 0);
    signal SelB     : std_logic_vector(6 downto 0);



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

        RegAOut => OperandA,
        RegBOut => OperandB,

        RegIn => Result,
        RegStatus => StatReg
    );

    -- Connect the Control Unit to the testing interface (reads instruction
    -- and tells ALU what to do)
    ControlUnit : entity work.AVRControl
    port map (
        clock                  => clock,
        IR                     => IR,
        ProgDB                 => (others => 'X'),
        MemRegAddr             => (others => 'X'),

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
        
        DataIOSel              => open,
        AddrOffset             => open,
        SpecAddr               => open,
        SpecWr                 => open,

        RegDataInSel           => open,
        MemAddr                => open
    );

end Structural;
