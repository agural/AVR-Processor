----------------------------------------------------------------------------
--
--  Atmel AVR CPU Test Entity Declaration
--
--  This is the entity declaration which must be used for building the entire
--  AVR CPU design (including data and program memory) for testing.
--
--  Revision History:
--     24 Mar 15  Albert Gural  Added connections between AVR CPU and memories.
--
----------------------------------------------------------------------------


--
--  AVR_CPU_TEST
--
--  This is the ALU testing interface. It is entirely self-contained,
--  except for clock, reset, and interrupt inputs, so testing is done
--  primarily by modifying the program memory.
--
--  Inputs:
--    Clock - clock source
--    Reset - reset input
--    INT0  - interrupts
--    INT1  - ""
--
--  Outputs:
--    NONE
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library opcodes;
use opcodes.opcodes.all;


entity AVR_CPU_TEST is
    port(
        Clock       : in  std_logic;  -- system clock
        Reset       : in  std_logic;  -- global reset
        INT0        : in  std_logic;  -- interrupt 0
        INT1        : in  std_logic   -- interrupt 1
    );
end AVR_CPU_TEST;

architecture Structural of AVR_CPU_TEST is
    signal ProgAB   : std_logic_vector(15 downto 0);
    signal ProgDB   : std_logic_vector(15 downto 0);
    
    signal DataAB   : std_logic_vector(15 downto 0);
    signal DataDB   : std_logic_vector(7 downto 0);
    
    signal DataRd   : std_logic;
    signal DataWr   : std_logic;
begin
    AVRCPU : entity work.AVR_CPU
    port map (
        clock   => clock,
        Reset   => Reset,
        INT0    => INT0,
        INT1    => INT1,
        
        ProgAB  => ProgAB,
        ProgDB  => ProgDB,
        
        DataWr  => DataWr,
        DataRd  => DataRd,
        DataAB  => DataAB,
        DataDB  => DataDB
    );
    
    DataMemory : entity work.DataMemory
    port map (
        RE      => DataRd,
        WE      => DataWr,
        DataAB  => DataAB,
        DataDB  => DataDB
    );
    
    ProgMemory : entity work.ProgMemory
    port map (
        Reset   => Reset,
        ProgAB  => ProgAB,
        ProgDB  => ProgDB
    );
end Structural;
