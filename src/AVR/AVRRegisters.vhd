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

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

-- entity specifying which registers to read, and whether or not to update
-- one of the registers
entity AVRRegisters is
    port (
        clock    : in  std_logic;                    -- system clock
        EnableIn : in  std_logic;                    -- specifies write
        SelIn    : in  std_logic_vector(6 downto 0); -- register to write to
        SelA     : in  std_logic_vector(6 downto 0); -- register to read from
        SelB     : in  std_logic_vector(6 downto 0); -- register to read from

        ALUIn        : in std_logic_vector(7 downto 0); -- ALU output
        RegDataImm   : in std_logic_vector(7 downto 0); -- Control logic output
        RegDataInSel : in std_logic_vector(1 downto 0); -- select value to update registers

        RegAOut  : out    std_logic_vector(7 downto 0); -- first output
        RegBOut  : out    std_logic_vector(7 downto 0); -- second output

        SpecOut  : buffer std_logic_vector(15 downto 0); -- Address Output (no offset)
        SpecAddr : in  std_logic_vector(1 downto 0);  -- Select X, Y, Z, SP
        SpecWr   : in  std_logic;                     -- Write to X, Y, Z, SP

        MemRegData : inout  std_logic_vector(7 downto 0);  -- data bus
        AddrOffset : in     std_logic_vector(15 downto 0); -- offset for address
        MemRegAddr : buffer std_logic_vector(15 downto 0); -- updated value for Control
        DataIOSel  : in     std_logic;                     -- specifies input/output
                                                           -- 0 - input from DB
                                                           -- 1 - output from DB
        Reset      : in std_logic -- reset signal for SP
    );
end AVRRegisters;

architecture DataFlow of AVRRegisters is
    constant NUM_REGS : integer := 96; -- number of registers (including IO)

    -- define the registers
    type REG_ARRAY is array (0 to NUM_REGS-1) of std_logic_vector(7 downto 0);
    signal Registers : REG_ARRAY;
    signal SP : std_logic_vector(15 downto 0);
    signal RegIn : std_logic_vector(7 downto 0); -- mux ALU, data, and regdata
    signal RegAInternal : std_logic_vector(7 downto 0);
begin

    RegAInternal <= Registers(to_integer(unsigned(SelA))); -- report value of first register
    RegAOut      <= RegAInternal;
    RegBOut      <= Registers(to_integer(unsigned(SelB))); -- report value of second register
    SpecOut <= Registers(27) & Registers(26) when (SpecAddr = "00") else
               Registers(29) & Registers(28) when (SpecAddr = "01") else
               Registers(31) & Registers(30) when (SpecAddr = "01") else
               SP                            when (SpecAddr = "11") else
               (others => 'X'); -- output for addr (before offset)

    RegIn <= ALUIn        when (RegDataInSel = "00") else
             MemRegData   when (RegDataInSel = "01") else
             RegDataImm   when (RegDataInSel = "10") else
             RegAInternal when (RegDataInSel = "11") else
             (others => 'X');
    MemRegAddr <= std_logic_vector(signed(SpecOut) + signed(AddrOffset));

    MemRegData <= (others => 'Z') when (DataIOSel = '0') else
                  RegAInternal    when (DataIOSel = '1') else
                  (others => 'X');

    -- process to update value in one register if requested
    WriteRegister: process (clock)
    begin
        -- write on rising edge of clock when update is requested
        if rising_edge(clock) then
            if (EnableIn = '1') then
                -- write value to selected register
                Registers(to_integer(unsigned(SelIn))) <= RegIn;
            end if;
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
            if (Reset = '0') then
                SP <= (others => '1');
            end if;
        end if;
    end process WriteRegister;
end DataFlow;

