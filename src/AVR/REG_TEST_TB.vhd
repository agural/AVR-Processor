----------------------------------------------------------------------------
--
--  Atmel AVR Register Array Test Bench
--
--  Revision History:
--      01/25/15    Peter Cuy       initial version
--
----------------------------------------------------------------------------
-- bring in the necessary packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;       --contains conversion functions

library opcodes;
use opcodes.opcodes.all;

library ALUCommands;
use ALUCommands.ALUCommands.all;

entity REG_TEST_TB is
    constant NUM_REGS : integer := 32;
    type REG_ARRAY is array (0 to NUM_REGS-1) of std_logic_vector(7 downto 0);

function CALC_FLAGS (flags          : std_logic_vector(7 downto 0);
                     result         : std_logic_vector(7 downto 0);
                     carry          : std_logic;
                     overflow       : std_logic;
                     halfcarry      : std_logic;
                     transferbit    : std_Logic;
                     flagmask       : std_logic_vector(7 downto 0);
                     bypassFlagCalc : std_logic)
                     return std_logic_vector is
     variable newFlags : std_logic_vector(7 downto 0) := "00000000";
begin
    if (bypassFlagCalc = '0') then
        newFlags(flag_C) := carry;
        if (result = "00000000") then 
            newFlags(flag_Z) := '1';
        end if;    
        newFlags(flag_N) := result(7);
        newFlags(flag_V) := overflow;
        newFlags(flag_S) := result(7) xor overflow;
        newFlags(flag_H) := halfcarry;
        newFlags(flag_T) := transferbit;
    else
        newFlags := result;
    end if;
        newFlags := (newFlags and flagmask) or (flags and (not flagmask));
    return result;
end CALC_FLAGS;

function CALC_CARRY (A  : std_logic_vector(7 downto 0);
                         B  : std_logic_vector(7 downto 0);
                         carryin: std_logic;
                         carrybit: integer) --calculate carry out of carrybit
                         return std_logic is
     variable temp : std_logic_vector( (carrybit+1) downto 0);
begin
    temp := std_logic_vector( unsigned('0' & A(carrybit downto 0)) + 
                              unsigned('0' & B(carrybit downto 0)) +
                              unsigned(std_logic_vector(to_unsigned(0,carrybit+1)) & carryin) );
    return temp(carrybit+1);
end CALC_CARRY;

procedure ADC_OP 
    (variable OP1        : in    integer;
     variable OP2        : in    integer;
     signal Registers  : inout REG_ARRAY;
     signal flags      : inout std_logic_vector(7 downto 0);
     signal IR         : out   opcode_word;
     signal NextRegIn  : out   std_logic_vector(7 downto 0);
     signal ExpRegAOut : out   std_logic_vector(7 downto 0);
     signal ExpRegBOut : out   std_logic_vector(7 downto 0)) is
     
     variable RegD     :    std_logic_vector(4 downto 0);
     variable RegR     :    std_logic_vector(4 downto 0);
     variable result   :    std_logic_vector(7 downto 0);
begin
    RegD := std_logic_vector ( to_unsigned (OP1, RegD'length));
    RegR := std_logic_vector ( to_unsigned (OP2, RegR'length));
    IR <= "000111" & RegR(RegR'left) & RegD & RegR( RegR'left - 1 downto 0);
    
    --set expected register A and B out
    ExpRegAOut <= Registers(OP1);
    ExpRegBOut <= Registers(OP2);
    result:= std_logic_vector(unsigned(Registers(OP1)) + unsigned(Registers(OP2)) + unsigned(std_logic_vector(to_unsigned(0,7)) & flags(flag_C)));
    NextRegIn <= result;
    flags <= CALC_FLAGS (flags          =>   flags  ,
                         result         =>  result,
                         carry          => CALC_CARRY(Registers(OP1), Registers(OP2), flags(flag_C), 7),
                         
                         overflow       => (CALC_CARRY(Registers(OP1), Registers(OP2), flags(flag_C), 7) xor
                                           CALC_CARRY(Registers(OP1), Registers(OP2), flags(flag_C), 6)),
                                           
                         halfcarry      => CALC_CARRY(Registers(OP1), Registers(OP2), flags(flag_C), 3),
                         transferbit    => '0',
                         flagmask       => flag_mask_ZCNVSH,
                         bypassFlagCalc => '0'
    );

    
end ADC_OP;


                         





end REG_TEST_TB;

architecture TB_ARCHITECTURE of REG_TEST_TB is 
    component REG_TEST
        port (
            IR       :  in  opcode_word;                        -- Instruction Register
            RegIn    :  in  std_logic_vector(7 downto 0);       -- input register bus
            clock    :  in  std_logic;                          -- system clock
            RegAOut  :  out std_logic_vector(7 downto 0);       -- register bus A out
            RegBOut  :  out std_logic_vector(7 downto 0)  
        );
    end component;
    
    
    
    signal Registers : REG_ARRAY;
    
    signal IR           :   opcode_word;                        -- Instruction Register
    signal RegIn        :   std_logic_vector(7 downto 0);       -- input register bus
    signal clock        :   std_logic;                          -- system clock
    signal RegAOut      :   std_logic_vector(7 downto 0);       -- register bus A out
    signal RegBOut      :   std_logic_vector(7 downto 0);  
    
 
    signal ExpRegAOut      :   std_logic_vector(7 downto 0);    -- expected register bus A out
    signal ExpRegBOut      :   std_logic_vector(7 downto 0);    -- expected register bus B out
    signal flags           :   std_logic_vector(7 downto 0);

    signal  END_SIM     :  BOOLEAN := FALSE;                   -- end simulation flag

    
    begin
    UUT : REG_TEST
        port map(
            IR      =>  IR     , 
            RegIn   =>  RegIn  , 
            clock   =>  clock  , 
            RegAOut =>  RegAOut, 
            RegBOut =>  RegBOut 
        );
        
    process
        variable OP1        :  integer;
        variable OP2        :  integer;
    begin
        
        for I in 0 to (NUM_REGS-1) loop
            Registers(I) <= "00000000";
        end loop;
        OP1 := 0;
        OP2 := 31;
        
        ADC_OP(OP1,OP2,Registers,flags, IR, RegIn, ExpRegAOut, ExpRegBOut);
        wait for 20 ns;
        wait for 20 ns;
        
        END_SIM <= TRUE;    --end of stimulus events
        wait;               --wait for the simulation to end
    end process;
    
    CLOCK_CLK : process
  
    begin

        -- this process generates a 20 ns period, 50% duty cycle clock

        -- only generate clock if still simulating

        if END_SIM = FALSE then
            clock <= '0';
            wait for 10 ns;
        else
            wait;
        end if;

        if END_SIM = FALSE then
            clock <= '1';
            wait for 10 ns;
        else
            wait;
        end if;

    end process;


     


end TB_ARCHITECTURE;





