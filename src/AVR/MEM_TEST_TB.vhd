----------------------------------------------------------------------------
--
--  Test Bench for AVR Data Memory Unit
--
--  This is a test bench for the AVR Data Memory Access Unit.  The test bench
--  thoroughly exercises the memory accesses by generating various memory
--  access via the instruction register and then checking if the memory
--  address is correct, if the control lines (read and write) are correct,
--  and if the memory data is correct on write operations.  The test bench
--  entity is called mem_test_tb and it is currently defined to test the
--  MEM_TEST entity.
--
--  Revision History:
--     5/19/98   Automated/Active-VHDL    Initial Revision.
--     5/28/00   Glen George              Added much more extensive testing.
--     7/26/00   Glen George              Fixed some minor problems.
--     6/4/04    Glen George              Fixed formatting and updated
--                                        comments.
--     2/5/06    Glen George              Updated comments and formatting.
--     2/11/13   Glen George              Added better error reporting.
--     2/16/13   Glen George              Fixed polarity of reset.
--
----------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library avr;
use avr.opcodes.all;

library work;
use work.std_logic_1164_additions.all;


entity mem_test_tb is
end mem_test_tb;


architecture TB_ARCHITECTURE of mem_test_tb is

    -- Component declaration of the tested unit
    component MEM_TEST
        port (
            Clock   :  in     std_logic;			-- system clock
            Reset   :  in     std_logic;			-- active low system reset
            IR      :  in     opcode_word;			-- Instruction Register
            DataRd  :  out    std_logic;			-- memory read signal
            DataWr  :  out    std_logic;			-- memory write signal
            ProgDB  :  in     std_logic_vector(15 downto 0);	-- second word of instruction
            DataAB  :  out    std_logic_vector(15 downto 0);	-- data address bus
            DataDB  :  inout  std_logic_vector(7 downto 0)	-- data data bus
        );
    end component;


    -- Stimulus signals - signals mapped to the input and inout ports of tested entity
    signal  Clock    :  std_logic;
    signal  Reset    :  std_logic;
    signal  IR       :  opcode_word;
    signal  ProgDB   :  std_logic_vector(15 downto 0);
    signal  DataDB   :  std_logic_vector(7 downto 0);

    -- Observed signals - signals mapped to the output ports of tested entity
    signal  DataRd   :  std_logic;
    signal  DataWr   :  std_logic;
    signal  DataAB   :  std_logic_vector(15 downto 0);

    --Signal used to stop clock signal generators
    signal  END_SIM  :  BOOLEAN := FALSE;

    -- test value types
    type  opcode_array  is array (natural range <>) of opcode_word;
    type  byte_array    is array (natural range <>) of std_logic_vector(7 downto 0);
    type  addr_array    is array (natural range <>) of std_logic_vector(15 downto 0);
    type  inst_array    is array (natural range <>) of string(1 to 17);

    -- actual test vectors

    -- the instructions
    constant  TestInstructions  :  inst_array(0 to 58) := (
        "LDI   R27, 0     ", "LDI   R26, 0     ", "LDI   R29, $FF   ",
        "LDI   R28, $FF   ", "LDI   R31, $FF   ", "LDI   R30, $C0   ",
        "LDS   R0, $AAAA  ", "LDS   R1, $5555  ", "LD    R7, X      ",
        "LD    R9, -X     ", "LD    R20, X+    ", "LD    R21, X     ",
        "LD    R6, Y+     ", "LD    R23, Y     ", "LD    R22, -Y    ",
        "LDD   R15, Y + 30", "LD    R4, Z+     ", "LD    R13, Z     ",
        "LD    R2, -Z     ", "LDD   R17, Z + 60", "MOV   R14, R7    ",
        "MOV   R11, R13   ", "LDI   R24, $55   ", "LDI   R18, $AA   ",
        "PUSH  R2         ", "PUSH  R11        ", "PUSH  R18        ",
        "POP   R3         ", "POP   R8         ", "POP   R12        ",
        "LDI   R27, $FF   ", "LDI   R26, $FF   ", "LDI   R29, $FF   ",
        "LDI   R28, $C0   ", "LDI   R31, $00   ", "LDI   R30, $80   ",
        "STS   $5555, R0  ", "STS   $AAAA, R1  ", "ST    X, R2      ",
        "ST    -X, R4     ", "ST    X+, R17    ", "ST    X+, R9     ",
        "ST    X, R26     ", "ST    Y+, R21    ", "ST    Y, R23     ",
        "ST    -Y, R22    ", "ST    Y, R28     ", "STD   Y + 60, R24",
        "STD   Y + 2, R20 ", "STD   Y + 22, R15", "STD   Y + 1, R13 ",
        "ST    Z+, R14    ", "ST    Z, R3      ", "ST    -Z, R18    ",
        "ST    Z, R31     ", "STD   Z + 30, R8 ", "STD   Z + 1, R11 ",
        "STD   Z + 63, R12", "STD   Z + 32, R6 "                      );

    -- the Instruction Register values
    signal  IRTestVals      :  opcode_array(0 to 58) := (
                               X"E0B0", X"E0A0", X"EFDF", X"EFCF", X"EFFF", 
                               X"ECE0", X"9000", X"9010", X"907C", X"909E", 
                               X"914D", X"915C", X"9069", X"8178", X"916A", 
                               X"8CFE", X"9041", X"80D0", X"9022", X"AD14", 
                               X"2CE7", X"2CBD", X"E585", X"EA2A", X"922F", 
                               X"92BF", X"932F", X"903F", X"908F", X"90CF", 
                               X"EFBF", X"EFAF", X"EFDF", X"ECC0", X"E0F0", 
                               X"E8E0", X"9200", X"9210", X"922C", X"924E", 
                               X"931D", X"929D", X"93AC", X"9359", X"8378", 
                               X"936A", X"83C8", X"AF8C", X"834A", X"8AFE", 
                               X"82D9", X"92E1", X"8230", X"9322", X"83F0", 
                               X"8E86", X"82B1", X"AEC7", X"A260"          );

    -- second word of instruction for each instruction (most are 1 word)
    signal  ProgDBVals      :  opcode_array(0 to 58) := (
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", X"AAAA",            X"5555",            "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", X"5555",            X"AAAA",            "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", 
                               "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXXX"                     );

    -- supplied data bus values for each instruction (for read operations)
    signal  DataDBVals      :  byte_array(0 to 58) := (
                               "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", 
                               "ZZZZZZZZ", X"32",      X"A1",      X"67",      X"F0",      
                               X"0F",      X"5A",      X"A5",      X"B3",      X"29",      
                               X"C7",      X"EE",      X"00",      X"FF",      X"21",      
                               "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", 
                               "ZZZZZZZZ", "ZZZZZZZZ", X"CC",      X"39",      X"66",      
                               "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", 
                               "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", 
                               "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", 
                               "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", 
                               "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", 
                               "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ" 
           );

    -- expected data addres bus values for each instruction
    signal  DataABTestVals  :  addr_array(0 to 58) := (
                               "----------------", "----------------", "----------------", "----------------", "----------------", 
                               "----------------", X"AAAA",            X"5555",            X"0000",            X"FFFF",            
                               X"FFFF",            X"0000",            X"FFFF",            X"0000",            X"FFFF",            
                               X"001D",            X"FFC0",            X"FFC1",            X"FFC0",            X"FFFC",            
                               "----------------", "----------------", "----------------", "----------------", X"FFFF",            
                               X"FFFE",            X"FFFD",            X"FFFD",            X"FFFE",            X"FFFF",            
                               "----------------", "----------------", "----------------", "----------------", "----------------", 
                               "----------------", X"5555",            X"AAAA",            X"FFFF",            X"FFFE",            
                               X"FFFE",            X"FFFF",            X"0000",            X"FFC0",            X"FFC1",            
                               X"FFC0",            X"FFC0",            X"FFFC",            X"FFC2",            X"FFD6",            
                               X"FFC1",            X"0080",            X"0081",            X"0080",            X"0080",            
                               X"009E",            X"0081",            X"00BF",            X"00A0"                     );

    -- expected data bus write signal for each instruction
    signal  DataWrTestVals  :  std_logic_vector(0 to 58) :=
                               "11111111111111111111111100011111111100000000000000000000000";

    -- expected data bus read signal for each instruction
    signal  DataRdTestVals  :  std_logic_vector(0 to 58) :=
                               "11111100000000000000111111100011111111111111111111111111111";

    -- expected data bus output values for each instruction (only has a value on writes)
    signal  DataDBTestVals  :  byte_array(0 to 58) := (
                               "--------", "--------", "--------", "--------", "--------", 
                               "--------", "--------", "--------", "--------", "--------", 
                               "--------", "--------", "--------", "--------", "--------", 
                               "--------", "--------", "--------", "--------", "--------", 
                               "--------", "--------", "--------", "--------", X"FF",      
                               X"00",      X"AA",      "--------", "--------", "--------", 
                               "--------", "--------", "--------", "--------", "--------", 
                               "--------", X"32",      X"A1",      X"FF",      X"EE",      
                               X"21",      X"F0",      X"00",      X"5A",      X"B3",      
                               X"29",      X"C0",      X"55",      X"0F",      X"C7",      
                               X"00",      X"67",      X"CC",      X"AA",      X"00",      
                               X"39",      X"00",      X"66",      X"A5"                 );



begin

    -- Unit Under Test port map
    UUT : MEM_TEST
        port map (
            Clock   =>  Clock,
            Reset   =>  Reset,
            IR      =>  IR,
            DataRd  =>  DataRd,
            DataWr  =>  DataWr,
            ProgDB  =>  ProgDB,
            DataAB  =>  DataAB,
            DataDB  =>  DataDB
        );


    -- now generate the stimulus and test the design
    process
    begin

        -- initialize into the reset state
        Reset   <=  '0';
        IR      <=  IRTestVals(0);
        ProgDB  <=  ProgDBVals(0);
        DataDB  <=  "ZZZZZZZZ";

        -- wait for a while to remove the reset signal
        wait for 320 ns;
        Reset  <=  '1';

        -- wait for the rising clock edge
        -- this may need to be changed to get student FSM synced correctly
        --    (change should be adding multiples of 100 ns)
        wait for 50 ns;


        -- now loop on the test values
        for test_no in IRTestVals'range  loop

            -- generate the instruction and program data bus
            IR      <=  IRTestVals(test_no);
            ProgDB  <=  "XXXXXXXXXXXXXXXX";     -- don't care on first clock

            -- check that the read and write lines are not low
            if  (DataRd /= '1')  then
                -- there is an error - report it
                REPORT "Failure in Testing - illegal DataRd activation"
                SEVERITY ERROR;
            end if;
            if  (DataWr /= '1')  then
                -- there is an error - report it
                REPORT "Failure in Testing - illegal DataWr activation"
                SEVERITY ERROR;
            end if;

            -- wait a half clock (all instructions take two clocks)
            wait for 50 ns;     -- half a clock cycle

            -- check that the read and write lines are not low
            -- they should not be activated in the first clock
            if  (DataRd /= '1')  then
                -- there is an error - report it
                REPORT "Failure in Testing - illegal DataRd activation"
                SEVERITY ERROR;
            end if;
            if  (DataWr /= '1')  then
                -- there is an error - report it
                REPORT "Failure in Testing - illegal DataWr activation"
                SEVERITY ERROR;
            end if;

            -- now wait the second half of the clock cycle
            wait for 50 ns;

            -- start of second clock cycle

            -- make sure still no read or write
            if  (DataRd /= '1')  then
                -- there is an error - report it
                REPORT "Failure in Testing - illegal DataRd activation"
                SEVERITY ERROR;
            end if;
            if  (DataWr /= '1')  then
                -- there is an error - report it
                REPORT "Failure in Testing - illegal DataWr activation"
                SEVERITY ERROR;
            end if;


            -- for the second cycle of the instruction set the program data
            --    bus and the data memory data bus
            ProgDB  <=  ProgDBVals(test_no);
            DataDB  <=  DataDBVals(test_no);


            -- if the program data bus has a value (address) will need another
            -- clock since this is an absolute addressing mode instruction
            if  (ProgDBVals(test_no) /= "XXXXXXXXXXXXXXXX")  then

                wait for 50 ns;     -- first half clock of the 2nd cycle of 3

                -- middle of second cycle

                -- make sure still no read or write
                if  (DataRd /= '1')  then
                    -- there is an error - report it
                    REPORT "Failure in Testing - illegal DataRd activation"
                    SEVERITY ERROR;
                end if;
                if  (DataWr /= '1')  then
                    -- there is an error - report it
                    REPORT "Failure in Testing - illegal DataWr activation"
                    SEVERITY ERROR;
                end if;

                wait for 50 ns;     -- second half of the clock cycle

                -- start of the third cycle

                -- should still be no read or write
                if  (DataRd /= '1')  then
                    -- there is an error - report it
                    REPORT "Failure in Testing - illegal DataRd activation"
                    SEVERITY ERROR;
                end if;
                if  (DataWr /= '1')  then
                    -- there is an error - report it
                    REPORT "Failure in Testing - illegal DataWr activation"
                    SEVERITY ERROR;
                end if;

            end if;


            -- wait for the outputs to be ready
            wait for 50 ns;

            -- end of the last cycle (either the 2nd or 3rd cycle)

            -- test the outputs

            -- first test the read and write lines
            if  (DataRd /= DataRdTestVals(test_no))  then
                -- read line is wrong - report it
                REPORT "Failure in Testing - illegal DataRd value"
                SEVERITY ERROR;
            end if;
            if  (DataWr /= DataWrTestVals(test_no))  then
                -- write line is wrong - report it
                REPORT "Failure in Testing - illegal DataWr value"
                SEVERITY ERROR;
            end if;

            -- test the data address bus
            if (std_match(DataAB, DataABTestVals(test_no))) then
                -- all is OK - do nothing
                null;
            else
                -- there is an addressing error - report it
                REPORT "Failed Test #" &
                       " - Bad Address Bus Value --" &
                       " Instruction: " & TestInstructions(test_no) &
                       " IR: " & to_hstring(IR) &
                       " Address: " & to_hstring(DataAB) &
                       " Expected Address: " & to_hstring(DataABTestVals(test_no))
                SEVERITY ERROR;
            end if;

            -- finally, test the data memory data bus
            if (std_match(DataDB, DataDBTestVals(test_no))) then
                -- all is OK - do nothing
                null;
            else
                -- there is an error on the data bus - report it
                REPORT "Failed Test #" &
                       " - Bad Data Memory Data Bus Value --" &
                       " Instruction: " & TestInstructions(test_no) &
                       " IR: " & to_hstring(IR) &
                       " Data: " & to_hstring(DataDB) &
                       " Expected Data: " & to_hstring(DataDBTestVals(test_no))
                SEVERITY ERROR;
            end if;

            -- now wait for the next clock
            wait for 50 ns;     -- just half a cycle to wait

        end loop;


        -- signal the end of the simulation
        END_SIM <= TRUE;

        --  end of stimulus events, wait for simulation to end
        wait;

    end process; -- end of stimulus process

    
    -- clock process
    --
    -- generates a clock with a 100 ns period and a 50% duty cycle

    CLOCK_clock : process
    begin

        -- stop the clock when the end of the test vectors is reached
        if  END_SIM = FALSE  then
            clock <= '0';
            wait for 50 ns;
        else
            wait;
        end if;

        if  END_SIM = FALSE  then
            clock <= '1';
            wait for 50 ns;
        else
            wait;
        end if;

    end process;


end TB_ARCHITECTURE;
