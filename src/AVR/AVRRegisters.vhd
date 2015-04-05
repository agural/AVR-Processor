----------------------------------------------------------------------------------
-- Company:         Caltech EE 119B
-- Engineer:        Albert Gural and Bryan He
-- 
-- Create Date:     15:07:46 01/25/2015
-- Design Name:     AVR-Processor
-- Module Name:     AVRRegisters - DataFlow 
-- Project Name:    AVR-Processor
-- Target Devices:  Xilinx Spartan III XC3S1200EFGG3204C
-- Tool versions:   Xilinx ISE 14.7
-- Description:     Stores 32 8-bit registers, which can be viewed at any time
--                  and can be updated on clock edges
--
-- Revision: 1.0
-- For file history, see https://github.com/agural/AVR-Processor 
--
----------------------------------------------------------------------------------

-- bring in necessary libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

-- entity specifying which registers to read, and whether or not to update
-- one of the registers
entity AVRRegisters is
    port (
        clock       : in  std_logic;                        -- system clock
        EnableIn    : in  std_logic;                        -- specifies write
        SelIn       : in  std_logic_vector(6 downto 0);     -- register to write to
        SelA        : in  std_logic_vector(6 downto 0);     -- register to read from
        SelB        : in  std_logic_vector(6 downto 0);     -- register to read from

        ALUIn       : in  std_logic_vector(7 downto 0);     -- ALU output
        RegDataImm  : in  std_logic_vector(7 downto 0);     -- Control logic output
        RegDataInSel: in  std_logic_vector(1 downto 0);     -- select value to update registers

        RegAOut     : out std_logic_vector(7 downto 0);     -- first output
        RegBOut     : out std_logic_vector(7 downto 0);     -- second output

        SpecOut     : buffer std_logic_vector(15 downto 0); -- Address Output [X,Y,Z,SP] (no offset)
        SpecAddr    : in  std_logic_vector(1 downto 0);     -- Select X, Y, Z, SP
        SpecWr      : in  std_logic;                        -- Write to X, Y, Z, SP

        MemRegData  : inout  std_logic_vector(7 downto 0);  -- data bus
        AddrOffset  : in  std_logic_vector(15 downto 0);    -- offset for address
        MemRegAddr  : buffer std_logic_vector(15 downto 0); -- updated value for Control
        DataIOSel   : in  std_logic_vector(1 downto 0);     -- specifies input/output (and src if output)
                                                                -- 00 - input from DataDB to regA
                                                                -- 01 - output to DataDB from regA
                                                                -- 10, 11 - output to DataDB from retAddr
                                                            
        RetAddrSel  : in  std_logic_vector( 1 downto 0);    -- when non-zero, updates stackbuffer
        RetAddrWr   : in  std_logic_vector(15 downto 0);    -- write to buffer for most recent CALL
        RetAddrRd   : out std_logic_vector(15 downto 0);    -- read from buffer for most recent RET
        PCZ         : out std_logic_vector(15 downto 0);    -- Z register for PC purposes
        
        DebugReg    : out std_logic_vector(7 downto 0);     -- Register R16 contains debug output
                                                            -- from test program run.
        
        Reset       : in std_logic                          -- reset signal for SP
    );
end AVRRegisters;

architecture DataFlow of AVRRegisters is
    constant NUM_REGS : integer := 96; -- number of registers (including IO)

    -- define the registers
    type REG_ARRAY is array (0 to NUM_REGS-1) of std_logic_vector(7 downto 0);
    signal Registers : REG_ARRAY;
    signal SP           : std_logic_vector(15 downto 0);    -- stack pointer (separate from registers)
    signal RetAddrBuffer: std_logic_vector(15 downto 0);    -- buffer for value to read/write to stack
    signal RetAddr      : std_logic_vector(15 downto 0);    -- signal for current return address
    signal RegIn        : std_logic_vector( 7 downto 0);    -- mux ALU, data, and regdata
    signal RegAInternal : std_logic_vector( 7 downto 0);    -- value of register A
begin
    -- report value of first register
    RegAInternal <= Registers(conv_integer(SelA)) when (conv_integer(SelA) < NUM_REGS) else
                    (others => 'X');
    RegAOut      <= RegAInternal;
    -- report value of second register
    RegBOut      <= Registers(conv_integer(SelB)) when (conv_integer(SelB) < NUM_REGS) else
                    (others => 'X');
    -- output current stack buffer
    RetAddrRd    <= RetAddrBuffer;
    
    RetAddr      <= std_logic_vector(unsigned(RetAddrWr) + to_unsigned(1,16));
 
    DebugReg <= Registers(16);
 
    PCZ     <= Registers(31) & Registers(30);
    SpecOut <= Registers(27) & Registers(26) when (SpecAddr = "00") else
               Registers(29) & Registers(28) when (SpecAddr = "01") else
               Registers(31) & Registers(30) when (SpecAddr = "10") else
               SP                            when (SpecAddr = "11") else
               (others => 'X'); -- output for addr (before offset)

    RegIn <= ALUIn        when (RegDataInSel = "00") else
             MemRegData   when (RegDataInSel = "01") else
             RegDataImm   when (RegDataInSel = "10") else
             RegAInternal when (RegDataInSel = "11") else
             (others => 'X');
    MemRegAddr <= std_logic_vector(signed(SpecOut) + signed(AddrOffset));

    MemRegData <= (others => 'Z') when (DataIOSel = "00") else
                  RegAInternal    when (DataIOSel = "01") else
                  RetAddrBuffer( 7 downto 0) when (DataIOSel = "10") else
                  RetAddr(15 downto 8) when (DataIOSel = "11") else
                  (others => 'X');

    -- we want to transparently update RetAddrBuffer
--    UpdateRetAddr: process (RetAddrSel)
--    begin
--        if (RetAddrSel = "01") then
--            RetAddrBuffer <= 
--        end if;
--    end process UpdateRetAddr;

    -- process to update value in one register if requested
    WriteRegister: process (clock)
    begin
        -- write on rising edge of clock when update is requested
        if rising_edge(clock) then
            if (SpecWr = '1') then
                if    (SpecAddr = "00") then
                    Registers(26) <= MemRegAddr(7 downto 0);
                    Registers(27) <= MemRegAddr(15 downto 8);
                elsif (SpecAddr = "01") then
                    Registers(28) <= MemRegAddr(7 downto 0);
                    Registers(29) <= MemRegAddr(15 downto 8);
                elsif (SpecAddr = "10") then
                    Registers(30) <= MemRegAddr(7 downto 0);
                    Registers(31) <= MemRegAddr(15 downto 8);
                elsif (SpecAddr = "11") then
                    SP <= MemRegAddr;
                end if;
            end if;
            if (EnableIn = '1') then
                -- write value to selected register
                Registers(to_integer(unsigned(SelIn))) <= RegIn;
            end if;
            if    (RetAddrSel = "10") then
                RetAddrBuffer(15 downto 8) <= RetAddrBuffer(15 downto 8);
                RetAddrBuffer( 7 downto 0) <= MemRegData;
            elsif (RetAddrSel = "11") then
                RetAddrBuffer(15 downto 8) <= MemRegData;
                RetAddrBuffer( 7 downto 0) <= RetAddrBuffer( 7 downto 0);
            elsif (RetAddrSel = "01") then
                RetAddrBuffer <= RetAddr;
            else
                RetAddrBuffer <= RetAddrBuffer;
            end if;
            if (Reset = '0') then
                SP <= (others => '1');
            end if;
        end if;
    end process WriteRegister;
end DataFlow;

