----------------------------------------------------------------------------
--
--  Atmel AVR Register Array Test Bench
--
--  Because of the nature of the tests required, it was seen as a lot
--  simpler to create a C++ program to generate the tests.
--  This allows us to use smart data structures that prevent excessive
--  code duplication.
--  
--  The C++ generator code can be found in:
--      ../../test_gen/reg_test_generator.cpp
--  And the associated generated tests are in:
--      ../../test_gen/reg_test.txt
--
--  Revision History:
--      01/25/15    Peter Cuy       initial version
--      01/28/15    Albert Gural    added C++ generated tests
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
    
    signal IR           :   opcode_word;                        -- Instruction Register
    signal RegIn        :   std_logic_vector(7 downto 0);       -- input register bus
    signal clock        :   std_logic;                          -- system clock
    signal RegAOut      :   std_logic_vector(7 downto 0);       -- register bus A out
    signal RegBOut      :   std_logic_vector(7 downto 0);
    
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
    
    -- Main testing procedure
    process
    begin
        wait for 25 ns;
        

        -- initialize all registers to 0
        IR <= "0000110000000000";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00000000";
        wait for 10 ns;
        IR <= "0000110000010001";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00000001";
        wait for 10 ns;
        IR <= "0000110000100010";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00000010";
        wait for 10 ns;
        IR <= "0000110000110011";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00000011";
        wait for 10 ns;
        IR <= "0000110001000100";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00000100";
        wait for 10 ns;
        IR <= "0000110001010101";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00000101";
        wait for 10 ns;
        IR <= "0000110001100110";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00000110";
        wait for 10 ns;
        IR <= "0000110001110111";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00000111";
        wait for 10 ns;
        IR <= "0000110010001000";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00001000";
        wait for 10 ns;
        IR <= "0000110010011001";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00001001";
        wait for 10 ns;
        IR <= "0000110010101010";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00001010";
        wait for 10 ns;
        IR <= "0000110010111011";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00001011";
        wait for 10 ns;
        IR <= "0000110011001100";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00001100";
        wait for 10 ns;
        IR <= "0000110011011101";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00001101";
        wait for 10 ns;
        IR <= "0000110011101110";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00001110";
        wait for 10 ns;
        IR <= "0000110011111111";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00001111";
        wait for 10 ns;
        IR <= "0000111100000000";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00010000";
        wait for 10 ns;
        IR <= "0000111100010001";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00010001";
        wait for 10 ns;
        IR <= "0000111100100010";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00010010";
        wait for 10 ns;
        IR <= "0000111100110011";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00010011";
        wait for 10 ns;
        IR <= "0000111101000100";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00010100";
        wait for 10 ns;
        IR <= "0000111101010101";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00010101";
        wait for 10 ns;
        IR <= "0000111101100110";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00010110";
        wait for 10 ns;
        IR <= "0000111101110111";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00010111";
        wait for 10 ns;
        IR <= "0000111110001000";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00011000";
        wait for 10 ns;
        IR <= "0000111110011001";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00011001";
        wait for 10 ns;
        IR <= "0000111110101010";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00011010";
        wait for 10 ns;
        IR <= "0000111110111011";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00011011";
        wait for 10 ns;
        IR <= "0000111111001100";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00011100";
        wait for 10 ns;
        IR <= "0000111111011101";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00011101";
        wait for 10 ns;
        IR <= "0000111111101110";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00011110";
        wait for 10 ns;
        IR <= "0000111111111111";
        wait until (clock = '1');
        wait for 10 ns;
        RegIn <= "00011111";
        wait for 10 ns;


        -- Testing: CPC on inputs ra = 3 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0000011000111110";
        RegIn <= "10000100";
        wait until (clock = '1');
        assert(RegAOut = "00000011");
        assert(RegBOut = "00011110");


        -- Testing: ADC on inputs ra = 12 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0001111011000110";
        RegIn <= "10101110";
        wait until (clock = '1');
        assert(RegAOut = "00001100");
        assert(RegBOut = "00010110");


        -- Testing: ORI on inputs ra = 16 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0110000000000000";
        RegIn <= "11110001";
        wait until (clock = '1');
        assert(RegAOut = "00010000");


        -- Testing: SBC on inputs ra = 27 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0000100110111001";
        RegIn <= "11101011";
        wait until (clock = '1');
        assert(RegAOut = "00011011");
        assert(RegBOut = "00001001");


        -- Testing: BSET on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001001000";
        wait until (clock = '1');


        -- Testing: SUBI on inputs ra = 12 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0101000011000000";
        RegIn <= "10011001";
        wait until (clock = '1');
        assert(RegAOut = "00011100");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "00000110";
        wait until (clock = '1');
        assert(RegAOut = "00011000");
        IR <= "1001011000000000";
        RegIn <= "10110111";
        wait until (clock = '1');
        assert(RegAOut = "00011001");


        -- Testing: SBCI on inputs ra = 30 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0100000011100000";
        RegIn <= "00010010";
        wait until (clock = '1');
        assert(RegAOut = "00011110");


        -- Testing: CPI on inputs ra = 8 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0011000010000000";
        RegIn <= "10111011";
        wait until (clock = '1');
        assert(RegAOut = "00000110");


        -- Testing: CPC on inputs ra = 6 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0000011001101111";
        RegIn <= "00000011";
        wait until (clock = '1');
        assert(RegAOut = "00000110");
        assert(RegBOut = "00011111");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "00100101";
        wait until (clock = '1');
        assert(RegAOut = "00000110");
        IR <= "1001011000000000";
        RegIn <= "00011111";
        wait until (clock = '1');
        assert(RegAOut = "10110111");


        -- Testing: BLD on inputs ra = 20 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111100101000100";
        RegIn <= "10010110";
        wait until (clock = '1');
        assert(RegAOut = "10010110");


        -- Testing: INC on inputs ra = 5 and rb = 27 (only the ones that are used for the instruction).
        IR <= "1001010001010011";
        RegIn <= "00010011";
        wait until (clock = '1');
        assert(RegAOut = "00000101");


        -- Testing: SUB on inputs ra = 9 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0001100010011010";
        RegIn <= "00011100";
        wait until (clock = '1');
        assert(RegAOut = "00001001");
        assert(RegBOut = "00001010");


        -- Testing: NEG on inputs ra = 14 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001010011100001";
        RegIn <= "00100000";
        wait until (clock = '1');
        assert(RegAOut = "00001110");


        -- Testing: ANDI on inputs ra = 16 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0111000000000000";
        RegIn <= "01000000";
        wait until (clock = '1');
        assert(RegAOut = "11110001");


        -- Testing: SWAP on inputs ra = 22 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001010101100010";
        RegIn <= "00010010";
        wait until (clock = '1');
        assert(RegAOut = "00010110");


        -- Testing: ADD on inputs ra = 18 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0000111100100110";
        RegIn <= "10011110";
        wait until (clock = '1');
        assert(RegAOut = "00010010");
        assert(RegBOut = "00010010");


        -- Testing: CPI on inputs ra = 9 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0011000010010000";
        RegIn <= "10101101";
        wait until (clock = '1');
        assert(RegAOut = "00011111");


        -- Testing: BSET on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001001000";
        wait until (clock = '1');


        -- Testing: BSET on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000111000";
        wait until (clock = '1');


        -- Testing: ASR on inputs ra = 16 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001010100000101";
        RegIn <= "00110010";
        wait until (clock = '1');
        assert(RegAOut = "01000000");


        -- Testing: CPI on inputs ra = 1 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0011000000010000";
        RegIn <= "11110110";
        wait until (clock = '1');
        assert(RegAOut = "00010001");


        -- Testing: SBC on inputs ra = 17 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0000101100011101";
        RegIn <= "11100001";
        wait until (clock = '1');
        assert(RegAOut = "00010001");
        assert(RegBOut = "00011101");


        -- Testing: SUBI on inputs ra = 31 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0101000011110000";
        RegIn <= "10110000";
        wait until (clock = '1');
        assert(RegAOut = "00011111");


        -- Testing: CPC on inputs ra = 25 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0000010110010010";
        RegIn <= "10111001";
        wait until (clock = '1');
        assert(RegAOut = "00011111");
        assert(RegBOut = "00000010");


        -- Testing: SUBI on inputs ra = 29 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0101000011010000";
        RegIn <= "00101100";
        wait until (clock = '1');
        assert(RegAOut = "00011101");


        -- Testing: NEG on inputs ra = 30 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010111100001";
        RegIn <= "10011001";
        wait until (clock = '1');
        assert(RegAOut = "00010010");


        -- Testing: ADC on inputs ra = 9 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0001110010010000";
        RegIn <= "10110010";
        wait until (clock = '1');
        assert(RegAOut = "00011100");
        assert(RegBOut = "00000000");


        -- Testing: BSET on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000111000";
        wait until (clock = '1');


        -- Testing: ADD on inputs ra = 7 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0000111001110110";
        RegIn <= "10111111";
        wait until (clock = '1');
        assert(RegAOut = "00000111");
        assert(RegBOut = "00010010");


        -- Testing: LSR on inputs ra = 22 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001010101100110";
        RegIn <= "00101101";
        wait until (clock = '1');
        assert(RegAOut = "00010010");


        -- Testing: AND on inputs ra = 14 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0010000011100110";
        RegIn <= "10000011";
        wait until (clock = '1');
        assert(RegAOut = "00100000");
        assert(RegBOut = "00000110");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "11111111";
        wait until (clock = '1');
        assert(RegAOut = "00011010");
        IR <= "1001011000010000";
        RegIn <= "01101001";
        wait until (clock = '1');
        assert(RegAOut = "11101011");


        -- Testing: ADD on inputs ra = 1 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0000110000011101";
        RegIn <= "11010001";
        wait until (clock = '1');
        assert(RegAOut = "00000001");
        assert(RegBOut = "00001101");


        -- Testing: DEC on inputs ra = 29 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010111011010";
        RegIn <= "00010110";
        wait until (clock = '1');
        assert(RegAOut = "00101100");


        -- Testing: BCLR on inputs ra = 5 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011011000";
        wait until (clock = '1');


        -- Testing: SBC on inputs ra = 4 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0000100001001111";
        RegIn <= "01001010";
        wait until (clock = '1');
        assert(RegAOut = "00000100");
        assert(RegBOut = "00001111");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "00111001";
        wait until (clock = '1');
        assert(RegAOut = "00100101");
        IR <= "1001011000000000";
        RegIn <= "00101100";
        wait until (clock = '1');
        assert(RegAOut = "00011111");


        -- Testing: INC on inputs ra = 11 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001010010110011";
        RegIn <= "00010010";
        wait until (clock = '1');
        assert(RegAOut = "00001011");


        -- Testing: NEG on inputs ra = 19 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001010100110001";
        RegIn <= "10011110";
        wait until (clock = '1');
        assert(RegAOut = "00010011");


        -- Testing: ADC on inputs ra = 20 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0001111101000101";
        RegIn <= "11010100";
        wait until (clock = '1');
        assert(RegAOut = "10010110");
        assert(RegBOut = "00010101");


        -- Testing: SWAP on inputs ra = 20 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1001010101000010";
        RegIn <= "01011001";
        wait until (clock = '1');
        assert(RegAOut = "11010100");


        -- Testing: BLD on inputs ra = 21 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1111100101010010";
        RegIn <= "00100010";
        wait until (clock = '1');
        assert(RegAOut = "00100010");


        -- Testing: SUBI on inputs ra = 12 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0101000011000000";
        RegIn <= "11010011";
        wait until (clock = '1');
        assert(RegAOut = "10011001");


        -- Testing: INC on inputs ra = 13 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010011010011";
        RegIn <= "11010011";
        wait until (clock = '1');
        assert(RegAOut = "00001101");


        -- Testing: ADD on inputs ra = 21 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0000110101010110";
        RegIn <= "11011001";
        wait until (clock = '1');
        assert(RegAOut = "00100010");
        assert(RegBOut = "00000110");


        -- Testing: NEG on inputs ra = 10 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010010100001";
        RegIn <= "11000000";
        wait until (clock = '1');
        assert(RegAOut = "00001010");


        -- Testing: SUBI on inputs ra = 11 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0101000010110000";
        RegIn <= "10000001";
        wait until (clock = '1');
        assert(RegAOut = "01101001");


        -- Testing: MUL on inputs ra = 4 and rb = 14 (only the ones that are used for the instruction).
        IR <= "1001110001001110";
        RegIn <= "01011111";
        wait until (clock = '1');
        assert(RegAOut = "01001010");
        assert(RegBOut = "10000011");
        IR <= "1001110001001110";
        RegIn <= "01010000";
        wait until (clock = '1');
        assert(RegAOut = "01001010");
        assert(RegBOut = "10000011");


        -- Testing: LSR on inputs ra = 20 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010101000110";
        RegIn <= "10001101";
        wait until (clock = '1');
        assert(RegAOut = "01011001");


        -- Testing: NEG on inputs ra = 27 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010110110001";
        RegIn <= "00010101";
        wait until (clock = '1');
        assert(RegAOut = "10000001");


        -- Testing: LSR on inputs ra = 27 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010110110110";
        RegIn <= "10000010";
        wait until (clock = '1');
        assert(RegAOut = "00010101");


        -- Testing: OR on inputs ra = 24 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0010101110000000";
        RegIn <= "10010010";
        wait until (clock = '1');
        assert(RegAOut = "00111001");
        assert(RegBOut = "00110010");


        -- Testing: BCLR on inputs ra = 6 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011101000";
        wait until (clock = '1');


        -- Testing: SUBI on inputs ra = 5 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0101000001010000";
        RegIn <= "01101001";
        wait until (clock = '1');
        assert(RegAOut = "11011001");


        -- Testing: CPI on inputs ra = 24 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0011000010000000";
        RegIn <= "01101010";
        wait until (clock = '1');
        assert(RegAOut = "10010010");


        -- Testing: SBIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100100000";
        RegIn <= "11011001";
        wait until (clock = '1');
        assert(RegAOut = "11010011");
        IR <= "1001011100100000";
        RegIn <= "00010110";
        wait until (clock = '1');
        assert(RegAOut = "00010110");


        -- Testing: DEC on inputs ra = 7 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010001111010";
        RegIn <= "11010100";
        wait until (clock = '1');
        assert(RegAOut = "10111111");


        -- Testing: SUBI on inputs ra = 10 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0101000010100000";
        RegIn <= "11010000";
        wait until (clock = '1');
        assert(RegAOut = "11111111");


        -- Testing: INC on inputs ra = 8 and rb = 22 (only the ones that are used for the instruction).
        IR <= "1001010010000011";
        RegIn <= "11111010";
        wait until (clock = '1');
        assert(RegAOut = "00001000");


        -- Testing: DEC on inputs ra = 27 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010110111010";
        RegIn <= "10101101";
        wait until (clock = '1');
        assert(RegAOut = "10000010");


        -- Testing: INC on inputs ra = 4 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010001000011";
        RegIn <= "01111001";
        wait until (clock = '1');
        assert(RegAOut = "01001010");


        -- Testing: CP on inputs ra = 18 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0001011100101011";
        RegIn <= "00100101";
        wait until (clock = '1');
        assert(RegAOut = "10011110");
        assert(RegBOut = "10101101");


        -- Testing: EOR on inputs ra = 5 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0010011001011100";
        RegIn <= "11110100";
        wait until (clock = '1');
        assert(RegAOut = "00010011");
        assert(RegBOut = "11011001");


        -- Testing: ADC on inputs ra = 19 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0001111100111000";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "10011110");
        assert(RegBOut = "10010010");


        -- Testing: INC on inputs ra = 11 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010010110011";
        RegIn <= "11000101";
        wait until (clock = '1');
        assert(RegAOut = "00010010");


        -- Testing: DEC on inputs ra = 25 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001010110011010";
        RegIn <= "10010111";
        wait until (clock = '1');
        assert(RegAOut = "00101100");


        -- Testing: BST on inputs ra = 10 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1111101010101110";
        wait until (clock = '1');
        assert(RegAOut = "11000000");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "01101000";
        wait until (clock = '1');
        assert(RegAOut = "11010000");
        IR <= "1001011000010000";
        RegIn <= "11010100";
        wait until (clock = '1');
        assert(RegAOut = "10101101");


        -- Testing: ROR on inputs ra = 10 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001010010100111";
        RegIn <= "00100101";
        wait until (clock = '1');
        assert(RegAOut = "11000000");


        -- Testing: SBCI on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0100000000010000";
        RegIn <= "00010100";
        wait until (clock = '1');
        assert(RegAOut = "11100001");


        -- Testing: SBC on inputs ra = 27 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0000100110111010";
        RegIn <= "10100101";
        wait until (clock = '1');
        assert(RegAOut = "11010100");
        assert(RegBOut = "00100101");


        -- Testing: LSR on inputs ra = 8 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010010000110";
        RegIn <= "10001100";
        wait until (clock = '1');
        assert(RegAOut = "11111010");


        -- Testing: SUB on inputs ra = 9 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0001100010011011";
        RegIn <= "10000111";
        wait until (clock = '1');
        assert(RegAOut = "10110010");
        assert(RegBOut = "11000101");


        -- Testing: COM on inputs ra = 12 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001010011000000";
        RegIn <= "11110001";
        wait until (clock = '1');
        assert(RegAOut = "10101110");


        -- Testing: INC on inputs ra = 29 and rb = 26 (only the ones that are used for the instruction).
        IR <= "1001010111010011";
        RegIn <= "10010101";
        wait until (clock = '1');
        assert(RegAOut = "00010110");


        -- Testing: NEG on inputs ra = 27 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010110110001";
        RegIn <= "11000000";
        wait until (clock = '1');
        assert(RegAOut = "10100101");


        -- Testing: CP on inputs ra = 9 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0001010010011000";
        RegIn <= "10011010";
        wait until (clock = '1');
        assert(RegAOut = "10000111");
        assert(RegBOut = "10001100");


        -- Testing: DEC on inputs ra = 6 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1001010001101010";
        RegIn <= "10110101";
        wait until (clock = '1');
        assert(RegAOut = "00000110");


        -- Testing: SBIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100110000";
        RegIn <= "11011001";
        wait until (clock = '1');
        assert(RegAOut = "10011001");
        IR <= "1001011100110000";
        RegIn <= "00100011";
        wait until (clock = '1');
        assert(RegAOut = "10110000");


        -- Testing: COM on inputs ra = 21 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010101010000";
        RegIn <= "00111000";
        wait until (clock = '1');
        assert(RegAOut = "01101001");


        -- Testing: ASR on inputs ra = 17 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001010100010101";
        RegIn <= "01101100";
        wait until (clock = '1');
        assert(RegAOut = "00010100");


        -- Testing: LSR on inputs ra = 6 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001010001100110";
        RegIn <= "01001110";
        wait until (clock = '1');
        assert(RegAOut = "10110101");


        -- Testing: LSR on inputs ra = 16 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010100000110";
        RegIn <= "11111110";
        wait until (clock = '1');
        assert(RegAOut = "00110010");


        -- Testing: SBCI on inputs ra = 17 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0100000000010000";
        RegIn <= "11100010";
        wait until (clock = '1');
        assert(RegAOut = "01101100");


        -- Testing: BSET on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000111000";
        wait until (clock = '1');


        -- Testing: MUL on inputs ra = 7 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001110001110101";
        RegIn <= "00111000";
        wait until (clock = '1');
        assert(RegAOut = "11010100");
        assert(RegBOut = "11110100");
        IR <= "1001110001110101";
        RegIn <= "00101010";
        wait until (clock = '1');
        assert(RegAOut = "11010100");
        assert(RegBOut = "11110100");


        -- Testing: LSR on inputs ra = 9 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001010010010110";
        RegIn <= "10000010";
        wait until (clock = '1');
        assert(RegAOut = "10000111");


        -- Testing: NEG on inputs ra = 26 and rb = 22 (only the ones that are used for the instruction).
        IR <= "1001010110100001";
        RegIn <= "01111000";
        wait until (clock = '1');
        assert(RegAOut = "01101000");


        -- Testing: CP on inputs ra = 3 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0001011000110001";
        RegIn <= "00100110";
        wait until (clock = '1');
        assert(RegAOut = "00000011");
        assert(RegBOut = "11100010");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "00111110";
        wait until (clock = '1');
        assert(RegAOut = "01111000");
        IR <= "1001011100010000";
        RegIn <= "01100010";
        wait until (clock = '1');
        assert(RegAOut = "11000000");


        -- Testing: DEC on inputs ra = 22 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001010101101010";
        RegIn <= "00110100";
        wait until (clock = '1');
        assert(RegAOut = "00101101");


        -- Testing: ANDI on inputs ra = 25 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0111000010010000";
        RegIn <= "00111111";
        wait until (clock = '1');
        assert(RegAOut = "10010111");


        -- Testing: ROR on inputs ra = 30 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010111100111";
        RegIn <= "01101101";
        wait until (clock = '1');
        assert(RegAOut = "11011001");


        -- Testing: ROR on inputs ra = 3 and rb = 12 (only the ones that are used for the instruction).
        IR <= "1001010000110111";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "00000011");


        -- Testing: BLD on inputs ra = 30 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1111100111100101";
        RegIn <= "11001011";
        wait until (clock = '1');
        assert(RegAOut = "11001011");


        -- Testing: LSR on inputs ra = 3 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001010000110110";
        RegIn <= "01000001";
        wait until (clock = '1');
        assert(RegAOut = "00101000");


        -- Testing: BCLR on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011001000";
        wait until (clock = '1');


        -- Testing: CP on inputs ra = 5 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0001011001011011";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "11110100");
        assert(RegBOut = "01100010");


        -- Testing: MUL on inputs ra = 9 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001110010010101";
        RegIn <= "11100111";
        wait until (clock = '1');
        assert(RegAOut = "10000010");
        assert(RegBOut = "11110100");
        IR <= "1001110010010101";
        RegIn <= "00101100";
        wait until (clock = '1');
        assert(RegAOut = "10000010");
        assert(RegBOut = "11110100");


        -- Testing: SUB on inputs ra = 6 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0001101001100110";
        RegIn <= "00001000";
        wait until (clock = '1');
        assert(RegAOut = "01001110");
        assert(RegBOut = "00110100");


        -- Testing: CPC on inputs ra = 19 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0000010100111000";
        RegIn <= "10001101";
        wait until (clock = '1');
        assert(RegAOut = "00101000");
        assert(RegBOut = "10001100");


        -- Testing: ADIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000110000";
        RegIn <= "01110001";
        wait until (clock = '1');
        assert(RegAOut = "11001011");
        IR <= "1001011000110000";
        RegIn <= "11111111";
        wait until (clock = '1');
        assert(RegAOut = "00100011");


        -- Testing: BSET on inputs ra = 5 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001011000";
        wait until (clock = '1');


        -- Testing: ROR on inputs ra = 12 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001010011000111";
        RegIn <= "10000111";
        wait until (clock = '1');
        assert(RegAOut = "11110001");


        -- Testing: NEG on inputs ra = 19 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010100110001";
        RegIn <= "11010000";
        wait until (clock = '1');
        assert(RegAOut = "00101000");


        -- Testing: ADIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000110000";
        RegIn <= "11000010";
        wait until (clock = '1');
        assert(RegAOut = "01110001");
        IR <= "1001011000110000";
        RegIn <= "01000110";
        wait until (clock = '1');
        assert(RegAOut = "11111111");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "00110000";
        wait until (clock = '1');
        assert(RegAOut = "11011001");
        IR <= "1001011000100000";
        RegIn <= "01111111";
        wait until (clock = '1');
        assert(RegAOut = "10010101");


        -- Testing: COM on inputs ra = 16 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1001010100000000";
        RegIn <= "01010100";
        wait until (clock = '1');
        assert(RegAOut = "11111110");


        -- Testing: CPC on inputs ra = 18 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0000011100100101";
        RegIn <= "10101010";
        wait until (clock = '1');
        assert(RegAOut = "10011110");
        assert(RegBOut = "00111000");


        -- Testing: EOR on inputs ra = 8 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0010011010000011";
        RegIn <= "00001011";
        wait until (clock = '1');
        assert(RegAOut = "10001100");
        assert(RegBOut = "11010000");


        -- Testing: ROR on inputs ra = 28 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010111000111";
        RegIn <= "11001010";
        wait until (clock = '1');
        assert(RegAOut = "00110000");


        -- Testing: ASR on inputs ra = 29 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001010111010101";
        RegIn <= "10001001";
        wait until (clock = '1');
        assert(RegAOut = "01111111");


        -- Testing: AND on inputs ra = 1 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0010001000011011";
        RegIn <= "11111101";
        wait until (clock = '1');
        assert(RegAOut = "00101100");
        assert(RegBOut = "01100010");


        -- Testing: SWAP on inputs ra = 15 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010011110010";
        RegIn <= "11110110";
        wait until (clock = '1');
        assert(RegAOut = "00001111");


        -- Testing: SUBI on inputs ra = 27 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0101000010110000";
        RegIn <= "10011001";
        wait until (clock = '1');
        assert(RegAOut = "01100010");


        -- Testing: BSET on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000001000";
        wait until (clock = '1');


        -- Testing: SBCI on inputs ra = 26 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0100000010100000";
        RegIn <= "10100110";
        wait until (clock = '1');
        assert(RegAOut = "00111110");


        -- Testing: SUB on inputs ra = 19 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0001101100110011";
        RegIn <= "00001011";
        wait until (clock = '1');
        assert(RegAOut = "11010000");
        assert(RegBOut = "11010000");


        -- Testing: SUBI on inputs ra = 1 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0101000000010000";
        RegIn <= "01011110";
        wait until (clock = '1');
        assert(RegAOut = "11100010");


        -- Testing: MUL on inputs ra = 12 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1001110011000011";
        RegIn <= "01001100";
        wait until (clock = '1');
        assert(RegAOut = "10000111");
        assert(RegBOut = "01000001");
        IR <= "1001110011000011";
        RegIn <= "01110011";
        wait until (clock = '1');
        assert(RegAOut = "10000111");
        assert(RegBOut = "01000001");


        -- Testing: EOR on inputs ra = 5 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0010011001010100";
        RegIn <= "00110001";
        wait until (clock = '1');
        assert(RegAOut = "11110100");
        assert(RegBOut = "10001101");


        -- Testing: ORI on inputs ra = 10 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0110000010100000";
        RegIn <= "11001111";
        wait until (clock = '1');
        assert(RegAOut = "10100110");


        -- Testing: ROR on inputs ra = 16 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010100000111";
        RegIn <= "00100111";
        wait until (clock = '1');
        assert(RegAOut = "01010100");


        -- Testing: CPC on inputs ra = 24 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0000011110001101";
        RegIn <= "00010100";
        wait until (clock = '1');
        assert(RegAOut = "10010010");
        assert(RegBOut = "10001001");


        -- Testing: COM on inputs ra = 20 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001010101000000";
        RegIn <= "00100111";
        wait until (clock = '1');
        assert(RegAOut = "10001101");


        -- Testing: SBC on inputs ra = 2 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0000101000101100";
        RegIn <= "10011100";
        wait until (clock = '1');
        assert(RegAOut = "00000010");
        assert(RegBOut = "11001010");


        -- Testing: ADD on inputs ra = 24 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0000110110001101";
        RegIn <= "10001100";
        wait until (clock = '1');
        assert(RegAOut = "10010010");
        assert(RegBOut = "11010011");


        -- Testing: SBC on inputs ra = 0 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0000100000000011";
        RegIn <= "01100100";
        wait until (clock = '1');
        assert(RegAOut = "01001100");
        assert(RegBOut = "01000001");


        -- Testing: CP on inputs ra = 6 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0001010001100111";
        RegIn <= "10010101";
        wait until (clock = '1');
        assert(RegAOut = "00001000");
        assert(RegBOut = "11010100");


        -- Testing: SBCI on inputs ra = 16 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0100000000000000";
        RegIn <= "10001101";
        wait until (clock = '1');
        assert(RegAOut = "00100111");


        -- Testing: ADC on inputs ra = 13 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0001111011011001";
        RegIn <= "11100111";
        wait until (clock = '1');
        assert(RegAOut = "11010011");
        assert(RegBOut = "00111111");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "10110001";
        wait until (clock = '1');
        assert(RegAOut = "11001010");
        IR <= "1001011000100000";
        RegIn <= "10000000";
        wait until (clock = '1');
        assert(RegAOut = "10001001");


        -- Testing: EOR on inputs ra = 8 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0010010010000001";
        RegIn <= "11101001";
        wait until (clock = '1');
        assert(RegAOut = "00001011");
        assert(RegBOut = "01110011");


        -- Testing: ASR on inputs ra = 1 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010000010101";
        RegIn <= "11010101";
        wait until (clock = '1');
        assert(RegAOut = "01110011");


        -- Testing: ASR on inputs ra = 4 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001010001000101";
        RegIn <= "10011111";
        wait until (clock = '1');
        assert(RegAOut = "01111001");


        -- Testing: MUL on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001110000100000";
        RegIn <= "00100110";
        wait until (clock = '1');
        assert(RegAOut = "10011100");
        assert(RegBOut = "01100100");
        IR <= "1001110000100000";
        RegIn <= "11111110";
        wait until (clock = '1');
        assert(RegAOut = "10011100");
        assert(RegBOut = "00100110");


        -- Testing: BLD on inputs ra = 17 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111100100010100";
        RegIn <= "10010011";
        wait until (clock = '1');
        assert(RegAOut = "10010011");


        -- Testing: SUB on inputs ra = 19 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0001100100111111";
        RegIn <= "01110011";
        wait until (clock = '1');
        assert(RegAOut = "00001011");
        assert(RegBOut = "11110110");


        -- Testing: ANDI on inputs ra = 0 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0111000000000000";
        RegIn <= "10001010";
        wait until (clock = '1');
        assert(RegAOut = "10001101");


        -- Testing: NEG on inputs ra = 30 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010111100001";
        RegIn <= "01101111";
        wait until (clock = '1');
        assert(RegAOut = "11000010");


        -- Testing: ASR on inputs ra = 15 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010011110101";
        RegIn <= "10100001";
        wait until (clock = '1');
        assert(RegAOut = "11110110");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "01100101";
        wait until (clock = '1');
        assert(RegAOut = "10110001");
        IR <= "1001011000100000";
        RegIn <= "00100111";
        wait until (clock = '1');
        assert(RegAOut = "10000000");


        -- Testing: CPC on inputs ra = 22 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0000010101100111";
        RegIn <= "10101101";
        wait until (clock = '1');
        assert(RegAOut = "00110100");
        assert(RegBOut = "11010100");


        -- Testing: CPI on inputs ra = 30 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0011000011100000";
        RegIn <= "10100110";
        wait until (clock = '1');
        assert(RegAOut = "01101111");


        -- Testing: LSR on inputs ra = 9 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010010110";
        RegIn <= "01101001";
        wait until (clock = '1');
        assert(RegAOut = "10000010");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "01001101";
        wait until (clock = '1');
        assert(RegAOut = "10001100");
        IR <= "1001011000000000";
        RegIn <= "00000001";
        wait until (clock = '1');
        assert(RegAOut = "00111111");


        -- Testing: NEG on inputs ra = 23 and rb = 22 (only the ones that are used for the instruction).
        IR <= "1001010101110001";
        RegIn <= "11000110";
        wait until (clock = '1');
        assert(RegAOut = "00010111");


        -- Testing: AND on inputs ra = 29 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0010000111011000";
        RegIn <= "10100110";
        wait until (clock = '1');
        assert(RegAOut = "00100111");
        assert(RegBOut = "11101001");


        -- Testing: CPC on inputs ra = 11 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0000010010111000";
        RegIn <= "10000001";
        wait until (clock = '1');
        assert(RegAOut = "11000101");
        assert(RegBOut = "11101001");


        -- Testing: BCLR on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010001000";
        wait until (clock = '1');


        -- Testing: ADC on inputs ra = 2 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0001111000101001";
        RegIn <= "01010100";
        wait until (clock = '1');
        assert(RegAOut = "10011100");
        assert(RegBOut = "00000001");


        -- Testing: CP on inputs ra = 7 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0001011001110001";
        RegIn <= "00010111";
        wait until (clock = '1');
        assert(RegAOut = "11010100");
        assert(RegBOut = "10010011");


        -- Testing: ADD on inputs ra = 24 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0000110110001101";
        RegIn <= "10010010";
        wait until (clock = '1');
        assert(RegAOut = "01001101");
        assert(RegBOut = "11100111");


        -- Testing: BST on inputs ra = 29 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111101111011001";
        wait until (clock = '1');
        assert(RegAOut = "10100110");


        -- Testing: ADC on inputs ra = 27 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0001111110110100";
        RegIn <= "00011100";
        wait until (clock = '1');
        assert(RegAOut = "10011001");
        assert(RegBOut = "00100111");


        -- Testing: BCLR on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010001000";
        wait until (clock = '1');


        -- Testing: BLD on inputs ra = 16 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1111100100000111";
        RegIn <= "11110101";
        wait until (clock = '1');
        assert(RegAOut = "11110101");


        -- Testing: SBCI on inputs ra = 0 and rb = 12 (only the ones that are used for the instruction).
        IR <= "0100000000000000";
        RegIn <= "01101101";
        wait until (clock = '1');
        assert(RegAOut = "11110101");


        -- Testing: ANDI on inputs ra = 20 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0111000001000000";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "00100111");


        -- Testing: ADC on inputs ra = 5 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0001111001010001";
        RegIn <= "00001000";
        wait until (clock = '1');
        assert(RegAOut = "00110001");
        assert(RegBOut = "10010011");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "11110111";
        wait until (clock = '1');
        assert(RegAOut = "11001111");
        IR <= "1001011000010000";
        RegIn <= "11101011";
        wait until (clock = '1');
        assert(RegAOut = "00011100");


        -- Testing: BCLR on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010011000";
        wait until (clock = '1');


        -- Testing: MUL on inputs ra = 15 and rb = 14 (only the ones that are used for the instruction).
        IR <= "1001110011111110";
        RegIn <= "00111100";
        wait until (clock = '1');
        assert(RegAOut = "10100001");
        assert(RegBOut = "10000011");
        IR <= "1001110011111110";
        RegIn <= "01111011";
        wait until (clock = '1');
        assert(RegAOut = "10100001");
        assert(RegBOut = "10000011");


        -- Testing: SBCI on inputs ra = 27 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0100000010110000";
        RegIn <= "10001010";
        wait until (clock = '1');
        assert(RegAOut = "11101011");


        -- Testing: ADD on inputs ra = 15 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0000110011110111";
        RegIn <= "01011100";
        wait until (clock = '1');
        assert(RegAOut = "10100001");
        assert(RegBOut = "11010100");


        -- Testing: COM on inputs ra = 5 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1001010001010000";
        RegIn <= "01001010";
        wait until (clock = '1');
        assert(RegAOut = "00001000");


        -- Testing: DEC on inputs ra = 18 and rb = 27 (only the ones that are used for the instruction).
        IR <= "1001010100101010";
        RegIn <= "01100001";
        wait until (clock = '1');
        assert(RegAOut = "10011110");


        -- Testing: SWAP on inputs ra = 4 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1001010001000010";
        RegIn <= "11000011";
        wait until (clock = '1');
        assert(RegAOut = "10011111");


        -- Testing: ANDI on inputs ra = 7 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0111000001110000";
        RegIn <= "01001010";
        wait until (clock = '1');
        assert(RegAOut = "11000110");


        -- Testing: COM on inputs ra = 14 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010011100000";
        RegIn <= "01101111";
        wait until (clock = '1');
        assert(RegAOut = "10000011");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "11101111";
        wait until (clock = '1');
        assert(RegAOut = "01100101");
        IR <= "1001011000100000";
        RegIn <= "00010000";
        wait until (clock = '1');
        assert(RegAOut = "10100110");


        -- Testing: MUL on inputs ra = 27 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001110110111000";
        RegIn <= "10000001";
        wait until (clock = '1');
        assert(RegAOut = "10001010");
        assert(RegBOut = "11101001");
        IR <= "1001110110111000";
        RegIn <= "01000011";
        wait until (clock = '1');
        assert(RegAOut = "10001010");
        assert(RegBOut = "11101001");


        -- Testing: SUBI on inputs ra = 8 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0101000010000000";
        RegIn <= "11110110";
        wait until (clock = '1');
        assert(RegAOut = "10010010");


        -- Testing: ADC on inputs ra = 30 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0001110111100111";
        RegIn <= "10100001";
        wait until (clock = '1');
        assert(RegAOut = "01101111");
        assert(RegBOut = "11010100");


        -- Testing: DEC on inputs ra = 8 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010010001010";
        RegIn <= "01101100";
        wait until (clock = '1');
        assert(RegAOut = "11101001");


        -- Testing: INC on inputs ra = 4 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001010001000011";
        RegIn <= "11011110";
        wait until (clock = '1');
        assert(RegAOut = "11000011");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "00010000";
        wait until (clock = '1');
        assert(RegAOut = "11110110");
        IR <= "1001011000000000";
        RegIn <= "11111111";
        wait until (clock = '1');
        assert(RegAOut = "00000001");


        -- Testing: ASR on inputs ra = 3 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010000110101";
        RegIn <= "11001111";
        wait until (clock = '1');
        assert(RegAOut = "01000001");


        -- Testing: COM on inputs ra = 7 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010001110000";
        RegIn <= "01011001";
        wait until (clock = '1');
        assert(RegAOut = "11010100");


        -- Testing: BSET on inputs ra = 7 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001111000";
        wait until (clock = '1');


        -- Testing: ADD on inputs ra = 8 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0000111010001111";
        RegIn <= "01011101";
        wait until (clock = '1');
        assert(RegAOut = "01101100");
        assert(RegBOut = "01000110");


        -- Testing: ORI on inputs ra = 31 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0110000011110000";
        RegIn <= "01001001";
        wait until (clock = '1');
        assert(RegAOut = "01000110");


        -- Testing: ROR on inputs ra = 14 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011100111";
        RegIn <= "00111100";
        wait until (clock = '1');
        assert(RegAOut = "01101111");


        -- Testing: ROR on inputs ra = 30 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1001010111100111";
        RegIn <= "10011000";
        wait until (clock = '1');
        assert(RegAOut = "10100001");


        -- Testing: SBC on inputs ra = 18 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0000100100101101";
        RegIn <= "00101011";
        wait until (clock = '1');
        assert(RegAOut = "01100001");
        assert(RegBOut = "11100111");


        -- Testing: SWAP on inputs ra = 20 and rb = 12 (only the ones that are used for the instruction).
        IR <= "1001010101000010";
        RegIn <= "10111011";
        wait until (clock = '1');
        assert(RegAOut = "10001011");


        -- Testing: CPC on inputs ra = 15 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0000011011110011";
        RegIn <= "11100010";
        wait until (clock = '1');
        assert(RegAOut = "01011100");
        assert(RegBOut = "01110011");


        -- Testing: MUL on inputs ra = 30 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001111111101101";
        RegIn <= "00011101";
        wait until (clock = '1');
        assert(RegAOut = "10011000");
        assert(RegBOut = "00010000");
        IR <= "1001111111101101";
        RegIn <= "11011000";
        wait until (clock = '1');
        assert(RegAOut = "10011000");
        assert(RegBOut = "00010000");


        -- Testing: ADD on inputs ra = 19 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0000111100111111";
        RegIn <= "00000001";
        wait until (clock = '1');
        assert(RegAOut = "01110011");
        assert(RegBOut = "01001001");


        -- Testing: ADC on inputs ra = 16 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0001110100001011";
        RegIn <= "00010110";
        wait until (clock = '1');
        assert(RegAOut = "01101101");
        assert(RegBOut = "11000101");


        -- Testing: DEC on inputs ra = 3 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010000111010";
        RegIn <= "10000011";
        wait until (clock = '1');
        assert(RegAOut = "11001111");


        -- Testing: ADC on inputs ra = 21 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0001111101011000";
        RegIn <= "10011000";
        wait until (clock = '1');
        assert(RegAOut = "00111000");
        assert(RegBOut = "00010000");


        -- Testing: AND on inputs ra = 12 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0010000011001110";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "10000111");
        assert(RegBOut = "00111100");


        -- Testing: OR on inputs ra = 14 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0010101011101100";
        RegIn <= "10111100";
        wait until (clock = '1');
        assert(RegAOut = "00111100");
        assert(RegBOut = "11101111");


        -- Testing: INC on inputs ra = 10 and rb = 14 (only the ones that are used for the instruction).
        IR <= "1001010010100011";
        RegIn <= "00111101";
        wait until (clock = '1');
        assert(RegAOut = "00100101");


        -- Testing: CP on inputs ra = 20 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0001011101000001";
        RegIn <= "10010010";
        wait until (clock = '1');
        assert(RegAOut = "10111011");
        assert(RegBOut = "10010011");


        -- Testing: ADC on inputs ra = 15 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0001110011111101";
        RegIn <= "10110101";
        wait until (clock = '1');
        assert(RegAOut = "01011100");
        assert(RegBOut = "11100111");


        -- Testing: SWAP on inputs ra = 16 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010100000010";
        RegIn <= "01011110";
        wait until (clock = '1');
        assert(RegAOut = "00010110");


        -- Testing: OR on inputs ra = 0 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0010101000001100";
        RegIn <= "10000000";
        wait until (clock = '1');
        assert(RegAOut = "00011101");
        assert(RegBOut = "11101111");


        -- Testing: CP on inputs ra = 2 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0001010000101011";
        RegIn <= "00010111";
        wait until (clock = '1');
        assert(RegAOut = "01010100");
        assert(RegBOut = "11000101");


        -- Testing: ADC on inputs ra = 22 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0001111101100001";
        RegIn <= "00100001";
        wait until (clock = '1');
        assert(RegAOut = "00110100");
        assert(RegBOut = "10010011");


        -- Testing: COM on inputs ra = 29 and rb = 26 (only the ones that are used for the instruction).
        IR <= "1001010111010000";
        RegIn <= "11101010";
        wait until (clock = '1');
        assert(RegAOut = "00010000");


        -- Testing: SUB on inputs ra = 30 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0001100111100010";
        RegIn <= "10001101";
        wait until (clock = '1');
        assert(RegAOut = "10011000");
        assert(RegBOut = "01010100");


        -- Testing: ADC on inputs ra = 8 and rb = 12 (only the ones that are used for the instruction).
        IR <= "0001110010001100";
        RegIn <= "10111000";
        wait until (clock = '1');
        assert(RegAOut = "01011101");
        assert(RegBOut = "10001011");


        -- Testing: CPC on inputs ra = 25 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0000010110011110";
        RegIn <= "10101111";
        wait until (clock = '1');
        assert(RegAOut = "11111111");
        assert(RegBOut = "10111100");


        -- Testing: LSR on inputs ra = 31 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010111110110";
        RegIn <= "10010100";
        wait until (clock = '1');
        assert(RegAOut = "01001001");


        -- Testing: LSR on inputs ra = 29 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010111010110";
        RegIn <= "11100101";
        wait until (clock = '1');
        assert(RegAOut = "11101010");


        -- Testing: INC on inputs ra = 16 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001010100000011";
        RegIn <= "01000110";
        wait until (clock = '1');
        assert(RegAOut = "01011110");


        -- Testing: BST on inputs ra = 18 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111101100100001";
        wait until (clock = '1');
        assert(RegAOut = "00101011");


        -- Testing: CPI on inputs ra = 28 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0011000011000000";
        RegIn <= "00011101";
        wait until (clock = '1');
        assert(RegAOut = "11101111");


        -- Testing: SBIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100000000";
        RegIn <= "00000010";
        wait until (clock = '1');
        assert(RegAOut = "00010000");
        IR <= "1001011100000000";
        RegIn <= "01010101";
        wait until (clock = '1');
        assert(RegAOut = "11111111");


        -- Testing: ORI on inputs ra = 12 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0110000011000000";
        RegIn <= "00001011";
        wait until (clock = '1');
        assert(RegAOut = "11101111");


        -- Testing: AND on inputs ra = 9 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0010000010010110";
        RegIn <= "00100011";
        wait until (clock = '1');
        assert(RegAOut = "01101001");
        assert(RegBOut = "00001000");


        -- Testing: CPI on inputs ra = 27 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0011000010110000";
        RegIn <= "00110011";
        wait until (clock = '1');
        assert(RegAOut = "10001010");


        -- Testing: ORI on inputs ra = 21 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0110000001010000";
        RegIn <= "01101000";
        wait until (clock = '1');
        assert(RegAOut = "10011000");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "10110010";
        wait until (clock = '1');
        assert(RegAOut = "11110111");
        IR <= "1001011000010000";
        RegIn <= "00110010";
        wait until (clock = '1');
        assert(RegAOut = "10001010");


        -- Testing: CPI on inputs ra = 10 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0011000010100000";
        RegIn <= "01011010";
        wait until (clock = '1');
        assert(RegAOut = "10110010");


        -- Testing: BST on inputs ra = 9 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1111101010011101";
        wait until (clock = '1');
        assert(RegAOut = "00100011");


        -- Testing: COM on inputs ra = 9 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010010010000";
        RegIn <= "00111010";
        wait until (clock = '1');
        assert(RegAOut = "00100011");


        -- Testing: SUB on inputs ra = 19 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0001101100111000";
        RegIn <= "00001101";
        wait until (clock = '1');
        assert(RegAOut = "00000001");
        assert(RegBOut = "00000010");


        -- Testing: ANDI on inputs ra = 11 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0111000010110000";
        RegIn <= "10011010";
        wait until (clock = '1');
        assert(RegAOut = "00110010");


        -- Testing: SBC on inputs ra = 4 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0000100001001000";
        RegIn <= "10110010";
        wait until (clock = '1');
        assert(RegAOut = "11011110");
        assert(RegBOut = "10111000");


        -- Testing: CP on inputs ra = 21 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0001010101010110";
        RegIn <= "10100100";
        wait until (clock = '1');
        assert(RegAOut = "01101000");
        assert(RegBOut = "00001000");


        -- Testing: BSET on inputs ra = 7 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001111000";
        wait until (clock = '1');


        -- Testing: INC on inputs ra = 3 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001010000110011";
        RegIn <= "11010110";
        wait until (clock = '1');
        assert(RegAOut = "10000011");


        -- Testing: ADD on inputs ra = 1 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0000111000010100";
        RegIn <= "10101001";
        wait until (clock = '1');
        assert(RegAOut = "11011000");
        assert(RegBOut = "10111011");


        -- Testing: BLD on inputs ra = 4 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100001000001";
        RegIn <= "00011000";
        wait until (clock = '1');
        assert(RegAOut = "00011000");


        -- Testing: BLD on inputs ra = 14 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1111100011100011";
        RegIn <= "00011100";
        wait until (clock = '1');
        assert(RegAOut = "00011100");


        -- Testing: CPC on inputs ra = 10 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0000010010100000";
        RegIn <= "11001111";
        wait until (clock = '1');
        assert(RegAOut = "00111101");
        assert(RegBOut = "10000000");


        -- Testing: ADC on inputs ra = 22 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0001110101101111";
        RegIn <= "01000101";
        wait until (clock = '1');
        assert(RegAOut = "00100001");
        assert(RegBOut = "10110101");


        -- Testing: EOR on inputs ra = 9 and rb = 23 (only the ones that are used for the instruction).
        IR <= "0010011010010111";
        RegIn <= "10101000";
        wait until (clock = '1');
        assert(RegAOut = "00111010");
        assert(RegBOut = "01001010");


        -- Testing: AND on inputs ra = 12 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0010000011001101";
        RegIn <= "11101010";
        wait until (clock = '1');
        assert(RegAOut = "10001011");
        assert(RegBOut = "11100111");


        -- Testing: LSR on inputs ra = 13 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010011010110";
        RegIn <= "01001110";
        wait until (clock = '1');
        assert(RegAOut = "11100111");


        -- Testing: BLD on inputs ra = 4 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1111100001000011";
        RegIn <= "11111000";
        wait until (clock = '1');
        assert(RegAOut = "11111000");


        -- Testing: SWAP on inputs ra = 24 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010110000010";
        RegIn <= "11010101";
        wait until (clock = '1');
        assert(RegAOut = "00000010");


        -- Testing: COM on inputs ra = 0 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010000000000";
        RegIn <= "01001110";
        wait until (clock = '1');
        assert(RegAOut = "10000000");


        -- Testing: DEC on inputs ra = 31 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010111111010";
        RegIn <= "11111100";
        wait until (clock = '1');
        assert(RegAOut = "10010100");


        -- Testing: BCLR on inputs ra = 6 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011101000";
        wait until (clock = '1');


        -- Testing: MUL on inputs ra = 16 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001111100001101";
        RegIn <= "10111111";
        wait until (clock = '1');
        assert(RegAOut = "01000110");
        assert(RegBOut = "11100101");
        IR <= "1001111100001101";
        RegIn <= "11101110";
        wait until (clock = '1');
        assert(RegAOut = "01000110");
        assert(RegBOut = "11100101");


        -- Testing: AND on inputs ra = 4 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0010000001000101";
        RegIn <= "11101001";
        wait until (clock = '1');
        assert(RegAOut = "11111000");
        assert(RegBOut = "01001010");


        -- Testing: BLD on inputs ra = 7 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1111100001110110";
        RegIn <= "11101100";
        wait until (clock = '1');
        assert(RegAOut = "11101100");


        -- Testing: BST on inputs ra = 2 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1111101000101011";
        wait until (clock = '1');
        assert(RegAOut = "01010100");


        -- Testing: SUB on inputs ra = 16 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0001100100000110";
        RegIn <= "00110010";
        wait until (clock = '1');
        assert(RegAOut = "01000110");
        assert(RegBOut = "00001000");


        -- Testing: CPI on inputs ra = 20 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0011000001000000";
        RegIn <= "00000010";
        wait until (clock = '1');
        assert(RegAOut = "10111011");


        -- Testing: BLD on inputs ra = 12 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1111100011000110";
        RegIn <= "00000001";
        wait until (clock = '1');
        assert(RegAOut = "00000001");


        -- Testing: ASR on inputs ra = 24 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1001010110000101";
        RegIn <= "10010000";
        wait until (clock = '1');
        assert(RegAOut = "11010101");


        -- Testing: SUBI on inputs ra = 2 and rb = 23 (only the ones that are used for the instruction).
        IR <= "0101000000100000";
        RegIn <= "00010110";
        wait until (clock = '1');
        assert(RegAOut = "00101011");


        -- Testing: DEC on inputs ra = 8 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010010001010";
        RegIn <= "00011100";
        wait until (clock = '1');
        assert(RegAOut = "10111000");


        -- Testing: COM on inputs ra = 23 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001010101110000";
        RegIn <= "00110111";
        wait until (clock = '1');
        assert(RegAOut = "01001010");


        -- Testing: OR on inputs ra = 18 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0010101100101011";
        RegIn <= "11110010";
        wait until (clock = '1');
        assert(RegAOut = "00010110");
        assert(RegBOut = "10011010");


        -- Testing: BSET on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000011000";
        wait until (clock = '1');


        -- Testing: BLD on inputs ra = 22 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1111100101100000";
        RegIn <= "11101101";
        wait until (clock = '1');
        assert(RegAOut = "11101101");


        -- Testing: COM on inputs ra = 23 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001010101110000";
        RegIn <= "11001010";
        wait until (clock = '1');
        assert(RegAOut = "00110111");


        -- Testing: BST on inputs ra = 2 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111101000100100";
        wait until (clock = '1');
        assert(RegAOut = "01010100");


        -- Testing: SWAP on inputs ra = 31 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010111110010";
        RegIn <= "11100000";
        wait until (clock = '1');
        assert(RegAOut = "11111100");


        -- Testing: OR on inputs ra = 28 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0010101111001011";
        RegIn <= "11011111";
        wait until (clock = '1');
        assert(RegAOut = "00001011");
        assert(RegBOut = "10011010");


        -- Testing: ANDI on inputs ra = 31 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0111000011110000";
        RegIn <= "11011101";
        wait until (clock = '1');
        assert(RegAOut = "11100000");


        -- Testing: CP on inputs ra = 25 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0001010110010100";
        RegIn <= "00011011";
        wait until (clock = '1');
        assert(RegAOut = "01010101");
        assert(RegBOut = "11101001");


        -- Testing: OR on inputs ra = 6 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0010100001100001";
        RegIn <= "00011101";
        wait until (clock = '1');
        assert(RegAOut = "00001000");
        assert(RegBOut = "11101110");


        -- Testing: OR on inputs ra = 5 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0010100001011000";
        RegIn <= "10111100";
        wait until (clock = '1');
        assert(RegAOut = "01001010");
        assert(RegBOut = "00011100");


        -- Testing: BST on inputs ra = 11 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1111101010111111";
        wait until (clock = '1');
        assert(RegAOut = "11000101");


        -- Testing: BST on inputs ra = 25 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1111101110010110";
        wait until (clock = '1');
        assert(RegAOut = "01010101");


        -- Testing: DEC on inputs ra = 2 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1001010000101010";
        RegIn <= "01110001";
        wait until (clock = '1');
        assert(RegAOut = "01010100");


        -- Testing: SBIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100110000";
        RegIn <= "00000001";
        wait until (clock = '1');
        assert(RegAOut = "10001101");
        IR <= "1001011100110000";
        RegIn <= "11011011";
        wait until (clock = '1');
        assert(RegAOut = "11011101");


        -- Testing: CPI on inputs ra = 16 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0011000000000000";
        RegIn <= "00011010";
        wait until (clock = '1');
        assert(RegAOut = "00110010");


        -- Testing: BCLR on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010101000";
        wait until (clock = '1');


        -- Testing: BST on inputs ra = 28 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1111101111000101";
        wait until (clock = '1');
        assert(RegAOut = "11011111");


        -- Testing: SBC on inputs ra = 30 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0000101111101101";
        RegIn <= "10001101";
        wait until (clock = '1');
        assert(RegAOut = "00000001");
        assert(RegBOut = "11100101");


        -- Testing: BCLR on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010011000";
        wait until (clock = '1');


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "00000100";
        wait until (clock = '1');
        assert(RegAOut = "11011111");
        IR <= "1001011000100000";
        RegIn <= "01100111";
        wait until (clock = '1');
        assert(RegAOut = "11100101");


        -- Testing: SUB on inputs ra = 31 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0001100111111001";
        RegIn <= "00011001";
        wait until (clock = '1');
        assert(RegAOut = "11011011");
        assert(RegBOut = "10101000");


        -- Testing: SWAP on inputs ra = 17 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001010100010010";
        RegIn <= "11111000";
        wait until (clock = '1');
        assert(RegAOut = "10010011");


        -- Testing: SBC on inputs ra = 8 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0000100010001000";
        RegIn <= "01010001";
        wait until (clock = '1');
        assert(RegAOut = "00011100");
        assert(RegBOut = "00011100");


        -- Testing: BST on inputs ra = 0 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111101000000100";
        wait until (clock = '1');
        assert(RegAOut = "10111111");


        -- Testing: INC on inputs ra = 18 and rb = 12 (only the ones that are used for the instruction).
        IR <= "1001010100100011";
        RegIn <= "10010100";
        wait until (clock = '1');
        assert(RegAOut = "11110010");


        -- Testing: DEC on inputs ra = 16 and rb = 22 (only the ones that are used for the instruction).
        IR <= "1001010100001010";
        RegIn <= "10000011";
        wait until (clock = '1');
        assert(RegAOut = "00110010");


        -- Testing: EOR on inputs ra = 3 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0010011000110101";
        RegIn <= "01000001";
        wait until (clock = '1');
        assert(RegAOut = "11010110");
        assert(RegBOut = "01101000");


        -- Testing: BST on inputs ra = 29 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111101111010001";
        wait until (clock = '1');
        assert(RegAOut = "01100111");


        -- Testing: DEC on inputs ra = 15 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010011111010";
        RegIn <= "00111000";
        wait until (clock = '1');
        assert(RegAOut = "10110101");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "01011100";
        wait until (clock = '1');
        assert(RegAOut = "10110010");
        IR <= "1001011000010000";
        RegIn <= "11101111";
        wait until (clock = '1');
        assert(RegAOut = "10011010");


        -- Testing: AND on inputs ra = 5 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0010000001011001";
        RegIn <= "11000100";
        wait until (clock = '1');
        assert(RegAOut = "10111100");
        assert(RegBOut = "10101000");


        -- Testing: LSR on inputs ra = 30 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001010111100110";
        RegIn <= "10011100";
        wait until (clock = '1');
        assert(RegAOut = "10001101");


        -- Testing: SBIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100100000";
        RegIn <= "01001011";
        wait until (clock = '1');
        assert(RegAOut = "00000100");
        IR <= "1001011100100000";
        RegIn <= "10111110";
        wait until (clock = '1');
        assert(RegAOut = "01100111");


        -- Testing: ANDI on inputs ra = 22 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0111000001100000";
        RegIn <= "10000111";
        wait until (clock = '1');
        assert(RegAOut = "11101101");


        -- Testing: ROR on inputs ra = 10 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001010010100111";
        RegIn <= "00110110";
        wait until (clock = '1');
        assert(RegAOut = "00111101");


        -- Testing: BST on inputs ra = 12 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111101011001100";
        wait until (clock = '1');
        assert(RegAOut = "00000001");


        -- Testing: ROR on inputs ra = 11 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001010010110111";
        RegIn <= "00111101";
        wait until (clock = '1');
        assert(RegAOut = "11000101");


        -- Testing: SUBI on inputs ra = 19 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0101000000110000";
        RegIn <= "00001110";
        wait until (clock = '1');
        assert(RegAOut = "00001101");


        -- Testing: INC on inputs ra = 18 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010100100011";
        RegIn <= "11110100";
        wait until (clock = '1');
        assert(RegAOut = "10010100");


        -- Testing: DEC on inputs ra = 15 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001010011111010";
        RegIn <= "00011000";
        wait until (clock = '1');
        assert(RegAOut = "00111000");


        -- Testing: MUL on inputs ra = 15 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001111011111000";
        RegIn <= "00111111";
        wait until (clock = '1');
        assert(RegAOut = "00011000");
        assert(RegBOut = "10010000");
        IR <= "1001111011111000";
        RegIn <= "01110100";
        wait until (clock = '1');
        assert(RegAOut = "00011000");
        assert(RegBOut = "10010000");


        -- Testing: SUB on inputs ra = 15 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0001100011110010";
        RegIn <= "01010100";
        wait until (clock = '1');
        assert(RegAOut = "00011000");
        assert(RegBOut = "01110001");


        -- Testing: ROR on inputs ra = 31 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001010111110111";
        RegIn <= "00111001";
        wait until (clock = '1');
        assert(RegAOut = "00011001");


        -- Testing: COM on inputs ra = 6 and rb = 12 (only the ones that are used for the instruction).
        IR <= "1001010001100000";
        RegIn <= "01100111";
        wait until (clock = '1');
        assert(RegAOut = "00011101");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "11111110";
        wait until (clock = '1');
        assert(RegAOut = "10010000");
        IR <= "1001011000000000";
        RegIn <= "01110111";
        wait until (clock = '1');
        assert(RegAOut = "01010101");


        -- Testing: ANDI on inputs ra = 11 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0111000010110000";
        RegIn <= "10010011";
        wait until (clock = '1');
        assert(RegAOut = "11101111");


        -- Testing: SUBI on inputs ra = 7 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0101000001110000";
        RegIn <= "10110011";
        wait until (clock = '1');
        assert(RegAOut = "11001010");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "10000111";
        wait until (clock = '1');
        assert(RegAOut = "11111110");
        IR <= "1001011000000000";
        RegIn <= "10110110";
        wait until (clock = '1');
        assert(RegAOut = "01110111");


        -- Testing: MUL on inputs ra = 2 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001111000101101";
        RegIn <= "11100100";
        wait until (clock = '1');
        assert(RegAOut = "01110001");
        assert(RegBOut = "10111110");
        IR <= "1001111000101101";
        RegIn <= "01010110";
        wait until (clock = '1');
        assert(RegAOut = "01110001");
        assert(RegBOut = "10111110");


        -- Testing: EOR on inputs ra = 1 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0010011000011011";
        RegIn <= "01101110";
        wait until (clock = '1');
        assert(RegAOut = "01010110");
        assert(RegBOut = "10010011");


        -- Testing: LSR on inputs ra = 12 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010011000110";
        RegIn <= "11100111";
        wait until (clock = '1');
        assert(RegAOut = "00000001");


        -- Testing: BCLR on inputs ra = 7 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011111000";
        wait until (clock = '1');


        -- Testing: OR on inputs ra = 31 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0010100111111001";
        RegIn <= "11001100";
        wait until (clock = '1');
        assert(RegAOut = "00111001");
        assert(RegBOut = "10101000");


        -- Testing: SUBI on inputs ra = 19 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0101000000110000";
        RegIn <= "10101001";
        wait until (clock = '1');
        assert(RegAOut = "00001110");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "01001011";
        wait until (clock = '1');
        assert(RegAOut = "01011100");
        IR <= "1001011100010000";
        RegIn <= "01000001";
        wait until (clock = '1');
        assert(RegAOut = "10010011");


        -- Testing: SUB on inputs ra = 18 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0001100100101000";
        RegIn <= "00111111";
        wait until (clock = '1');
        assert(RegAOut = "11110100");
        assert(RegBOut = "01010001");


        -- Testing: EOR on inputs ra = 21 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0010011101011000";
        RegIn <= "10101110";
        wait until (clock = '1');
        assert(RegAOut = "01101000");
        assert(RegBOut = "10000111");


        -- Testing: BCLR on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010111000";
        wait until (clock = '1');


        -- Testing: SBC on inputs ra = 17 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0000100100011010";
        RegIn <= "10000000";
        wait until (clock = '1');
        assert(RegAOut = "11111000");
        assert(RegBOut = "00110110");


        -- Testing: ASR on inputs ra = 14 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010011100101";
        RegIn <= "00011010";
        wait until (clock = '1');
        assert(RegAOut = "00011100");


        -- Testing: EOR on inputs ra = 21 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0010010101011010";
        RegIn <= "10111110";
        wait until (clock = '1');
        assert(RegAOut = "10101110");
        assert(RegBOut = "00110110");


        -- Testing: BST on inputs ra = 5 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1111101001011111";
        wait until (clock = '1');
        assert(RegAOut = "11000100");


        -- Testing: NEG on inputs ra = 19 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010100110001";
        RegIn <= "11001001";
        wait until (clock = '1');
        assert(RegAOut = "10101001");


        -- Testing: BLD on inputs ra = 10 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1111100010100110";
        RegIn <= "00110010";
        wait until (clock = '1');
        assert(RegAOut = "00110010");


        -- Testing: BST on inputs ra = 15 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1111101011111000";
        wait until (clock = '1');
        assert(RegAOut = "01010100");


        -- Testing: SBIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100110000";
        RegIn <= "00100110";
        wait until (clock = '1');
        assert(RegAOut = "10011100");
        IR <= "1001011100110000";
        RegIn <= "10110110";
        wait until (clock = '1');
        assert(RegAOut = "11001100");


        -- Testing: SUB on inputs ra = 24 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0001101110001000";
        RegIn <= "00000010";
        wait until (clock = '1');
        assert(RegAOut = "10000111");
        assert(RegBOut = "10000111");


        -- Testing: CPC on inputs ra = 14 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0000010011101111";
        RegIn <= "00010011";
        wait until (clock = '1');
        assert(RegAOut = "00011010");
        assert(RegBOut = "01010100");


        -- Testing: CPC on inputs ra = 26 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0000011110101001";
        RegIn <= "00101001";
        wait until (clock = '1');
        assert(RegAOut = "01001011");
        assert(RegBOut = "10110110");


        -- Testing: DEC on inputs ra = 6 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1001010001101010";
        RegIn <= "00101010";
        wait until (clock = '1');
        assert(RegAOut = "01100111");


        -- Testing: ROR on inputs ra = 15 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001010011110111";
        RegIn <= "01000111";
        wait until (clock = '1');
        assert(RegAOut = "01010100");


        -- Testing: BLD on inputs ra = 1 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1111100000010101";
        RegIn <= "01001011";
        wait until (clock = '1');
        assert(RegAOut = "01001011");


        -- Testing: LSR on inputs ra = 10 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001010010100110";
        RegIn <= "10101000";
        wait until (clock = '1');
        assert(RegAOut = "00110010");


        -- Testing: NEG on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000000001";
        RegIn <= "00110100";
        wait until (clock = '1');
        assert(RegAOut = "11100100");


        -- Testing: ORI on inputs ra = 0 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0110000000000000";
        RegIn <= "11000111";
        wait until (clock = '1');
        assert(RegAOut = "10000011");


        -- Testing: AND on inputs ra = 15 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0010001011111101";
        RegIn <= "10000100";
        wait until (clock = '1');
        assert(RegAOut = "01000111");
        assert(RegBOut = "10111110");


        -- Testing: SBCI on inputs ra = 0 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0100000000000000";
        RegIn <= "01101001";
        wait until (clock = '1');
        assert(RegAOut = "11000111");


        -- Testing: CP on inputs ra = 2 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0001011000100000";
        RegIn <= "00100100";
        wait until (clock = '1');
        assert(RegAOut = "01110001");
        assert(RegBOut = "01101001");


        -- Testing: MUL on inputs ra = 24 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001111110001111";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "00000010");
        assert(RegBOut = "10110110");
        IR <= "1001111110001111";
        RegIn <= "11000000";
        wait until (clock = '1');
        assert(RegAOut = "00000010");
        assert(RegBOut = "10110110");


        -- Testing: LSR on inputs ra = 11 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010010110110";
        RegIn <= "11111111";
        wait until (clock = '1');
        assert(RegAOut = "00111101");


        -- Testing: INC on inputs ra = 29 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1001010111010011";
        RegIn <= "01100100";
        wait until (clock = '1');
        assert(RegAOut = "10111110");


        -- Testing: SBCI on inputs ra = 19 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0100000000110000";
        RegIn <= "10011010";
        wait until (clock = '1');
        assert(RegAOut = "11001001");


        -- Testing: COM on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000110000";
        RegIn <= "10001110";
        wait until (clock = '1');
        assert(RegAOut = "01000001");


        -- Testing: DEC on inputs ra = 1 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001010000011010";
        RegIn <= "01110100";
        wait until (clock = '1');
        assert(RegAOut = "11000000");


        -- Testing: INC on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000110011";
        RegIn <= "00001100";
        wait until (clock = '1');
        assert(RegAOut = "10001110");


        -- Testing: ADIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000110000";
        RegIn <= "10100010";
        wait until (clock = '1');
        assert(RegAOut = "00100110");
        IR <= "1001011000110000";
        RegIn <= "01000100";
        wait until (clock = '1');
        assert(RegAOut = "10110110");


        -- Testing: INC on inputs ra = 28 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010111000011";
        RegIn <= "00011000";
        wait until (clock = '1');
        assert(RegAOut = "01001011");


        -- Testing: ADC on inputs ra = 16 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0001110100001001";
        RegIn <= "11100001";
        wait until (clock = '1');
        assert(RegAOut = "01101001");
        assert(RegBOut = "10101000");


        -- Testing: SUBI on inputs ra = 20 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0101000001000000";
        RegIn <= "01110111";
        wait until (clock = '1');
        assert(RegAOut = "10111011");


        -- Testing: SBC on inputs ra = 26 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0000100110101101";
        RegIn <= "01001010";
        wait until (clock = '1');
        assert(RegAOut = "01001011");
        assert(RegBOut = "01001110");


        -- Testing: BST on inputs ra = 27 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111101110111001";
        wait until (clock = '1');
        assert(RegAOut = "01000001");


        -- Testing: SBIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100000000";
        RegIn <= "01001110";
        wait until (clock = '1');
        assert(RegAOut = "00000010");
        IR <= "1001011100000000";
        RegIn <= "10110110";
        wait until (clock = '1');
        assert(RegAOut = "10110110");


        -- Testing: BCLR on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010011000";
        wait until (clock = '1');


        -- Testing: DEC on inputs ra = 25 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010110011010";
        RegIn <= "01110000";
        wait until (clock = '1');
        assert(RegAOut = "10110110");


        -- Testing: SUBI on inputs ra = 0 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0101000000000000";
        RegIn <= "11100000";
        wait until (clock = '1');
        assert(RegAOut = "11100001");


        -- Testing: COM on inputs ra = 7 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010001110000";
        RegIn <= "01011111";
        wait until (clock = '1');
        assert(RegAOut = "11101100");


        -- Testing: EOR on inputs ra = 10 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0010011010101010";
        RegIn <= "01000011";
        wait until (clock = '1');
        assert(RegAOut = "10101000");
        assert(RegBOut = "01001010");


        -- Testing: SBCI on inputs ra = 25 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0100000010010000";
        RegIn <= "01011010";
        wait until (clock = '1');
        assert(RegAOut = "01110000");


        -- Testing: LSR on inputs ra = 11 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001010010110110";
        RegIn <= "11011100";
        wait until (clock = '1');
        assert(RegAOut = "11111111");


        -- Testing: NEG on inputs ra = 21 and rb = 26 (only the ones that are used for the instruction).
        IR <= "1001010101010001";
        RegIn <= "10011101";
        wait until (clock = '1');
        assert(RegAOut = "10111110");


        -- Testing: OR on inputs ra = 28 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0010100111000100";
        RegIn <= "10000111";
        wait until (clock = '1');
        assert(RegAOut = "00011000");
        assert(RegBOut = "11101001");


        -- Testing: ADC on inputs ra = 7 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0001110001111000";
        RegIn <= "01001000";
        wait until (clock = '1');
        assert(RegAOut = "01011111");
        assert(RegBOut = "01010001");


        -- Testing: ASR on inputs ra = 24 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010110000101";
        RegIn <= "01001000";
        wait until (clock = '1');
        assert(RegAOut = "01001110");


        -- Testing: NEG on inputs ra = 29 and rb = 14 (only the ones that are used for the instruction).
        IR <= "1001010111010001";
        RegIn <= "11011110";
        wait until (clock = '1');
        assert(RegAOut = "01100100");


        -- Testing: BST on inputs ra = 2 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1111101000100011";
        wait until (clock = '1');
        assert(RegAOut = "01110001");


        -- Testing: CPC on inputs ra = 21 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0000010101010111";
        RegIn <= "10000000";
        wait until (clock = '1');
        assert(RegAOut = "10011101");
        assert(RegBOut = "01001000");


        -- Testing: SUBI on inputs ra = 30 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0101000011100000";
        RegIn <= "00001011";
        wait until (clock = '1');
        assert(RegAOut = "10100010");


        -- Testing: ADIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000110000";
        RegIn <= "10110001";
        wait until (clock = '1');
        assert(RegAOut = "00001011");
        IR <= "1001011000110000";
        RegIn <= "00010001";
        wait until (clock = '1');
        assert(RegAOut = "01000100");


        -- Testing: BSET on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000011000";
        wait until (clock = '1');


        -- Testing: NEG on inputs ra = 8 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010010000001";
        RegIn <= "00010101";
        wait until (clock = '1');
        assert(RegAOut = "01010001");


        -- Testing: BLD on inputs ra = 28 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100111000001";
        RegIn <= "01011010";
        wait until (clock = '1');
        assert(RegAOut = "01011010");


        -- Testing: MUL on inputs ra = 31 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001111111110111";
        RegIn <= "01010101";
        wait until (clock = '1');
        assert(RegAOut = "00010001");
        assert(RegBOut = "10110011");
        IR <= "1001111111110111";
        RegIn <= "11011010";
        wait until (clock = '1');
        assert(RegAOut = "00010001");
        assert(RegBOut = "10110011");


        -- Testing: OR on inputs ra = 19 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0010100100111010";
        RegIn <= "01100000";
        wait until (clock = '1');
        assert(RegAOut = "10011010");
        assert(RegBOut = "01000011");


        -- Testing: AND on inputs ra = 25 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0010001110010101";
        RegIn <= "00100101";
        wait until (clock = '1');
        assert(RegAOut = "01011010");
        assert(RegBOut = "10011101");


        -- Testing: LSR on inputs ra = 18 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001010100100110";
        RegIn <= "01101101";
        wait until (clock = '1');
        assert(RegAOut = "00111111");


        -- Testing: ADIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000110000";
        RegIn <= "01010111";
        wait until (clock = '1');
        assert(RegAOut = "10110001");
        IR <= "1001011000110000";
        RegIn <= "01000101";
        wait until (clock = '1');
        assert(RegAOut = "00010001");


        -- Testing: AND on inputs ra = 0 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0010000000000100";
        RegIn <= "11101100";
        wait until (clock = '1');
        assert(RegAOut = "01010101");
        assert(RegBOut = "11101001");


        -- Testing: SBIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100100000";
        RegIn <= "00111011";
        wait until (clock = '1');
        assert(RegAOut = "01011010");
        IR <= "1001011100100000";
        RegIn <= "10001111";
        wait until (clock = '1');
        assert(RegAOut = "11011110");


        -- Testing: CPI on inputs ra = 4 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0011000001000000";
        RegIn <= "11111001";
        wait until (clock = '1');
        assert(RegAOut = "01110111");


        -- Testing: BSET on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000101000";
        wait until (clock = '1');


        -- Testing: SBCI on inputs ra = 14 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0100000011100000";
        RegIn <= "00000011";
        wait until (clock = '1');
        assert(RegAOut = "01010111");


        -- Testing: MUL on inputs ra = 13 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001110011011010";
        RegIn <= "00010111";
        wait until (clock = '1');
        assert(RegAOut = "01001110");
        assert(RegBOut = "01000011");
        IR <= "1001110011011010";
        RegIn <= "10110001";
        wait until (clock = '1');
        assert(RegAOut = "01001110");
        assert(RegBOut = "01000011");


        -- Testing: CPI on inputs ra = 5 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0011000001010000";
        RegIn <= "00101001";
        wait until (clock = '1');
        assert(RegAOut = "10011101");


        -- Testing: ADC on inputs ra = 2 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0001111000101111";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "01110001");
        assert(RegBOut = "01000101");


        -- Testing: ROR on inputs ra = 15 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010011110111";
        RegIn <= "00010010";
        wait until (clock = '1');
        assert(RegAOut = "10000100");


        -- Testing: SUB on inputs ra = 9 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0001101010011111";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "10101000");
        assert(RegBOut = "01000101");


        -- Testing: BCLR on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010101000";
        wait until (clock = '1');


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "00000100";
        wait until (clock = '1');
        assert(RegAOut = "00111011");
        IR <= "1001011000100000";
        RegIn <= "10011111";
        wait until (clock = '1');
        assert(RegAOut = "10001111");


        -- Testing: ADC on inputs ra = 22 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0001111101100010";
        RegIn <= "00100110";
        wait until (clock = '1');
        assert(RegAOut = "10000111");
        assert(RegBOut = "01101101");


        -- Testing: ANDI on inputs ra = 12 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0111000011000000";
        RegIn <= "11111100";
        wait until (clock = '1');
        assert(RegAOut = "00000100");


        -- Testing: ORI on inputs ra = 1 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0110000000010000";
        RegIn <= "11010111";
        wait until (clock = '1');
        assert(RegAOut = "10000000");


        -- Testing: EOR on inputs ra = 31 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0010011111111010";
        RegIn <= "10100111";
        wait until (clock = '1');
        assert(RegAOut = "01000101");
        assert(RegBOut = "01001010");


        -- Testing: INC on inputs ra = 26 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010110100011";
        RegIn <= "11001101";
        wait until (clock = '1');
        assert(RegAOut = "01001010");


        -- Testing: CPC on inputs ra = 9 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0000010010010101";
        RegIn <= "10000111";
        wait until (clock = '1');
        assert(RegAOut = "10001011");
        assert(RegBOut = "11000100");


        -- Testing: SUB on inputs ra = 20 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0001100101001110";
        RegIn <= "10101111";
        wait until (clock = '1');
        assert(RegAOut = "01110111");
        assert(RegBOut = "00011010");


        -- Testing: BSET on inputs ra = 6 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001101000";
        wait until (clock = '1');


        -- Testing: COM on inputs ra = 5 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010001010000";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "11000100");


        -- Testing: NEG on inputs ra = 24 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001010110000001";
        RegIn <= "10110000";
        wait until (clock = '1');
        assert(RegAOut = "01001000");


        -- Testing: OR on inputs ra = 8 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0010101010000110";
        RegIn <= "01001110";
        wait until (clock = '1');
        assert(RegAOut = "00010101");
        assert(RegBOut = "00100110");


        -- Testing: CPC on inputs ra = 17 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0000010100010001";
        RegIn <= "01110111";
        wait until (clock = '1');
        assert(RegAOut = "11010111");
        assert(RegBOut = "10110001");


        -- Testing: ANDI on inputs ra = 27 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0111000010110000";
        RegIn <= "01001101";
        wait until (clock = '1');
        assert(RegAOut = "01000001");


        -- Testing: BST on inputs ra = 13 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1111101011010010";
        wait until (clock = '1');
        assert(RegAOut = "01001110");


        -- Testing: ROR on inputs ra = 29 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001010111010111";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "10011111");


        -- Testing: DEC on inputs ra = 19 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001010100111010";
        RegIn <= "00000100";
        wait until (clock = '1');
        assert(RegAOut = "01100000");


        -- Testing: BCLR on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011001000";
        wait until (clock = '1');


        -- Testing: ADIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000110000";
        RegIn <= "01100101";
        wait until (clock = '1');
        assert(RegAOut = "00000011");
        IR <= "1001011000110000";
        RegIn <= "01110100";
        wait until (clock = '1');
        assert(RegAOut = "10100111");


        -- Testing: LSR on inputs ra = 21 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010101010110";
        RegIn <= "01111101";
        wait until (clock = '1');
        assert(RegAOut = "10011101");


        -- Testing: AND on inputs ra = 26 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0010001110101101";
        RegIn <= "00110110";
        wait until (clock = '1');
        assert(RegAOut = "11001101");
        assert(RegBOut = "10001011");


        -- Testing: DEC on inputs ra = 20 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001010101001010";
        RegIn <= "00100011";
        wait until (clock = '1');
        assert(RegAOut = "10101111");


        -- Testing: CPC on inputs ra = 4 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0000011001001001";
        RegIn <= "00101100";
        wait until (clock = '1');
        assert(RegAOut = "11101001");
        assert(RegBOut = "00100101");


        -- Testing: ADD on inputs ra = 9 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0000110010010100";
        RegIn <= "10011101";
        wait until (clock = '1');
        assert(RegAOut = "10001011");
        assert(RegBOut = "11101001");


        -- Testing: ANDI on inputs ra = 1 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0111000000010000";
        RegIn <= "01110001";
        wait until (clock = '1');
        assert(RegAOut = "11010111");


        -- Testing: CPI on inputs ra = 18 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0011000000100000";
        RegIn <= "11010000";
        wait until (clock = '1');
        assert(RegAOut = "01101101");


        -- Testing: CPI on inputs ra = 8 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0011000010000000";
        RegIn <= "11010110";
        wait until (clock = '1');
        assert(RegAOut = "10110000");


        -- Testing: ADD on inputs ra = 31 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0000110111111001";
        RegIn <= "10010110";
        wait until (clock = '1');
        assert(RegAOut = "01110100");
        assert(RegBOut = "10011101");


        -- Testing: ADD on inputs ra = 4 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0000110001000110";
        RegIn <= "01011111";
        wait until (clock = '1');
        assert(RegAOut = "11101001");
        assert(RegBOut = "00101010");


        -- Testing: BSET on inputs ra = 6 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001101000";
        wait until (clock = '1');


        -- Testing: CPI on inputs ra = 19 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0011000000110000";
        RegIn <= "11000011";
        wait until (clock = '1');
        assert(RegAOut = "00000100");


        -- Testing: LSR on inputs ra = 18 and rb = 11 (only the ones that are used for the instruction).
        IR <= "1001010100100110";
        RegIn <= "00001000";
        wait until (clock = '1');
        assert(RegAOut = "01101101");


        -- Testing: ORI on inputs ra = 10 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0110000010100000";
        RegIn <= "11110000";
        wait until (clock = '1');
        assert(RegAOut = "00110110");


        -- Testing: SBCI on inputs ra = 28 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0100000011000000";
        RegIn <= "10101101";
        wait until (clock = '1');
        assert(RegAOut = "11111100");


        -- Testing: MUL on inputs ra = 15 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1001110011110100";
        RegIn <= "10000101";
        wait until (clock = '1');
        assert(RegAOut = "00010010");
        assert(RegBOut = "01011111");
        IR <= "1001110011110100";
        RegIn <= "10010110";
        wait until (clock = '1');
        assert(RegAOut = "00010010");
        assert(RegBOut = "01011111");


        -- Testing: SBIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100000000";
        RegIn <= "00011110";
        wait until (clock = '1');
        assert(RegAOut = "10110000");
        IR <= "1001011100000000";
        RegIn <= "10000001";
        wait until (clock = '1');
        assert(RegAOut = "00100101");


        -- Testing: SBC on inputs ra = 12 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0000101011001011";
        RegIn <= "11101001";
        wait until (clock = '1');
        assert(RegAOut = "11100111");
        assert(RegBOut = "01001101");


        -- Testing: BSET on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000001000";
        wait until (clock = '1');


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "00011101";
        wait until (clock = '1');
        assert(RegAOut = "11110000");
        IR <= "1001011100010000";
        RegIn <= "01001010";
        wait until (clock = '1');
        assert(RegAOut = "01001101");


        -- Testing: CPC on inputs ra = 17 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0000010100010001";
        RegIn <= "01011000";
        wait until (clock = '1');
        assert(RegAOut = "01110001");
        assert(RegBOut = "10010110");


        -- Testing: ANDI on inputs ra = 23 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0111000001110000";
        RegIn <= "00001101";
        wait until (clock = '1');
        assert(RegAOut = "10110011");


        -- Testing: OR on inputs ra = 21 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0010100101011000";
        RegIn <= "10101010";
        wait until (clock = '1');
        assert(RegAOut = "01111101");
        assert(RegBOut = "01001110");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "11010000";
        wait until (clock = '1');
        assert(RegAOut = "00011110");
        IR <= "1001011000000000";
        RegIn <= "00010100";
        wait until (clock = '1');
        assert(RegAOut = "10000001");


        -- Testing: BST on inputs ra = 17 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1111101100010011";
        wait until (clock = '1');
        assert(RegAOut = "01110001");


        -- Testing: EOR on inputs ra = 0 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0010011000000000";
        RegIn <= "00101011";
        wait until (clock = '1');
        assert(RegAOut = "10000101");
        assert(RegBOut = "11100000");


        -- Testing: SWAP on inputs ra = 3 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001010000110010";
        RegIn <= "11100011";
        wait until (clock = '1');
        assert(RegAOut = "00001100");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "01100010";
        wait until (clock = '1');
        assert(RegAOut = "00011101");
        IR <= "1001011000010000";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "01001010");


        -- Testing: COM on inputs ra = 16 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010100000000";
        RegIn <= "00010111";
        wait until (clock = '1');
        assert(RegAOut = "11100000");


        -- Testing: CPC on inputs ra = 7 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0000010001111000";
        RegIn <= "11110111";
        wait until (clock = '1');
        assert(RegAOut = "01001000");
        assert(RegBOut = "01001110");


        -- Testing: ORI on inputs ra = 2 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0110000000100000";
        RegIn <= "11100001";
        wait until (clock = '1');
        assert(RegAOut = "00001000");


        -- Testing: ADC on inputs ra = 15 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0001111011111010";
        RegIn <= "01100101";
        wait until (clock = '1');
        assert(RegAOut = "00010010");
        assert(RegBOut = "01100010");


        -- Testing: BST on inputs ra = 24 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1111101110000101";
        wait until (clock = '1');
        assert(RegAOut = "11010000");


        -- Testing: COM on inputs ra = 0 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010000000000";
        RegIn <= "00101100";
        wait until (clock = '1');
        assert(RegAOut = "00101011");


        -- Testing: COM on inputs ra = 5 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010001010000";
        RegIn <= "01100010";
        wait until (clock = '1');
        assert(RegAOut = "10001011");


        -- Testing: ADC on inputs ra = 5 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0001111001011001";
        RegIn <= "10110000";
        wait until (clock = '1');
        assert(RegAOut = "01100010");
        assert(RegBOut = "00010100");


        -- Testing: NEG on inputs ra = 0 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010000000001";
        RegIn <= "11000011";
        wait until (clock = '1');
        assert(RegAOut = "00101100");


        -- Testing: INC on inputs ra = 26 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010110100011";
        RegIn <= "00100100";
        wait until (clock = '1');
        assert(RegAOut = "01100010");


        -- Testing: CP on inputs ra = 16 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0001011100001011";
        RegIn <= "11000100";
        wait until (clock = '1');
        assert(RegAOut = "00010111");
        assert(RegBOut = "00101000");


        -- Testing: DEC on inputs ra = 17 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010100011010";
        RegIn <= "11011000";
        wait until (clock = '1');
        assert(RegAOut = "01110001");


        -- Testing: ADC on inputs ra = 10 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0001111010100011";
        RegIn <= "11100110";
        wait until (clock = '1');
        assert(RegAOut = "01000011");
        assert(RegBOut = "00000100");


        -- Testing: ORI on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0110000000100000";
        RegIn <= "00100000";
        wait until (clock = '1');
        assert(RegAOut = "11100001");


        -- Testing: ASR on inputs ra = 8 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010010000101";
        RegIn <= "11110010";
        wait until (clock = '1');
        assert(RegAOut = "01001110");


        -- Testing: MUL on inputs ra = 10 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1001110010100111";
        RegIn <= "11010111";
        wait until (clock = '1');
        assert(RegAOut = "11100110");
        assert(RegBOut = "01001000");
        IR <= "1001110010100111";
        RegIn <= "01100001";
        wait until (clock = '1');
        assert(RegAOut = "11100110");
        assert(RegBOut = "01001000");


        -- Testing: ADC on inputs ra = 23 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0001111101110000";
        RegIn <= "11011011";
        wait until (clock = '1');
        assert(RegAOut = "00001101");
        assert(RegBOut = "00010111");


        -- Testing: CPI on inputs ra = 17 and rb = 23 (only the ones that are used for the instruction).
        IR <= "0011000000010000";
        RegIn <= "11100101";
        wait until (clock = '1');
        assert(RegAOut = "11011000");


        -- Testing: COM on inputs ra = 4 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010001000000";
        RegIn <= "11100001";
        wait until (clock = '1');
        assert(RegAOut = "01011111");


        -- Testing: CPI on inputs ra = 19 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0011000000110000";
        RegIn <= "10001101";
        wait until (clock = '1');
        assert(RegAOut = "00000100");


        -- Testing: EOR on inputs ra = 28 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0010010111000110";
        RegIn <= "11001110";
        wait until (clock = '1');
        assert(RegAOut = "10101101");
        assert(RegBOut = "00101010");


        -- Testing: BCLR on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011001000";
        wait until (clock = '1');


        -- Testing: DEC on inputs ra = 1 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1001010000011010";
        RegIn <= "10011101";
        wait until (clock = '1');
        assert(RegAOut = "01100001");


        -- Testing: ROR on inputs ra = 26 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001010110100111";
        RegIn <= "00000110";
        wait until (clock = '1');
        assert(RegAOut = "00100100");


        -- Testing: SWAP on inputs ra = 11 and rb = 12 (only the ones that are used for the instruction).
        IR <= "1001010010110010";
        RegIn <= "11111111";
        wait until (clock = '1');
        assert(RegAOut = "11011100");


        -- Testing: BLD on inputs ra = 12 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1111100011000111";
        RegIn <= "00011001";
        wait until (clock = '1');
        assert(RegAOut = "00011001");


        -- Testing: MUL on inputs ra = 22 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001111101100111";
        RegIn <= "00100101";
        wait until (clock = '1');
        assert(RegAOut = "00100110");
        assert(RegBOut = "11011011");
        IR <= "1001111101100111";
        RegIn <= "10010011";
        wait until (clock = '1');
        assert(RegAOut = "00100110");
        assert(RegBOut = "11011011");


        -- Testing: NEG on inputs ra = 11 and rb = 14 (only the ones that are used for the instruction).
        IR <= "1001010010110001";
        RegIn <= "11001110";
        wait until (clock = '1');
        assert(RegAOut = "11111111");


        -- Testing: BST on inputs ra = 31 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111101111110001";
        wait until (clock = '1');
        assert(RegAOut = "10010110");


        -- Testing: ADD on inputs ra = 3 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0000111000111001";
        RegIn <= "11000110";
        wait until (clock = '1');
        assert(RegAOut = "11100011");
        assert(RegBOut = "00010100");


        -- Testing: ROR on inputs ra = 21 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001010101010111";
        RegIn <= "10100001";
        wait until (clock = '1');
        assert(RegAOut = "10101010");


        -- Testing: ANDI on inputs ra = 23 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0111000001110000";
        RegIn <= "00111110";
        wait until (clock = '1');
        assert(RegAOut = "11011011");


        -- Testing: LSR on inputs ra = 17 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1001010100010110";
        RegIn <= "11011001";
        wait until (clock = '1');
        assert(RegAOut = "11011000");


        -- Testing: SBIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100000000";
        RegIn <= "11001100";
        wait until (clock = '1');
        assert(RegAOut = "11010000");
        IR <= "1001011100000000";
        RegIn <= "01110011";
        wait until (clock = '1');
        assert(RegAOut = "00010100");


        -- Testing: AND on inputs ra = 16 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0010000100000001";
        RegIn <= "10000011";
        wait until (clock = '1');
        assert(RegAOut = "00010111");
        assert(RegBOut = "10010011");


        -- Testing: ASR on inputs ra = 20 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010101000101";
        RegIn <= "10100011";
        wait until (clock = '1');
        assert(RegAOut = "00100011");


        -- Testing: AND on inputs ra = 12 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0010001011001011";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "00011001");
        assert(RegBOut = "00101000");


        -- Testing: CP on inputs ra = 27 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0001010110111001";
        RegIn <= "11101101";
        wait until (clock = '1');
        assert(RegAOut = "00101000");
        assert(RegBOut = "10011101");


        -- Testing: ORI on inputs ra = 21 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0110000001010000";
        RegIn <= "11101111";
        wait until (clock = '1');
        assert(RegAOut = "10100001");


        -- Testing: BSET on inputs ra = 7 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001111000";
        wait until (clock = '1');


        -- Testing: MUL on inputs ra = 23 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001110101110001";
        RegIn <= "00100010";
        wait until (clock = '1');
        assert(RegAOut = "00111110");
        assert(RegBOut = "10010011");
        IR <= "1001110101110001";
        RegIn <= "10101111";
        wait until (clock = '1');
        assert(RegAOut = "00111110");
        assert(RegBOut = "10010011");


        -- Testing: LSR on inputs ra = 8 and rb = 14 (only the ones that are used for the instruction).
        IR <= "1001010010000110";
        RegIn <= "11101110";
        wait until (clock = '1');
        assert(RegAOut = "11110010");


        -- Testing: SBCI on inputs ra = 21 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0100000001010000";
        RegIn <= "10010000";
        wait until (clock = '1');
        assert(RegAOut = "11101111");


        -- Testing: MUL on inputs ra = 11 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001111010110010";
        RegIn <= "00011100";
        wait until (clock = '1');
        assert(RegAOut = "11001110");
        assert(RegBOut = "00100000");
        IR <= "1001111010110010";
        RegIn <= "00001111";
        wait until (clock = '1');
        assert(RegAOut = "11001110");
        assert(RegBOut = "00100000");


        -- Testing: CP on inputs ra = 14 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0001011011101100";
        RegIn <= "11101101";
        wait until (clock = '1');
        assert(RegAOut = "00011010");
        assert(RegBOut = "11001110");


        -- Testing: COM on inputs ra = 5 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001010001010000";
        RegIn <= "01110010";
        wait until (clock = '1');
        assert(RegAOut = "10110000");


        -- Testing: DEC on inputs ra = 30 and rb = 27 (only the ones that are used for the instruction).
        IR <= "1001010111101010";
        RegIn <= "00000101";
        wait until (clock = '1');
        assert(RegAOut = "01100101");


        -- Testing: CPI on inputs ra = 8 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0011000010000000";
        RegIn <= "00001001";
        wait until (clock = '1');
        assert(RegAOut = "11001100");


        -- Testing: OR on inputs ra = 11 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0010100010110111";
        RegIn <= "01101001";
        wait until (clock = '1');
        assert(RegAOut = "11001110");
        assert(RegBOut = "01001000");


        -- Testing: NEG on inputs ra = 30 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001010111100001";
        RegIn <= "01110100";
        wait until (clock = '1');
        assert(RegAOut = "00000101");


        -- Testing: SWAP on inputs ra = 26 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010110100010";
        RegIn <= "11101100";
        wait until (clock = '1');
        assert(RegAOut = "00000110");


        -- Testing: SUBI on inputs ra = 15 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0101000011110000";
        RegIn <= "01011001";
        wait until (clock = '1');
        assert(RegAOut = "10010110");


        -- Testing: SUB on inputs ra = 22 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0001101101101000";
        RegIn <= "10100011";
        wait until (clock = '1');
        assert(RegAOut = "00100110");
        assert(RegBOut = "11001100");


        -- Testing: OR on inputs ra = 7 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0010101001110101";
        RegIn <= "11100000";
        wait until (clock = '1');
        assert(RegAOut = "01001000");
        assert(RegBOut = "10010000");


        -- Testing: ASR on inputs ra = 11 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001010010110101";
        RegIn <= "01101011";
        wait until (clock = '1');
        assert(RegAOut = "01101001");


        -- Testing: NEG on inputs ra = 20 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001010101000001";
        RegIn <= "00110110";
        wait until (clock = '1');
        assert(RegAOut = "10100011");


        -- Testing: BCLR on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010011000";
        wait until (clock = '1');


        -- Testing: BLD on inputs ra = 11 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1111100010110011";
        RegIn <= "10111100";
        wait until (clock = '1');
        assert(RegAOut = "10111100");


        -- Testing: BCLR on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010001000";
        wait until (clock = '1');


        -- Testing: SUBI on inputs ra = 27 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0101000010110000";
        RegIn <= "11000000";
        wait until (clock = '1');
        assert(RegAOut = "00101000");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "01011001";
        wait until (clock = '1');
        assert(RegAOut = "11001100");
        IR <= "1001011000000000";
        RegIn <= "00010111";
        wait until (clock = '1');
        assert(RegAOut = "01110011");


        -- Testing: BCLR on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010001000";
        wait until (clock = '1');


        -- Testing: SBCI on inputs ra = 29 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0100000011010000";
        RegIn <= "00000010";
        wait until (clock = '1');
        assert(RegAOut = "10001011");


        -- Testing: OR on inputs ra = 13 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0010100011011101";
        RegIn <= "10100111";
        wait until (clock = '1');
        assert(RegAOut = "01001110");
        assert(RegBOut = "01001110");


        -- Testing: BST on inputs ra = 15 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1111101011111000";
        wait until (clock = '1');
        assert(RegAOut = "01100101");


        -- Testing: CPI on inputs ra = 27 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0011000010110000";
        RegIn <= "10101110";
        wait until (clock = '1');
        assert(RegAOut = "11000000");


        -- Testing: ADC on inputs ra = 23 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0001110101111011";
        RegIn <= "11100101";
        wait until (clock = '1');
        assert(RegAOut = "00111110");
        assert(RegBOut = "10111100");


        -- Testing: BLD on inputs ra = 18 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1111100100100110";
        RegIn <= "11111100";
        wait until (clock = '1');
        assert(RegAOut = "11111100");


        -- Testing: SBCI on inputs ra = 15 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0100000011110000";
        RegIn <= "01110011";
        wait until (clock = '1');
        assert(RegAOut = "01011001");


        -- Testing: BSET on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000111000";
        wait until (clock = '1');


        -- Testing: CPC on inputs ra = 14 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0000010011100011";
        RegIn <= "00010110";
        wait until (clock = '1');
        assert(RegAOut = "00011010");
        assert(RegBOut = "11000110");


        -- Testing: SUBI on inputs ra = 31 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0101000011110000";
        RegIn <= "00010011";
        wait until (clock = '1');
        assert(RegAOut = "01110011");


        -- Testing: INC on inputs ra = 13 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010011010011";
        RegIn <= "00100000";
        wait until (clock = '1');
        assert(RegAOut = "10100111");


        -- Testing: ROR on inputs ra = 10 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1001010010100111";
        RegIn <= "11000110";
        wait until (clock = '1');
        assert(RegAOut = "11100110");


        -- Testing: BST on inputs ra = 5 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111101001011100";
        wait until (clock = '1');
        assert(RegAOut = "01110010");


        -- Testing: SBIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100100000";
        RegIn <= "11000011";
        wait until (clock = '1');
        assert(RegAOut = "11001110");
        IR <= "1001011100100000";
        RegIn <= "00100110";
        wait until (clock = '1');
        assert(RegAOut = "00000010");


        -- Testing: ANDI on inputs ra = 22 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0111000001100000";
        RegIn <= "10000011";
        wait until (clock = '1');
        assert(RegAOut = "10100011");


        -- Testing: SWAP on inputs ra = 27 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001010110110010";
        RegIn <= "11110011";
        wait until (clock = '1');
        assert(RegAOut = "11000000");


        -- Testing: SBC on inputs ra = 14 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0000100011100111";
        RegIn <= "00101011";
        wait until (clock = '1');
        assert(RegAOut = "00011010");
        assert(RegBOut = "11100000");


        -- Testing: SBC on inputs ra = 17 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0000100100011011";
        RegIn <= "10111111";
        wait until (clock = '1');
        assert(RegAOut = "11011001");
        assert(RegBOut = "10111100");


        -- Testing: ADC on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0001110000110000";
        RegIn <= "00111011";
        wait until (clock = '1');
        assert(RegAOut = "11000110");
        assert(RegBOut = "00011100");


        -- Testing: ANDI on inputs ra = 28 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0111000011000000";
        RegIn <= "01101111";
        wait until (clock = '1');
        assert(RegAOut = "11000011");


        -- Testing: LSR on inputs ra = 29 and rb = 11 (only the ones that are used for the instruction).
        IR <= "1001010111010110";
        RegIn <= "00001010";
        wait until (clock = '1');
        assert(RegAOut = "00100110");


        -- Testing: SBC on inputs ra = 7 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0000101001111100";
        RegIn <= "01101011";
        wait until (clock = '1');
        assert(RegAOut = "11100000");
        assert(RegBOut = "01101111");


        -- Testing: ADD on inputs ra = 12 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0000111011001111";
        RegIn <= "10110011";
        wait until (clock = '1');
        assert(RegAOut = "10001011");
        assert(RegBOut = "00010011");


        -- Testing: SBCI on inputs ra = 3 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0100000000110000";
        RegIn <= "00011111";
        wait until (clock = '1');
        assert(RegAOut = "00000100");


        -- Testing: BSET on inputs ra = 5 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001011000";
        wait until (clock = '1');


        -- Testing: BCLR on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011001000";
        wait until (clock = '1');


        -- Testing: AND on inputs ra = 14 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0010000011100001";
        RegIn <= "11010001";
        wait until (clock = '1');
        assert(RegAOut = "00101011");
        assert(RegBOut = "00001111");


        -- Testing: INC on inputs ra = 29 and rb = 26 (only the ones that are used for the instruction).
        IR <= "1001010111010011";
        RegIn <= "01110111";
        wait until (clock = '1');
        assert(RegAOut = "00001010");


        -- Testing: SBC on inputs ra = 17 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0000100100010010";
        RegIn <= "11001111";
        wait until (clock = '1');
        assert(RegAOut = "10111111");
        assert(RegBOut = "00101000");


        -- Testing: BLD on inputs ra = 14 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100011100001";
        RegIn <= "11011010";
        wait until (clock = '1');
        assert(RegAOut = "11011010");


        -- Testing: SBC on inputs ra = 16 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0000101100001010";
        RegIn <= "11011111";
        wait until (clock = '1');
        assert(RegAOut = "10000011");
        assert(RegBOut = "11101100");


        -- Testing: DEC on inputs ra = 11 and rb = 14 (only the ones that are used for the instruction).
        IR <= "1001010010111010";
        RegIn <= "00010010";
        wait until (clock = '1');
        assert(RegAOut = "10111100");


        -- Testing: SBCI on inputs ra = 6 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0100000001100000";
        RegIn <= "11110111";
        wait until (clock = '1');
        assert(RegAOut = "10000011");


        -- Testing: SWAP on inputs ra = 9 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1001010010010010";
        RegIn <= "10110010";
        wait until (clock = '1');
        assert(RegAOut = "10011101");


        -- Testing: BCLR on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010101000";
        wait until (clock = '1');


        -- Testing: BSET on inputs ra = 5 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001011000";
        wait until (clock = '1');


        -- Testing: MUL on inputs ra = 28 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001110111001001";
        RegIn <= "01110100";
        wait until (clock = '1');
        assert(RegAOut = "01101111");
        assert(RegBOut = "10110010");
        IR <= "1001110111001001";
        RegIn <= "01101110";
        wait until (clock = '1');
        assert(RegAOut = "01101111");
        assert(RegBOut = "10110010");


        -- Testing: ROR on inputs ra = 9 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001010010010111";
        RegIn <= "01110000";
        wait until (clock = '1');
        assert(RegAOut = "10110010");


        -- Testing: BSET on inputs ra = 5 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001011000";
        wait until (clock = '1');


        -- Testing: ORI on inputs ra = 9 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0110000010010000";
        RegIn <= "01001010";
        wait until (clock = '1');
        assert(RegAOut = "00010111");


        -- Testing: BST on inputs ra = 18 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111101100101100";
        wait until (clock = '1');
        assert(RegAOut = "11111100");


        -- Testing: SBCI on inputs ra = 1 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0100000000010000";
        RegIn <= "01100000";
        wait until (clock = '1');
        assert(RegAOut = "11001111");


        -- Testing: ASR on inputs ra = 6 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1001010001100101";
        RegIn <= "01011011";
        wait until (clock = '1');
        assert(RegAOut = "00101010");


        -- Testing: ADC on inputs ra = 13 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0001111011011110";
        RegIn <= "00000010";
        wait until (clock = '1');
        assert(RegAOut = "00100000");
        assert(RegBOut = "01110100");


        -- Testing: SUBI on inputs ra = 24 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0101000010000000";
        RegIn <= "10010101";
        wait until (clock = '1');
        assert(RegAOut = "01011001");


        -- Testing: ROR on inputs ra = 26 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010110100111";
        RegIn <= "00011011";
        wait until (clock = '1');
        assert(RegAOut = "11101100");


        -- Testing: SBCI on inputs ra = 26 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0100000010100000";
        RegIn <= "01001000";
        wait until (clock = '1');
        assert(RegAOut = "00011011");


        -- Testing: INC on inputs ra = 20 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010101000011";
        RegIn <= "10100100";
        wait until (clock = '1');
        assert(RegAOut = "00110110");


        -- Testing: OR on inputs ra = 0 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0010101000000100";
        RegIn <= "11101010";
        wait until (clock = '1');
        assert(RegAOut = "01110100");
        assert(RegBOut = "10100100");


        -- Testing: ADC on inputs ra = 23 and rb = 12 (only the ones that are used for the instruction).
        IR <= "0001110101111100";
        RegIn <= "10101110";
        wait until (clock = '1');
        assert(RegAOut = "11100101");
        assert(RegBOut = "10110011");


        -- Testing: MUL on inputs ra = 19 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001111100111001";
        RegIn <= "01000011";
        wait until (clock = '1');
        assert(RegAOut = "00011111");
        assert(RegBOut = "01001010");
        IR <= "1001111100111001";
        RegIn <= "01111110";
        wait until (clock = '1');
        assert(RegAOut = "00011111");
        assert(RegBOut = "01001010");


        -- Testing: SBC on inputs ra = 6 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0000101001101100";
        RegIn <= "00111010";
        wait until (clock = '1');
        assert(RegAOut = "01011011");
        assert(RegBOut = "01101111");


        -- Testing: SUBI on inputs ra = 25 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0101000010010000";
        RegIn <= "10001110";
        wait until (clock = '1');
        assert(RegAOut = "01001010");


        -- Testing: ANDI on inputs ra = 13 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0111000011010000";
        RegIn <= "01100100";
        wait until (clock = '1');
        assert(RegAOut = "01110111");


        -- Testing: COM on inputs ra = 3 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010000110000";
        RegIn <= "01000001";
        wait until (clock = '1');
        assert(RegAOut = "00111011");


        -- Testing: BLD on inputs ra = 20 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100101000001";
        RegIn <= "11010011";
        wait until (clock = '1');
        assert(RegAOut = "11010011");


        -- Testing: DEC on inputs ra = 4 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1001010001001010";
        RegIn <= "11111101";
        wait until (clock = '1');
        assert(RegAOut = "11100001");


        -- Testing: COM on inputs ra = 6 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1001010001100000";
        RegIn <= "10011000";
        wait until (clock = '1');
        assert(RegAOut = "00111010");


        -- Testing: SUBI on inputs ra = 7 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0101000001110000";
        RegIn <= "11110001";
        wait until (clock = '1');
        assert(RegAOut = "10101110");


        -- Testing: LSR on inputs ra = 18 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010100100110";
        RegIn <= "01011111";
        wait until (clock = '1');
        assert(RegAOut = "11111100");


        -- Testing: BCLR on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010001000";
        wait until (clock = '1');


        -- Testing: SBIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100100000";
        RegIn <= "00110010";
        wait until (clock = '1');
        assert(RegAOut = "01101111");
        IR <= "1001011100100000";
        RegIn <= "11000001";
        wait until (clock = '1');
        assert(RegAOut = "01100100");


        -- Testing: DEC on inputs ra = 11 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010010111010";
        RegIn <= "01100010";
        wait until (clock = '1');
        assert(RegAOut = "00010010");


        -- Testing: ADC on inputs ra = 3 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0001110000110101";
        RegIn <= "10101111";
        wait until (clock = '1');
        assert(RegAOut = "01000001");
        assert(RegBOut = "01110010");


        -- Testing: BSET on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000001000";
        wait until (clock = '1');


        -- Testing: ROR on inputs ra = 30 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010111100111";
        RegIn <= "01101101";
        wait until (clock = '1');
        assert(RegAOut = "01110100");


        -- Testing: COM on inputs ra = 5 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1001010001010000";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "01110010");


        -- Testing: SBCI on inputs ra = 17 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0100000000010000";
        RegIn <= "00111001";
        wait until (clock = '1');
        assert(RegAOut = "01100000");


        -- Testing: MUL on inputs ra = 19 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1001110100110010";
        RegIn <= "10001010";
        wait until (clock = '1');
        assert(RegAOut = "00011111");
        assert(RegBOut = "00101000");
        IR <= "1001110100110010";
        RegIn <= "11100101";
        wait until (clock = '1');
        assert(RegAOut = "00011111");
        assert(RegBOut = "00101000");


        -- Testing: ADD on inputs ra = 21 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0000110101010011";
        RegIn <= "11000111";
        wait until (clock = '1');
        assert(RegAOut = "10010000");
        assert(RegBOut = "10101111");


        -- Testing: SBCI on inputs ra = 31 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0100000011110000";
        RegIn <= "10010011";
        wait until (clock = '1');
        assert(RegAOut = "00010011");


        -- Testing: ORI on inputs ra = 12 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0110000011000000";
        RegIn <= "10011101";
        wait until (clock = '1');
        assert(RegAOut = "00110010");


        -- Testing: SBIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100000000";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "10010101");
        IR <= "1001011100000000";
        RegIn <= "01100110";
        wait until (clock = '1');
        assert(RegAOut = "10001110");


        -- Testing: DEC on inputs ra = 16 and rb = 26 (only the ones that are used for the instruction).
        IR <= "1001010100001010";
        RegIn <= "10000111";
        wait until (clock = '1');
        assert(RegAOut = "11011111");


        -- Testing: CPC on inputs ra = 22 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0000010101101111";
        RegIn <= "00111101";
        wait until (clock = '1');
        assert(RegAOut = "11110111");
        assert(RegBOut = "01100101");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "11110110";
        wait until (clock = '1');
        assert(RegAOut = "10011101");
        IR <= "1001011000100000";
        RegIn <= "00111010";
        wait until (clock = '1');
        assert(RegAOut = "11000001");


        -- Testing: INC on inputs ra = 19 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010100110011";
        RegIn <= "11110011";
        wait until (clock = '1');
        assert(RegAOut = "00011111");


        -- Testing: SUBI on inputs ra = 24 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0101000010000000";
        RegIn <= "01001001";
        wait until (clock = '1');
        assert(RegAOut = "10001011");


        -- Testing: BLD on inputs ra = 9 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100010010001";
        RegIn <= "11011010";
        wait until (clock = '1');
        assert(RegAOut = "11011010");


        -- Testing: SWAP on inputs ra = 25 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001010110010010";
        RegIn <= "10001001";
        wait until (clock = '1');
        assert(RegAOut = "01100110");


        -- Testing: ADC on inputs ra = 1 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0001110000010101";
        RegIn <= "10111001";
        wait until (clock = '1');
        assert(RegAOut = "11100101");
        assert(RegBOut = "10001011");


        -- Testing: ROR on inputs ra = 10 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010010100111";
        RegIn <= "01111110";
        wait until (clock = '1');
        assert(RegAOut = "11000110");


        -- Testing: MUL on inputs ra = 19 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001110100111010";
        RegIn <= "11011101";
        wait until (clock = '1');
        assert(RegAOut = "11110011");
        assert(RegBOut = "01111110");
        IR <= "1001110100111010";
        RegIn <= "10010000";
        wait until (clock = '1');
        assert(RegAOut = "11110011");
        assert(RegBOut = "01111110");


        -- Testing: ROR on inputs ra = 31 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010111110111";
        RegIn <= "11010011";
        wait until (clock = '1');
        assert(RegAOut = "10010011");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "01011100";
        wait until (clock = '1');
        assert(RegAOut = "01001000");
        IR <= "1001011000010000";
        RegIn <= "00010111";
        wait until (clock = '1');
        assert(RegAOut = "11110011");


        -- Testing: SUB on inputs ra = 3 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0001100000110011";
        RegIn <= "11101010";
        wait until (clock = '1');
        assert(RegAOut = "10101111");
        assert(RegBOut = "10101111");


        -- Testing: BST on inputs ra = 18 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1111101100100111";
        wait until (clock = '1');
        assert(RegAOut = "01011111");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "01100100";
        wait until (clock = '1');
        assert(RegAOut = "01011100");
        IR <= "1001011100010000";
        RegIn <= "00111111";
        wait until (clock = '1');
        assert(RegAOut = "00010111");


        -- Testing: BSET on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000001000";
        wait until (clock = '1');


        -- Testing: MUL on inputs ra = 10 and rb = 27 (only the ones that are used for the instruction).
        IR <= "1001111010101011";
        RegIn <= "01100110";
        wait until (clock = '1');
        assert(RegAOut = "01111110");
        assert(RegBOut = "00111111");
        IR <= "1001111010101011";
        RegIn <= "11011010";
        wait until (clock = '1');
        assert(RegAOut = "01111110");
        assert(RegBOut = "00111111");


        -- Testing: ANDI on inputs ra = 31 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0111000011110000";
        RegIn <= "01100111";
        wait until (clock = '1');
        assert(RegAOut = "11010011");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "10110101";
        wait until (clock = '1');
        assert(RegAOut = "11110110");
        IR <= "1001011000100000";
        RegIn <= "10000010";
        wait until (clock = '1');
        assert(RegAOut = "00111010");


        -- Testing: SUBI on inputs ra = 1 and rb = 23 (only the ones that are used for the instruction).
        IR <= "0101000000010000";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "00111001");


        -- Testing: NEG on inputs ra = 20 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001010101000001";
        RegIn <= "00011010";
        wait until (clock = '1');
        assert(RegAOut = "11010011");


        -- Testing: ANDI on inputs ra = 7 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0111000001110000";
        RegIn <= "00101100";
        wait until (clock = '1');
        assert(RegAOut = "11110001");


        -- Testing: SBIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100110000";
        RegIn <= "11100001";
        wait until (clock = '1');
        assert(RegAOut = "01101101");
        IR <= "1001011100110000";
        RegIn <= "00100010";
        wait until (clock = '1');
        assert(RegAOut = "01100111");


        -- Testing: NEG on inputs ra = 21 and rb = 27 (only the ones that are used for the instruction).
        IR <= "1001010101010001";
        RegIn <= "01110011";
        wait until (clock = '1');
        assert(RegAOut = "11000111");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "10010011";
        wait until (clock = '1');
        assert(RegAOut = "10110101");
        IR <= "1001011000100000";
        RegIn <= "01110101";
        wait until (clock = '1');
        assert(RegAOut = "10000010");


        -- Testing: SUBI on inputs ra = 30 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0101000011100000";
        RegIn <= "10001110";
        wait until (clock = '1');
        assert(RegAOut = "11100001");


        -- Testing: ASR on inputs ra = 13 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011010101";
        RegIn <= "01000000";
        wait until (clock = '1');
        assert(RegAOut = "00000010");


        -- Testing: ADC on inputs ra = 28 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0001111111000110";
        RegIn <= "10011001";
        wait until (clock = '1');
        assert(RegAOut = "10010011");
        assert(RegBOut = "11110111");


        -- Testing: CP on inputs ra = 3 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0001011000111101";
        RegIn <= "00010001";
        wait until (clock = '1');
        assert(RegAOut = "11101010");
        assert(RegBOut = "01110101");


        -- Testing: SUBI on inputs ra = 21 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0101000001010000";
        RegIn <= "10111101";
        wait until (clock = '1');
        assert(RegAOut = "01110011");


        -- Testing: ROR on inputs ra = 24 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001010110000111";
        RegIn <= "11000101";
        wait until (clock = '1');
        assert(RegAOut = "01001001");


        -- Testing: OR on inputs ra = 19 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0010101100110011";
        RegIn <= "00011000";
        wait until (clock = '1');
        assert(RegAOut = "11110011");
        assert(RegBOut = "11110011");


        -- Testing: BLD on inputs ra = 9 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1111100010010110";
        RegIn <= "01010110";
        wait until (clock = '1');
        assert(RegAOut = "01010110");


        -- Testing: ORI on inputs ra = 4 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0110000001000000";
        RegIn <= "01010000";
        wait until (clock = '1');
        assert(RegAOut = "00011010");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "00011110";
        wait until (clock = '1');
        assert(RegAOut = "01100100");
        IR <= "1001011000010000";
        RegIn <= "00000101";
        wait until (clock = '1');
        assert(RegAOut = "00111111");


        -- Testing: DEC on inputs ra = 13 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1001010011011010";
        RegIn <= "10110001";
        wait until (clock = '1');
        assert(RegAOut = "01000000");


        -- Testing: SWAP on inputs ra = 21 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001010101010010";
        RegIn <= "01010011";
        wait until (clock = '1');
        assert(RegAOut = "10111101");


        -- Testing: ANDI on inputs ra = 2 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0111000000100000";
        RegIn <= "00010111";
        wait until (clock = '1');
        assert(RegAOut = "01011111");


        -- Testing: INC on inputs ra = 7 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1001010001110011";
        RegIn <= "01011101";
        wait until (clock = '1');
        assert(RegAOut = "01101011");


        -- Testing: BCLR on inputs ra = 5 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011011000";
        wait until (clock = '1');


        -- Testing: ANDI on inputs ra = 3 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0111000000110000";
        RegIn <= "01001000";
        wait until (clock = '1');
        assert(RegAOut = "00011000");


        -- Testing: SUBI on inputs ra = 16 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0101000000000000";
        RegIn <= "00010001";
        wait until (clock = '1');
        assert(RegAOut = "10000111");


        -- Testing: ANDI on inputs ra = 8 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0111000010000000";
        RegIn <= "11101101";
        wait until (clock = '1');
        assert(RegAOut = "11000101");


        -- Testing: BCLR on inputs ra = 6 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011101000";
        wait until (clock = '1');


        -- Testing: SBIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100100000";
        RegIn <= "00010011";
        wait until (clock = '1');
        assert(RegAOut = "10011001");
        IR <= "1001011100100000";
        RegIn <= "10010010";
        wait until (clock = '1');
        assert(RegAOut = "01110101");


        -- Testing: INC on inputs ra = 2 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1001010000100011";
        RegIn <= "10001101";
        wait until (clock = '1');
        assert(RegAOut = "00101000");


        -- Testing: SWAP on inputs ra = 4 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001010001000010";
        RegIn <= "00110100";
        wait until (clock = '1');
        assert(RegAOut = "11111101");


        -- Testing: EOR on inputs ra = 30 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0010010111100010";
        RegIn <= "00010000";
        wait until (clock = '1');
        assert(RegAOut = "10001110");
        assert(RegBOut = "10001101");


        -- Testing: COM on inputs ra = 12 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010011000000";
        RegIn <= "00100001";
        wait until (clock = '1');
        assert(RegAOut = "10110011");


        -- Testing: SBCI on inputs ra = 9 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0100000010010000";
        RegIn <= "10000000";
        wait until (clock = '1');
        assert(RegAOut = "10001001");


        -- Testing: CPC on inputs ra = 21 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0000011101010010";
        RegIn <= "01000011";
        wait until (clock = '1');
        assert(RegAOut = "01010011");
        assert(RegBOut = "00010111");


        -- Testing: BLD on inputs ra = 21 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100101010001";
        RegIn <= "00000001";
        wait until (clock = '1');
        assert(RegAOut = "00000001");


        -- Testing: LSR on inputs ra = 16 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001010100000110";
        RegIn <= "00000011";
        wait until (clock = '1');
        assert(RegAOut = "00010001");


        -- Testing: COM on inputs ra = 9 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001010010010000";
        RegIn <= "01101011";
        wait until (clock = '1');
        assert(RegAOut = "01010110");


        -- Testing: CPC on inputs ra = 24 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0000010110001101";
        RegIn <= "01101111";
        wait until (clock = '1');
        assert(RegAOut = "11101101");
        assert(RegBOut = "10110001");


        -- Testing: ANDI on inputs ra = 12 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0111000011000000";
        RegIn <= "10110001";
        wait until (clock = '1');
        assert(RegAOut = "00010011");


        -- Testing: SUB on inputs ra = 0 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0001100000001011";
        RegIn <= "00010110";
        wait until (clock = '1');
        assert(RegAOut = "01100110");
        assert(RegBOut = "01100010");


        -- Testing: CPI on inputs ra = 20 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0011000001000000";
        RegIn <= "11010101";
        wait until (clock = '1');
        assert(RegAOut = "01010000");


        -- Testing: ANDI on inputs ra = 30 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0111000011100000";
        RegIn <= "11001110";
        wait until (clock = '1');
        assert(RegAOut = "00010000");


        -- Testing: ANDI on inputs ra = 28 and rb = 5 (only the ones that are used for the instruction).
        IR <= "0111000011000000";
        RegIn <= "00011110";
        wait until (clock = '1');
        assert(RegAOut = "10110001");


        -- Testing: ORI on inputs ra = 13 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0110000011010000";
        RegIn <= "11110000";
        wait until (clock = '1');
        assert(RegAOut = "10010010");


        -- Testing: CPC on inputs ra = 1 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0000010000010100";
        RegIn <= "10010101";
        wait until (clock = '1');
        assert(RegAOut = "11011010");
        assert(RegBOut = "00110100");


        -- Testing: SBIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100000000";
        RegIn <= "11000000";
        wait until (clock = '1');
        assert(RegAOut = "11101101");
        IR <= "1001011100000000";
        RegIn <= "11000110";
        wait until (clock = '1');
        assert(RegAOut = "10000000");


        -- Testing: AND on inputs ra = 11 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0010000010111101";
        RegIn <= "10100101";
        wait until (clock = '1');
        assert(RegAOut = "01100010");
        assert(RegBOut = "10110001");


        -- Testing: COM on inputs ra = 6 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001010001100000";
        RegIn <= "01001110";
        wait until (clock = '1');
        assert(RegAOut = "10011000");


        -- Testing: LSR on inputs ra = 18 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010100100110";
        RegIn <= "11011000";
        wait until (clock = '1');
        assert(RegAOut = "00010111");


        -- Testing: BCLR on inputs ra = 5 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011011000";
        wait until (clock = '1');


        -- Testing: CPC on inputs ra = 31 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0000010111111101";
        RegIn <= "11010100";
        wait until (clock = '1');
        assert(RegAOut = "00100010");
        assert(RegBOut = "10110001");


        -- Testing: EOR on inputs ra = 14 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0010010011100110";
        RegIn <= "00111000";
        wait until (clock = '1');
        assert(RegAOut = "11011010");
        assert(RegBOut = "01001110");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "11010011";
        wait until (clock = '1');
        assert(RegAOut = "11000000");
        IR <= "1001011000000000";
        RegIn <= "11111100";
        wait until (clock = '1');
        assert(RegAOut = "11000110");


        -- Testing: SUBI on inputs ra = 24 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0101000010000000";
        RegIn <= "10111110";
        wait until (clock = '1');
        assert(RegAOut = "11010011");


        -- Testing: CPC on inputs ra = 7 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0000010001111010";
        RegIn <= "10111100";
        wait until (clock = '1');
        assert(RegAOut = "01011101");
        assert(RegBOut = "01111110");


        -- Testing: COM on inputs ra = 26 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1001010110100000";
        RegIn <= "00010001";
        wait until (clock = '1');
        assert(RegAOut = "00011110");


        -- Testing: BLD on inputs ra = 10 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100010100001";
        RegIn <= "10011000";
        wait until (clock = '1');
        assert(RegAOut = "10011000");


        -- Testing: SUB on inputs ra = 16 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0001100100001101";
        RegIn <= "10001001";
        wait until (clock = '1');
        assert(RegAOut = "00000011");
        assert(RegBOut = "10110001");


        -- Testing: MUL on inputs ra = 17 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001110100010101";
        RegIn <= "11001110";
        wait until (clock = '1');
        assert(RegAOut = "00101000");
        assert(RegBOut = "10001011");
        IR <= "1001110100010101";
        RegIn <= "11010100";
        wait until (clock = '1');
        assert(RegAOut = "00101000");
        assert(RegBOut = "10001011");


        -- Testing: SBCI on inputs ra = 30 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0100000011100000";
        RegIn <= "01101100";
        wait until (clock = '1');
        assert(RegAOut = "11001110");


        -- Testing: ASR on inputs ra = 4 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001010001000101";
        RegIn <= "01101010";
        wait until (clock = '1');
        assert(RegAOut = "00110100");


        -- Testing: SUBI on inputs ra = 17 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0101000000010000";
        RegIn <= "11101111";
        wait until (clock = '1');
        assert(RegAOut = "00101000");


        -- Testing: MUL on inputs ra = 31 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001111111110000";
        RegIn <= "01000001";
        wait until (clock = '1');
        assert(RegAOut = "00100010");
        assert(RegBOut = "10001001");
        IR <= "1001111111110000";
        RegIn <= "10110100";
        wait until (clock = '1');
        assert(RegAOut = "00100010");
        assert(RegBOut = "10001001");


        -- Testing: OR on inputs ra = 23 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0010101101111011";
        RegIn <= "00110010";
        wait until (clock = '1');
        assert(RegAOut = "00101100");
        assert(RegBOut = "00000101");


        -- Testing: ADD on inputs ra = 12 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0000110011000011";
        RegIn <= "01000111";
        wait until (clock = '1');
        assert(RegAOut = "00100001");
        assert(RegBOut = "11101010");


        -- Testing: COM on inputs ra = 7 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001010001110000";
        RegIn <= "10011001";
        wait until (clock = '1');
        assert(RegAOut = "01011101");


        -- Testing: MUL on inputs ra = 17 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001111100011110";
        RegIn <= "01110101";
        wait until (clock = '1');
        assert(RegAOut = "11101111");
        assert(RegBOut = "01101100");
        IR <= "1001111100011110";
        RegIn <= "11001100";
        wait until (clock = '1');
        assert(RegAOut = "11101111");
        assert(RegBOut = "01101100");


        -- Testing: BLD on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1111100001000000";
        RegIn <= "00111010";
        wait until (clock = '1');
        assert(RegAOut = "00111010");


        -- Testing: ROR on inputs ra = 7 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010001110111";
        RegIn <= "01111010";
        wait until (clock = '1');
        assert(RegAOut = "10011001");


        -- Testing: DEC on inputs ra = 11 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001010010111010";
        RegIn <= "00010100";
        wait until (clock = '1');
        assert(RegAOut = "10100101");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "11010011";
        wait until (clock = '1');
        assert(RegAOut = "00010001");
        IR <= "1001011000010000";
        RegIn <= "11110100";
        wait until (clock = '1');
        assert(RegAOut = "00000101");


        -- Testing: EOR on inputs ra = 1 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0010010000011000";
        RegIn <= "00101010";
        wait until (clock = '1');
        assert(RegAOut = "11001100");
        assert(RegBOut = "11101110");


        -- Testing: ASR on inputs ra = 16 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001010100000101";
        RegIn <= "11011110";
        wait until (clock = '1');
        assert(RegAOut = "10001001");


        -- Testing: ROR on inputs ra = 24 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001010110000111";
        RegIn <= "10110110";
        wait until (clock = '1');
        assert(RegAOut = "10111110");


        -- Testing: BLD on inputs ra = 31 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1111100111110000";
        RegIn <= "01011111";
        wait until (clock = '1');
        assert(RegAOut = "01011111");


        -- Testing: BCLR on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010101000";
        wait until (clock = '1');


        -- Testing: SBC on inputs ra = 13 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0000100011011001";
        RegIn <= "01101110";
        wait until (clock = '1');
        assert(RegAOut = "10110001");
        assert(RegBOut = "01101011");


        -- Testing: SBC on inputs ra = 28 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0000100111001000";
        RegIn <= "00101110";
        wait until (clock = '1');
        assert(RegAOut = "00011110");
        assert(RegBOut = "11101110");


        -- Testing: INC on inputs ra = 26 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010110100011";
        RegIn <= "01110011";
        wait until (clock = '1');
        assert(RegAOut = "11010011");


        -- Testing: CP on inputs ra = 17 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0001010100010001";
        RegIn <= "11010011";
        wait until (clock = '1');
        assert(RegAOut = "11101111");
        assert(RegBOut = "00101010");


        -- Testing: CPC on inputs ra = 10 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0000010010100111";
        RegIn <= "00010101";
        wait until (clock = '1');
        assert(RegAOut = "10011000");
        assert(RegBOut = "01111010");


        -- Testing: CPI on inputs ra = 29 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0011000011010000";
        RegIn <= "01000100";
        wait until (clock = '1');
        assert(RegAOut = "11110000");


        -- Testing: NEG on inputs ra = 12 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001010011000001";
        RegIn <= "00000010";
        wait until (clock = '1');
        assert(RegAOut = "01000111");


        -- Testing: ADD on inputs ra = 16 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0000110100000111";
        RegIn <= "00011111";
        wait until (clock = '1');
        assert(RegAOut = "11011110");
        assert(RegBOut = "01111010");


        -- Testing: COM on inputs ra = 19 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010100110000";
        RegIn <= "01101010";
        wait until (clock = '1');
        assert(RegAOut = "01001000");


        -- Testing: CPC on inputs ra = 0 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0000011000001101";
        RegIn <= "11000111";
        wait until (clock = '1');
        assert(RegAOut = "01110101");
        assert(RegBOut = "11110000");


        -- Testing: SUB on inputs ra = 24 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0001101110001010";
        RegIn <= "10000010";
        wait until (clock = '1');
        assert(RegAOut = "10110110");
        assert(RegBOut = "01110011");


        -- Testing: BLD on inputs ra = 7 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1111100001110011";
        RegIn <= "11100001";
        wait until (clock = '1');
        assert(RegAOut = "11100001");


        -- Testing: BLD on inputs ra = 29 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1111100111010000";
        RegIn <= "11100010";
        wait until (clock = '1');
        assert(RegAOut = "11100010");


        -- Testing: BST on inputs ra = 29 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111101111011100";
        wait until (clock = '1');
        assert(RegAOut = "11100010");


        -- Testing: SBIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100100000";
        RegIn <= "01100101";
        wait until (clock = '1');
        assert(RegAOut = "00101110");
        IR <= "1001011100100000";
        RegIn <= "11001000";
        wait until (clock = '1');
        assert(RegAOut = "11100010");


        -- Testing: SBCI on inputs ra = 8 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0100000010000000";
        RegIn <= "01101100";
        wait until (clock = '1');
        assert(RegAOut = "10000010");


        -- Testing: CP on inputs ra = 4 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0001010001001011";
        RegIn <= "10111111";
        wait until (clock = '1');
        assert(RegAOut = "00111010");
        assert(RegBOut = "00010100");


        -- Testing: CPI on inputs ra = 13 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0011000011010000";
        RegIn <= "01111001";
        wait until (clock = '1');
        assert(RegAOut = "11001000");


        -- Testing: BLD on inputs ra = 10 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100010100001";
        RegIn <= "11011011";
        wait until (clock = '1');
        assert(RegAOut = "11011011");


        -- Testing: ANDI on inputs ra = 18 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0111000000100000";
        RegIn <= "01010100";
        wait until (clock = '1');
        assert(RegAOut = "11011000");


        -- Testing: BCLR on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010001000";
        wait until (clock = '1');


        -- Testing: DEC on inputs ra = 26 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010110101010";
        RegIn <= "10111101";
        wait until (clock = '1');
        assert(RegAOut = "01110011");


        -- Testing: ADD on inputs ra = 19 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0000110100110100";
        RegIn <= "10110111";
        wait until (clock = '1');
        assert(RegAOut = "01101010");
        assert(RegBOut = "00111010");


        -- Testing: ANDI on inputs ra = 19 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0111000000110000";
        RegIn <= "01011111";
        wait until (clock = '1');
        assert(RegAOut = "10110111");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "10111101");
        IR <= "1001011100010000";
        RegIn <= "11010000";
        wait until (clock = '1');
        assert(RegAOut = "11110100");


        -- Testing: SUBI on inputs ra = 21 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0101000001010000";
        RegIn <= "11001010";
        wait until (clock = '1');
        assert(RegAOut = "00000001");


        -- Testing: ADC on inputs ra = 1 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0001111000010000";
        RegIn <= "01101011";
        wait until (clock = '1');
        assert(RegAOut = "00101010");
        assert(RegBOut = "00011111");


        -- Testing: COM on inputs ra = 29 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010111010000";
        RegIn <= "10010101";
        wait until (clock = '1');
        assert(RegAOut = "11001000");


        -- Testing: ADD on inputs ra = 15 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0000110011111001";
        RegIn <= "10100000";
        wait until (clock = '1');
        assert(RegAOut = "01100101");
        assert(RegBOut = "01101011");


        -- Testing: SUBI on inputs ra = 23 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0101000001110000";
        RegIn <= "11110010";
        wait until (clock = '1');
        assert(RegAOut = "00110010");


        -- Testing: COM on inputs ra = 5 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001010001010000";
        RegIn <= "11001111";
        wait until (clock = '1');
        assert(RegAOut = "10001011");


        -- Testing: INC on inputs ra = 10 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1001010010100011";
        RegIn <= "01110011";
        wait until (clock = '1');
        assert(RegAOut = "11011011");


        -- Testing: SUB on inputs ra = 13 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0001101011011100";
        RegIn <= "01011110";
        wait until (clock = '1');
        assert(RegAOut = "01101110");
        assert(RegBOut = "01100101");


        -- Testing: ASR on inputs ra = 31 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1001010111110101";
        RegIn <= "11110000";
        wait until (clock = '1');
        assert(RegAOut = "01011111");


        -- Testing: ROR on inputs ra = 17 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001010100010111";
        RegIn <= "00110101";
        wait until (clock = '1');
        assert(RegAOut = "11101111");


        -- Testing: BSET on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000101000";
        wait until (clock = '1');


        -- Testing: INC on inputs ra = 0 and rb = 30 (only the ones that are used for the instruction).
        IR <= "1001010000000011";
        RegIn <= "01000001";
        wait until (clock = '1');
        assert(RegAOut = "01110101");


        -- Testing: BLD on inputs ra = 10 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100010100001";
        RegIn <= "10101111";
        wait until (clock = '1');
        assert(RegAOut = "10101111");


        -- Testing: NEG on inputs ra = 4 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001010001000001";
        RegIn <= "00011110";
        wait until (clock = '1');
        assert(RegAOut = "00111010");


        -- Testing: BLD on inputs ra = 19 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100100110001";
        RegIn <= "11010111";
        wait until (clock = '1');
        assert(RegAOut = "11010111");


        -- Testing: NEG on inputs ra = 28 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010111000001";
        RegIn <= "10010100";
        wait until (clock = '1');
        assert(RegAOut = "01100101");


        -- Testing: ANDI on inputs ra = 2 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0111000000100000";
        RegIn <= "00010001";
        wait until (clock = '1');
        assert(RegAOut = "01010100");


        -- Testing: BSET on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000001000";
        wait until (clock = '1');


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "10010010";
        wait until (clock = '1');
        assert(RegAOut = "10001011");
        IR <= "1001011000010000";
        RegIn <= "10000101";
        wait until (clock = '1');
        assert(RegAOut = "11010000");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "11101101";
        wait until (clock = '1');
        assert(RegAOut = "10010010");
        IR <= "1001011000010000";
        RegIn <= "10100000";
        wait until (clock = '1');
        assert(RegAOut = "10000101");


        -- Testing: COM on inputs ra = 1 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001010000010000";
        RegIn <= "11011110";
        wait until (clock = '1');
        assert(RegAOut = "01101011");


        -- Testing: CPC on inputs ra = 5 and rb = 12 (only the ones that are used for the instruction).
        IR <= "0000010001011100";
        RegIn <= "10100000";
        wait until (clock = '1');
        assert(RegAOut = "11001111");
        assert(RegBOut = "00000010");


        -- Testing: ORI on inputs ra = 18 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0110000000100000";
        RegIn <= "11011110";
        wait until (clock = '1');
        assert(RegAOut = "00010001");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "10000101";
        wait until (clock = '1');
        assert(RegAOut = "10010100");
        IR <= "1001011000100000";
        RegIn <= "00111111";
        wait until (clock = '1');
        assert(RegAOut = "10010101");


        -- Testing: SBCI on inputs ra = 11 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0100000010110000";
        RegIn <= "11001001";
        wait until (clock = '1');
        assert(RegAOut = "10100000");


        -- Testing: SBCI on inputs ra = 13 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0100000011010000";
        RegIn <= "00010110";
        wait until (clock = '1');
        assert(RegAOut = "00111111");


        -- Testing: BSET on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000011000";
        wait until (clock = '1');


        -- Testing: BSET on inputs ra = 7 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001111000";
        wait until (clock = '1');


        -- Testing: EOR on inputs ra = 22 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0010010101101001";
        RegIn <= "00110110";
        wait until (clock = '1');
        assert(RegAOut = "11110111");
        assert(RegBOut = "01101011");


        -- Testing: MUL on inputs ra = 17 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001110100011111";
        RegIn <= "10000111";
        wait until (clock = '1');
        assert(RegAOut = "00110101");
        assert(RegBOut = "10100000");
        IR <= "1001110100011111";
        RegIn <= "00111001";
        wait until (clock = '1');
        assert(RegAOut = "00110101");
        assert(RegBOut = "10100000");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "01100101";
        wait until (clock = '1');
        assert(RegAOut = "10000101");
        IR <= "1001011000100000";
        RegIn <= "11010000";
        wait until (clock = '1');
        assert(RegAOut = "00010110");


        -- Testing: MUL on inputs ra = 5 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001111001011100";
        RegIn <= "10110001";
        wait until (clock = '1');
        assert(RegAOut = "11001111");
        assert(RegBOut = "01100101");
        IR <= "1001111001011100";
        RegIn <= "01110010";
        wait until (clock = '1');
        assert(RegAOut = "11001111");
        assert(RegBOut = "01100101");


        -- Testing: MUL on inputs ra = 24 and rb = 22 (only the ones that are used for the instruction).
        IR <= "1001111110000110";
        RegIn <= "10011001";
        wait until (clock = '1');
        assert(RegAOut = "01101100");
        assert(RegBOut = "00110110");
        IR <= "1001111110000110";
        RegIn <= "11101000";
        wait until (clock = '1');
        assert(RegAOut = "01101100");
        assert(RegBOut = "00110110");


        -- Testing: LSR on inputs ra = 20 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001010101000110";
        RegIn <= "10000110";
        wait until (clock = '1');
        assert(RegAOut = "01010000");


        -- Testing: SWAP on inputs ra = 23 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010101110010";
        RegIn <= "00000001";
        wait until (clock = '1');
        assert(RegAOut = "11110010");


        -- Testing: COM on inputs ra = 3 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010000110000";
        RegIn <= "00100101";
        wait until (clock = '1');
        assert(RegAOut = "11101010");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "00101101";
        wait until (clock = '1');
        assert(RegAOut = "01100101");
        IR <= "1001011000100000";
        RegIn <= "01000010";
        wait until (clock = '1');
        assert(RegAOut = "11010000");


        -- Testing: COM on inputs ra = 24 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010110000000";
        RegIn <= "00000000";
        wait until (clock = '1');
        assert(RegAOut = "01101100");


        -- Testing: BLD on inputs ra = 18 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1111100100100111";
        RegIn <= "00101001";
        wait until (clock = '1');
        assert(RegAOut = "00101001");


        -- Testing: SBC on inputs ra = 6 and rb = 23 (only the ones that are used for the instruction).
        IR <= "0000101001100111";
        RegIn <= "10111001";
        wait until (clock = '1');
        assert(RegAOut = "01001110");
        assert(RegBOut = "00000001");


        -- Testing: BSET on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001001000";
        wait until (clock = '1');


        -- Testing: BST on inputs ra = 30 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1111101111101010";
        wait until (clock = '1');
        assert(RegAOut = "01101100");


        -- Testing: INC on inputs ra = 7 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001010001110011";
        RegIn <= "11010001";
        wait until (clock = '1');
        assert(RegAOut = "11100001");


        -- Testing: ORI on inputs ra = 2 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0110000000100000";
        RegIn <= "01111101";
        wait until (clock = '1');
        assert(RegAOut = "00101001");


        -- Testing: ROR on inputs ra = 19 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010100110111";
        RegIn <= "00000000";
        wait until (clock = '1');
        assert(RegAOut = "11010111");


        -- Testing: EOR on inputs ra = 29 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0010010111011001";
        RegIn <= "00110001";
        wait until (clock = '1');
        assert(RegAOut = "01000010");
        assert(RegBOut = "01101011");


        -- Testing: ROR on inputs ra = 11 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001010010110111";
        RegIn <= "00111011";
        wait until (clock = '1');
        assert(RegAOut = "00010100");


        -- Testing: ORI on inputs ra = 22 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0110000001100000";
        RegIn <= "10011111";
        wait until (clock = '1');
        assert(RegAOut = "00110110");


        -- Testing: EOR on inputs ra = 8 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0010010010000110";
        RegIn <= "01111000";
        wait until (clock = '1');
        assert(RegAOut = "11101110");
        assert(RegBOut = "10111001");


        -- Testing: CP on inputs ra = 2 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0001010000101000";
        RegIn <= "00000011";
        wait until (clock = '1');
        assert(RegAOut = "10001101");
        assert(RegBOut = "01111000");


        -- Testing: SUB on inputs ra = 28 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0001100111001000";
        RegIn <= "01011110";
        wait until (clock = '1');
        assert(RegAOut = "00101101");
        assert(RegBOut = "01111000");


        -- Testing: SBIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100000000";
        RegIn <= "00101101";
        wait until (clock = '1');
        assert(RegAOut = "00000000");
        IR <= "1001011100000000";
        RegIn <= "10101000";
        wait until (clock = '1');
        assert(RegAOut = "11111100");


        -- Testing: ASR on inputs ra = 10 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010010100101";
        RegIn <= "00101110";
        wait until (clock = '1');
        assert(RegAOut = "10101111");


        -- Testing: ROR on inputs ra = 13 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1001010011010111";
        RegIn <= "00100100";
        wait until (clock = '1');
        assert(RegAOut = "01011110");


        -- Testing: OR on inputs ra = 11 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0010100010111011";
        RegIn <= "00011100";
        wait until (clock = '1');
        assert(RegAOut = "00111011");
        assert(RegBOut = "00111011");


        -- Testing: SUB on inputs ra = 18 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0001101100100010";
        RegIn <= "11011010";
        wait until (clock = '1');
        assert(RegAOut = "01111101");
        assert(RegBOut = "01111101");


        -- Testing: SBC on inputs ra = 7 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0000101001110011";
        RegIn <= "10111001";
        wait until (clock = '1');
        assert(RegAOut = "11010001");
        assert(RegBOut = "00000000");


        -- Testing: INC on inputs ra = 15 and rb = 14 (only the ones that are used for the instruction).
        IR <= "1001010011110011";
        RegIn <= "01001011";
        wait until (clock = '1');
        assert(RegAOut = "10100000");


        -- Testing: ADC on inputs ra = 20 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0001111101001001";
        RegIn <= "01000000";
        wait until (clock = '1');
        assert(RegAOut = "10000110");
        assert(RegBOut = "10101000");


        -- Testing: SWAP on inputs ra = 5 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010001010010";
        RegIn <= "10001001";
        wait until (clock = '1');
        assert(RegAOut = "11001111");


        -- Testing: SWAP on inputs ra = 31 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001010111110010";
        RegIn <= "10111101";
        wait until (clock = '1');
        assert(RegAOut = "11110000");


        -- Testing: BST on inputs ra = 11 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1111101010110011";
        wait until (clock = '1');
        assert(RegAOut = "00011100");


        -- Testing: CPI on inputs ra = 19 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0011000000110000";
        RegIn <= "01001100";
        wait until (clock = '1');
        assert(RegAOut = "00000000");


        -- Testing: BCLR on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011001000";
        wait until (clock = '1');


        -- Testing: CP on inputs ra = 9 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0001011010010001";
        RegIn <= "10011101";
        wait until (clock = '1');
        assert(RegAOut = "01101011");
        assert(RegBOut = "00110101");


        -- Testing: CPC on inputs ra = 10 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0000011010101100";
        RegIn <= "01111000";
        wait until (clock = '1');
        assert(RegAOut = "00101110");
        assert(RegBOut = "01011110");


        -- Testing: COM on inputs ra = 5 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1001010001010000";
        RegIn <= "00100001";
        wait until (clock = '1');
        assert(RegAOut = "10001001");


        -- Testing: SWAP on inputs ra = 29 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001010111010010";
        RegIn <= "10000100";
        wait until (clock = '1');
        assert(RegAOut = "00110001");


        -- Testing: DEC on inputs ra = 17 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010100011010";
        RegIn <= "01000001";
        wait until (clock = '1');
        assert(RegAOut = "00110101");


        -- Testing: ADC on inputs ra = 20 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0001111101001000";
        RegIn <= "10111010";
        wait until (clock = '1');
        assert(RegAOut = "01000000");
        assert(RegBOut = "00101101");


        -- Testing: INC on inputs ra = 29 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010111010011";
        RegIn <= "01101001";
        wait until (clock = '1');
        assert(RegAOut = "10000100");


        -- Testing: SBC on inputs ra = 0 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0000101000000110";
        RegIn <= "01111000";
        wait until (clock = '1');
        assert(RegAOut = "10011001");
        assert(RegBOut = "10011111");


        -- Testing: ORI on inputs ra = 29 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0110000011010000";
        RegIn <= "10001011";
        wait until (clock = '1');
        assert(RegAOut = "01101001");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "10010111";
        wait until (clock = '1');
        assert(RegAOut = "11101101");
        IR <= "1001011100010000";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "11001001");


        -- Testing: INC on inputs ra = 27 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010110110011";
        RegIn <= "10110011";
        wait until (clock = '1');
        assert(RegAOut = "00101000");


        -- Testing: ADC on inputs ra = 27 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0001110110110111";
        RegIn <= "00111010";
        wait until (clock = '1');
        assert(RegAOut = "10110011");
        assert(RegBOut = "10111001");


        -- Testing: CPC on inputs ra = 17 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0000011100010010";
        RegIn <= "01010001";
        wait until (clock = '1');
        assert(RegAOut = "01000001");
        assert(RegBOut = "11011010");


        -- Testing: ASR on inputs ra = 18 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1001010100100101";
        RegIn <= "00010010";
        wait until (clock = '1');
        assert(RegAOut = "11011010");


        -- Testing: ADC on inputs ra = 11 and rb = 12 (only the ones that are used for the instruction).
        IR <= "0001110010111100";
        RegIn <= "00010011";
        wait until (clock = '1');
        assert(RegAOut = "00011100");
        assert(RegBOut = "00000010");


        -- Testing: BLD on inputs ra = 20 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1111100101000101";
        RegIn <= "11100011";
        wait until (clock = '1');
        assert(RegAOut = "11100011");


        -- Testing: ADC on inputs ra = 30 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0001111111101110";
        RegIn <= "10100011";
        wait until (clock = '1');
        assert(RegAOut = "01101100");
        assert(RegBOut = "01101100");


        -- Testing: DEC on inputs ra = 21 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010101011010";
        RegIn <= "10101110";
        wait until (clock = '1');
        assert(RegAOut = "11001010");


        -- Testing: ADD on inputs ra = 28 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0000111111001101";
        RegIn <= "01000010";
        wait until (clock = '1');
        assert(RegAOut = "01011110");
        assert(RegBOut = "10001011");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "01100011";
        wait until (clock = '1');
        assert(RegAOut = "10010111");
        IR <= "1001011100010000";
        RegIn <= "10001010";
        wait until (clock = '1');
        assert(RegAOut = "00111010");


        -- Testing: BLD on inputs ra = 3 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1111100000110111";
        RegIn <= "01011011";
        wait until (clock = '1');
        assert(RegAOut = "01011011");


        -- Testing: OR on inputs ra = 23 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0010100101110100";
        RegIn <= "00001110";
        wait until (clock = '1');
        assert(RegAOut = "00000001");
        assert(RegBOut = "00011110");


        -- Testing: BCLR on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010101000";
        wait until (clock = '1');


        -- Testing: OR on inputs ra = 25 and rb = 23 (only the ones that are used for the instruction).
        IR <= "0010101110010111";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "10101000");
        assert(RegBOut = "00001110");


        -- Testing: SUB on inputs ra = 25 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0001101110011100";
        RegIn <= "10010011";
        wait until (clock = '1');
        assert(RegAOut = "00101000");
        assert(RegBOut = "01000010");


        -- Testing: AND on inputs ra = 30 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0010000111100110";
        RegIn <= "10100011";
        wait until (clock = '1');
        assert(RegAOut = "10100011");
        assert(RegBOut = "10111001");


        -- Testing: SWAP on inputs ra = 15 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001010011110010";
        RegIn <= "10011111";
        wait until (clock = '1');
        assert(RegAOut = "01001011");


        -- Testing: SUB on inputs ra = 31 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0001100111110110";
        RegIn <= "11011110";
        wait until (clock = '1');
        assert(RegAOut = "10111101");
        assert(RegBOut = "10111001");


        -- Testing: INC on inputs ra = 7 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010001110011";
        RegIn <= "01111110";
        wait until (clock = '1');
        assert(RegAOut = "10111001");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "00100001";
        wait until (clock = '1');
        assert(RegAOut = "01100011");
        IR <= "1001011100010000";
        RegIn <= "00001110";
        wait until (clock = '1');
        assert(RegAOut = "10001010");


        -- Testing: BCLR on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010011000";
        wait until (clock = '1');


        -- Testing: SBCI on inputs ra = 27 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0100000010110000";
        RegIn <= "00111001";
        wait until (clock = '1');
        assert(RegAOut = "00001110");


        -- Testing: SBIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100110000";
        RegIn <= "00111001";
        wait until (clock = '1');
        assert(RegAOut = "10100011");
        IR <= "1001011100110000";
        RegIn <= "11001101";
        wait until (clock = '1');
        assert(RegAOut = "11011110");


        -- Testing: BCLR on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010111000";
        wait until (clock = '1');


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "00100101";
        wait until (clock = '1');
        assert(RegAOut = "00100001");
        IR <= "1001011100010000";
        RegIn <= "10110011";
        wait until (clock = '1');
        assert(RegAOut = "00111001");


        -- Testing: SWAP on inputs ra = 5 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001010001010010";
        RegIn <= "01010011";
        wait until (clock = '1');
        assert(RegAOut = "00100001");


        -- Testing: CPI on inputs ra = 28 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0011000011000000";
        RegIn <= "11111100";
        wait until (clock = '1');
        assert(RegAOut = "01000010");


        -- Testing: BSET on inputs ra = 6 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001101000";
        wait until (clock = '1');


        -- Testing: LSR on inputs ra = 1 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1001010000010110";
        RegIn <= "00111011";
        wait until (clock = '1');
        assert(RegAOut = "11101000");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "11111110";
        wait until (clock = '1');
        assert(RegAOut = "00101101");
        IR <= "1001011000000000";
        RegIn <= "10100011";
        wait until (clock = '1');
        assert(RegAOut = "10010011");


        -- Testing: AND on inputs ra = 21 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0010001101010011";
        RegIn <= "00101000";
        wait until (clock = '1');
        assert(RegAOut = "10101110");
        assert(RegBOut = "00000000");


        -- Testing: CPC on inputs ra = 19 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0000010100110111";
        RegIn <= "11100011";
        wait until (clock = '1');
        assert(RegAOut = "00000000");
        assert(RegBOut = "01111110");


        -- Testing: COM on inputs ra = 22 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010101100000";
        RegIn <= "11110110";
        wait until (clock = '1');
        assert(RegAOut = "10011111");


        -- Testing: CPC on inputs ra = 19 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0000010100111101";
        RegIn <= "10000000";
        wait until (clock = '1');
        assert(RegAOut = "00000000");
        assert(RegBOut = "00100100");


        -- Testing: SBC on inputs ra = 11 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0000101010111100";
        RegIn <= "11001001";
        wait until (clock = '1');
        assert(RegAOut = "00010011");
        assert(RegBOut = "01000010");


        -- Testing: CPC on inputs ra = 0 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0000010000001110";
        RegIn <= "11000000";
        wait until (clock = '1');
        assert(RegAOut = "01111000");
        assert(RegBOut = "00111000");


        -- Testing: SWAP on inputs ra = 8 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010010000010";
        RegIn <= "10101000";
        wait until (clock = '1');
        assert(RegAOut = "01111000");


        -- Testing: COM on inputs ra = 0 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010000000000";
        RegIn <= "00001110";
        wait until (clock = '1');
        assert(RegAOut = "01111000");


        -- Testing: SUB on inputs ra = 3 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0001101000110000";
        RegIn <= "11111110";
        wait until (clock = '1');
        assert(RegAOut = "01011011");
        assert(RegBOut = "00011111");


        -- Testing: ROR on inputs ra = 27 and rb = 29 (only the ones that are used for the instruction).
        IR <= "1001010110110111";
        RegIn <= "01110110";
        wait until (clock = '1');
        assert(RegAOut = "10110011");


        -- Testing: CP on inputs ra = 23 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0001010101111000";
        RegIn <= "00011011";
        wait until (clock = '1');
        assert(RegAOut = "00001110");
        assert(RegBOut = "10101000");


        -- Testing: ADC on inputs ra = 30 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0001110111101011";
        RegIn <= "00101011";
        wait until (clock = '1');
        assert(RegAOut = "00111001");
        assert(RegBOut = "11001001");


        -- Testing: ADD on inputs ra = 2 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0000111000101101";
        RegIn <= "10110011";
        wait until (clock = '1');
        assert(RegAOut = "10001101");
        assert(RegBOut = "10001011");


        -- Testing: MUL on inputs ra = 24 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001111110000100";
        RegIn <= "00000010";
        wait until (clock = '1');
        assert(RegAOut = "11111110");
        assert(RegBOut = "11100011");
        IR <= "1001111110000100";
        RegIn <= "00100101";
        wait until (clock = '1');
        assert(RegAOut = "11111110");
        assert(RegBOut = "11100011");


        -- Testing: AND on inputs ra = 9 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0010001010011101";
        RegIn <= "10101000";
        wait until (clock = '1');
        assert(RegAOut = "01101011");
        assert(RegBOut = "10001011");


        -- Testing: SUB on inputs ra = 27 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0001101110110100";
        RegIn <= "11111001";
        wait until (clock = '1');
        assert(RegAOut = "01110110");
        assert(RegBOut = "11100011");


        -- Testing: ADC on inputs ra = 23 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0001111101110101";
        RegIn <= "01111101";
        wait until (clock = '1');
        assert(RegAOut = "00001110");
        assert(RegBOut = "00101000");


        -- Testing: SUB on inputs ra = 22 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0001100101100000";
        RegIn <= "11100100";
        wait until (clock = '1');
        assert(RegAOut = "11110110");
        assert(RegBOut = "00000010");


        -- Testing: DEC on inputs ra = 7 and rb = 27 (only the ones that are used for the instruction).
        IR <= "1001010001111010";
        RegIn <= "00001101";
        wait until (clock = '1');
        assert(RegAOut = "01111110");


        -- Testing: BSET on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000111000";
        wait until (clock = '1');


        -- Testing: CPI on inputs ra = 13 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0011000011010000";
        RegIn <= "00001101";
        wait until (clock = '1');
        assert(RegAOut = "10001011");


        -- Testing: SWAP on inputs ra = 2 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010000100010";
        RegIn <= "00000101";
        wait until (clock = '1');
        assert(RegAOut = "10110011");


        -- Testing: EOR on inputs ra = 17 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0010010100010001";
        RegIn <= "10000110";
        wait until (clock = '1');
        assert(RegAOut = "01000001");
        assert(RegBOut = "00100101");


        -- Testing: LSR on inputs ra = 4 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001010001000110";
        RegIn <= "01101100";
        wait until (clock = '1');
        assert(RegAOut = "00011110");


        -- Testing: BCLR on inputs ra = 7 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011111000";
        wait until (clock = '1');


        -- Testing: OR on inputs ra = 26 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0010100110100111";
        RegIn <= "01010000";
        wait until (clock = '1');
        assert(RegAOut = "00100101");
        assert(RegBOut = "00001101");


        -- Testing: CPC on inputs ra = 26 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0000011110101101";
        RegIn <= "10101111";
        wait until (clock = '1');
        assert(RegAOut = "01010000");
        assert(RegBOut = "10001011");


        -- Testing: SBC on inputs ra = 30 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0000101111101010";
        RegIn <= "00111011";
        wait until (clock = '1');
        assert(RegAOut = "00101011");
        assert(RegBOut = "01010000");


        -- Testing: BLD on inputs ra = 18 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111100100100100";
        RegIn <= "10001001";
        wait until (clock = '1');
        assert(RegAOut = "10001001");


        -- Testing: SUB on inputs ra = 11 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0001100010111110";
        RegIn <= "00111110";
        wait until (clock = '1');
        assert(RegAOut = "11001001");
        assert(RegBOut = "00111000");


        -- Testing: BST on inputs ra = 28 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1111101111000110";
        wait until (clock = '1');
        assert(RegAOut = "01000010");


        -- Testing: AND on inputs ra = 27 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0010001110111000";
        RegIn <= "11000100";
        wait until (clock = '1');
        assert(RegAOut = "11111001");
        assert(RegBOut = "11111110");


        -- Testing: BCLR on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010101000";
        wait until (clock = '1');


        -- Testing: NEG on inputs ra = 9 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1001010010010001";
        RegIn <= "01001001";
        wait until (clock = '1');
        assert(RegAOut = "10101000");


        -- Testing: ASR on inputs ra = 16 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001010100000101";
        RegIn <= "11000100";
        wait until (clock = '1');
        assert(RegAOut = "00011111");


        -- Testing: ORI on inputs ra = 19 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0110000000110000";
        RegIn <= "01110110";
        wait until (clock = '1');
        assert(RegAOut = "00000000");


        -- Testing: MUL on inputs ra = 12 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001111011000010";
        RegIn <= "00010011";
        wait until (clock = '1');
        assert(RegAOut = "00000010");
        assert(RegBOut = "10001001");
        IR <= "1001111011000010";
        RegIn <= "10100011";
        wait until (clock = '1');
        assert(RegAOut = "00000010");
        assert(RegBOut = "10001001");


        -- Testing: NEG on inputs ra = 6 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001010001100001";
        RegIn <= "00110111";
        wait until (clock = '1');
        assert(RegAOut = "10111001");


        -- Testing: NEG on inputs ra = 12 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010011000001";
        RegIn <= "10100000";
        wait until (clock = '1');
        assert(RegAOut = "00000010");


        -- Testing: ADIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000010000";
        RegIn <= "11111000";
        wait until (clock = '1');
        assert(RegAOut = "01010000");
        IR <= "1001011000010000";
        RegIn <= "11101100";
        wait until (clock = '1');
        assert(RegAOut = "11000100");


        -- Testing: BLD on inputs ra = 17 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1111100100010110";
        RegIn <= "01111101";
        wait until (clock = '1');
        assert(RegAOut = "01111101");


        -- Testing: SUBI on inputs ra = 23 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0101000001110000";
        RegIn <= "00100111";
        wait until (clock = '1');
        assert(RegAOut = "01111101");


        -- Testing: ADD on inputs ra = 19 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0000111100110101";
        RegIn <= "11100000";
        wait until (clock = '1');
        assert(RegAOut = "01110110");
        assert(RegBOut = "00101000");


        -- Testing: SBC on inputs ra = 28 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0000101111000000";
        RegIn <= "11100111";
        wait until (clock = '1');
        assert(RegAOut = "01000010");
        assert(RegBOut = "11000100");


        -- Testing: ROR on inputs ra = 30 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010111100111";
        RegIn <= "11111011";
        wait until (clock = '1');
        assert(RegAOut = "00111011");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "10000110";
        wait until (clock = '1');
        assert(RegAOut = "11100111");
        IR <= "1001011000100000";
        RegIn <= "00001100";
        wait until (clock = '1');
        assert(RegAOut = "10001011");


        -- Testing: EOR on inputs ra = 26 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0010011110101100";
        RegIn <= "01010001";
        wait until (clock = '1');
        assert(RegAOut = "11111000");
        assert(RegBOut = "10000110");


        -- Testing: CPI on inputs ra = 27 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0011000010110000";
        RegIn <= "00000101";
        wait until (clock = '1');
        assert(RegAOut = "11101100");


        -- Testing: ANDI on inputs ra = 29 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0111000011010000";
        RegIn <= "11101110";
        wait until (clock = '1');
        assert(RegAOut = "00001100");


        -- Testing: EOR on inputs ra = 15 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0010011011110101";
        RegIn <= "10100011";
        wait until (clock = '1');
        assert(RegAOut = "10011111");
        assert(RegBOut = "00101000");


        -- Testing: INC on inputs ra = 25 and rb = 31 (only the ones that are used for the instruction).
        IR <= "1001010110010011";
        RegIn <= "11101110";
        wait until (clock = '1');
        assert(RegAOut = "10100011");


        -- Testing: CPI on inputs ra = 2 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0011000000100000";
        RegIn <= "01110101";
        wait until (clock = '1');
        assert(RegAOut = "10001001");


        -- Testing: ADC on inputs ra = 21 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0001110101011001";
        RegIn <= "10011001";
        wait until (clock = '1');
        assert(RegAOut = "00101000");
        assert(RegBOut = "01001001");


        -- Testing: BSET on inputs ra = 7 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001111000";
        wait until (clock = '1');


        -- Testing: SWAP on inputs ra = 13 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010011010010";
        RegIn <= "00001101";
        wait until (clock = '1');
        assert(RegAOut = "00100100");


        -- Testing: SUBI on inputs ra = 28 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0101000011000000";
        RegIn <= "01010111";
        wait until (clock = '1');
        assert(RegAOut = "10000110");


        -- Testing: BCLR on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010111000";
        wait until (clock = '1');


        -- Testing: BLD on inputs ra = 5 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1111100001010010";
        RegIn <= "00100001";
        wait until (clock = '1');
        assert(RegAOut = "00100001");


        -- Testing: BSET on inputs ra = 6 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001101000";
        wait until (clock = '1');


        -- Testing: CPC on inputs ra = 23 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0000011101110101";
        RegIn <= "11101011";
        wait until (clock = '1');
        assert(RegAOut = "00100111");
        assert(RegBOut = "10011001");


        -- Testing: EOR on inputs ra = 16 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0010010100001101";
        RegIn <= "11110101";
        wait until (clock = '1');
        assert(RegAOut = "11000100");
        assert(RegBOut = "00001101");


        -- Testing: ADC on inputs ra = 8 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0001110010001101";
        RegIn <= "01100100";
        wait until (clock = '1');
        assert(RegAOut = "10101000");
        assert(RegBOut = "00001101");


        -- Testing: BCLR on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010011000";
        wait until (clock = '1');


        -- Testing: SUBI on inputs ra = 9 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0101000010010000";
        RegIn <= "01111000";
        wait until (clock = '1');
        assert(RegAOut = "11101110");


        -- Testing: NEG on inputs ra = 17 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010100010001";
        RegIn <= "10101110";
        wait until (clock = '1');
        assert(RegAOut = "01111101");


        -- Testing: EOR on inputs ra = 28 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0010011111000001";
        RegIn <= "01010100";
        wait until (clock = '1');
        assert(RegAOut = "01010111");
        assert(RegBOut = "10101110");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "10101101";
        wait until (clock = '1');
        assert(RegAOut = "01010001");
        IR <= "1001011100010000";
        RegIn <= "10100111";
        wait until (clock = '1');
        assert(RegAOut = "11101100");


        -- Testing: SBCI on inputs ra = 12 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0100000011000000";
        RegIn <= "00110111";
        wait until (clock = '1');
        assert(RegAOut = "01010100");


        -- Testing: NEG on inputs ra = 18 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010100100001";
        RegIn <= "11110011";
        wait until (clock = '1');
        assert(RegAOut = "10001001");


        -- Testing: COM on inputs ra = 23 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001010101110000";
        RegIn <= "11110101";
        wait until (clock = '1');
        assert(RegAOut = "00100111");


        -- Testing: NEG on inputs ra = 22 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010101100001";
        RegIn <= "01001101";
        wait until (clock = '1');
        assert(RegAOut = "11100100");


        -- Testing: SBC on inputs ra = 14 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0000101011101000";
        RegIn <= "10101110";
        wait until (clock = '1');
        assert(RegAOut = "00111000");
        assert(RegBOut = "11111110");


        -- Testing: BSET on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000001000";
        wait until (clock = '1');


        -- Testing: ADC on inputs ra = 16 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0001110100001000";
        RegIn <= "10010110";
        wait until (clock = '1');
        assert(RegAOut = "11110101");
        assert(RegBOut = "01100100");


        -- Testing: SBCI on inputs ra = 1 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0100000000010000";
        RegIn <= "10011001";
        wait until (clock = '1');
        assert(RegAOut = "10101110");


        -- Testing: INC on inputs ra = 0 and rb = 18 (only the ones that are used for the instruction).
        IR <= "1001010000000011";
        RegIn <= "11000101";
        wait until (clock = '1');
        assert(RegAOut = "00010011");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "01011101";
        wait until (clock = '1');
        assert(RegAOut = "10101101");
        IR <= "1001011100010000";
        RegIn <= "10100110";
        wait until (clock = '1');
        assert(RegAOut = "10100111");


        -- Testing: ADD on inputs ra = 21 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0000111101010001";
        RegIn <= "00110100";
        wait until (clock = '1');
        assert(RegAOut = "10011001");
        assert(RegBOut = "10011001");


        -- Testing: ANDI on inputs ra = 7 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0111000001110000";
        RegIn <= "01101010";
        wait until (clock = '1');
        assert(RegAOut = "11110101");


        -- Testing: SWAP on inputs ra = 7 and rb = 28 (only the ones that are used for the instruction).
        IR <= "1001010001110010";
        RegIn <= "01010000";
        wait until (clock = '1');
        assert(RegAOut = "00001101");


        -- Testing: OR on inputs ra = 4 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0010101001001111";
        RegIn <= "11111100";
        wait until (clock = '1');
        assert(RegAOut = "01101100");
        assert(RegBOut = "11001101");


        -- Testing: SUB on inputs ra = 30 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0001101111101100";
        RegIn <= "01100011";
        wait until (clock = '1');
        assert(RegAOut = "11111011");
        assert(RegBOut = "00110111");


        -- Testing: ADIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000110000";
        RegIn <= "10111101";
        wait until (clock = '1');
        assert(RegAOut = "01100011");
        IR <= "1001011000110000";
        RegIn <= "01000001";
        wait until (clock = '1');
        assert(RegAOut = "11001101");


        -- Testing: SUBI on inputs ra = 18 and rb = 25 (only the ones that are used for the instruction).
        IR <= "0101000000100000";
        RegIn <= "01100100";
        wait until (clock = '1');
        assert(RegAOut = "11110011");


        -- Testing: MUL on inputs ra = 25 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001110110011111";
        RegIn <= "01011110";
        wait until (clock = '1');
        assert(RegAOut = "01111000");
        assert(RegBOut = "10100011");
        IR <= "1001110110011111";
        RegIn <= "10010001";
        wait until (clock = '1');
        assert(RegAOut = "01111000");
        assert(RegBOut = "10100011");


        -- Testing: BCLR on inputs ra = 4 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011001000";
        wait until (clock = '1');


        -- Testing: BCLR on inputs ra = 5 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010011011000";
        wait until (clock = '1');


        -- Testing: MUL on inputs ra = 0 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001111000001000";
        RegIn <= "10010101";
        wait until (clock = '1');
        assert(RegAOut = "01011110");
        assert(RegBOut = "11111110");
        IR <= "1001111000001000";
        RegIn <= "11000001";
        wait until (clock = '1');
        assert(RegAOut = "10010101");
        assert(RegBOut = "11111110");


        -- Testing: ANDI on inputs ra = 2 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0111000000100000";
        RegIn <= "11101011";
        wait until (clock = '1');
        assert(RegAOut = "01100100");


        -- Testing: ROR on inputs ra = 3 and rb = 26 (only the ones that are used for the instruction).
        IR <= "1001010000110111";
        RegIn <= "01000000";
        wait until (clock = '1');
        assert(RegAOut = "11111110");


        -- Testing: SBCI on inputs ra = 21 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0100000001010000";
        RegIn <= "00000101";
        wait until (clock = '1');
        assert(RegAOut = "00110100");


        -- Testing: BCLR on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010011000";
        wait until (clock = '1');


        -- Testing: ADC on inputs ra = 24 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0001111110001110";
        RegIn <= "00101101";
        wait until (clock = '1');
        assert(RegAOut = "11111110");
        assert(RegBOut = "10111101");


        -- Testing: ORI on inputs ra = 30 and rb = 4 (only the ones that are used for the instruction).
        IR <= "0110000011100000";
        RegIn <= "00010110";
        wait until (clock = '1');
        assert(RegAOut = "10111101");


        -- Testing: DEC on inputs ra = 8 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010010001010";
        RegIn <= "11100001";
        wait until (clock = '1');
        assert(RegAOut = "01100100");


        -- Testing: ORI on inputs ra = 12 and rb = 12 (only the ones that are used for the instruction).
        IR <= "0110000011000000";
        RegIn <= "00000110";
        wait until (clock = '1');
        assert(RegAOut = "00110111");


        -- Testing: DEC on inputs ra = 11 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010010111010";
        RegIn <= "00100000";
        wait until (clock = '1');
        assert(RegAOut = "00111110");


        -- Testing: SUBI on inputs ra = 12 and rb = 3 (only the ones that are used for the instruction).
        IR <= "0101000011000000";
        RegIn <= "11111100";
        wait until (clock = '1');
        assert(RegAOut = "00000110");


        -- Testing: NEG on inputs ra = 8 and rb = 26 (only the ones that are used for the instruction).
        IR <= "1001010010000001";
        RegIn <= "11110000";
        wait until (clock = '1');
        assert(RegAOut = "11100001");


        -- Testing: ROR on inputs ra = 6 and rb = 13 (only the ones that are used for the instruction).
        IR <= "1001010001100111";
        RegIn <= "01101110";
        wait until (clock = '1');
        assert(RegAOut = "00110111");


        -- Testing: SWAP on inputs ra = 10 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010100010";
        RegIn <= "11011000";
        wait until (clock = '1');
        assert(RegAOut = "00101110");


        -- Testing: ROR on inputs ra = 10 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010010100111";
        RegIn <= "10010110";
        wait until (clock = '1');
        assert(RegAOut = "11011000");


        -- Testing: MUL on inputs ra = 2 and rb = 11 (only the ones that are used for the instruction).
        IR <= "1001110000101011";
        RegIn <= "01100111";
        wait until (clock = '1');
        assert(RegAOut = "00000101");
        assert(RegBOut = "00100000");
        IR <= "1001110000101011";
        RegIn <= "00011110";
        wait until (clock = '1');
        assert(RegAOut = "00000101");
        assert(RegBOut = "00100000");


        -- Testing: OR on inputs ra = 10 and rb = 20 (only the ones that are used for the instruction).
        IR <= "0010101010100100";
        RegIn <= "11010101";
        wait until (clock = '1');
        assert(RegAOut = "10010110");
        assert(RegBOut = "11100011");


        -- Testing: EOR on inputs ra = 31 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0010010111111011";
        RegIn <= "00101010";
        wait until (clock = '1');
        assert(RegAOut = "01000001");
        assert(RegBOut = "00100000");


        -- Testing: ADC on inputs ra = 6 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0001110001101010";
        RegIn <= "00101111";
        wait until (clock = '1');
        assert(RegAOut = "01101110");
        assert(RegBOut = "11010101");


        -- Testing: ANDI on inputs ra = 23 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0111000001110000";
        RegIn <= "01111010";
        wait until (clock = '1');
        assert(RegAOut = "01101010");


        -- Testing: SUB on inputs ra = 10 and rb = 31 (only the ones that are used for the instruction).
        IR <= "0001101010101111";
        RegIn <= "01110000";
        wait until (clock = '1');
        assert(RegAOut = "11010101");
        assert(RegBOut = "00101010");


        -- Testing: CPC on inputs ra = 31 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0000010111111101";
        RegIn <= "11000100";
        wait until (clock = '1');
        assert(RegAOut = "00101010");
        assert(RegBOut = "00001101");


        -- Testing: ORI on inputs ra = 28 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0110000011000000";
        RegIn <= "00111010";
        wait until (clock = '1');
        assert(RegAOut = "11111100");


        -- Testing: BCLR on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010010011000";
        wait until (clock = '1');


        -- Testing: ORI on inputs ra = 24 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0110000010000000";
        RegIn <= "01100000";
        wait until (clock = '1');
        assert(RegAOut = "00101101");


        -- Testing: SBC on inputs ra = 23 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0000101101110011";
        RegIn <= "01100000";
        wait until (clock = '1');
        assert(RegAOut = "01111010");
        assert(RegBOut = "11100000");


        -- Testing: COM on inputs ra = 12 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010011000000";
        RegIn <= "01101010";
        wait until (clock = '1');
        assert(RegAOut = "10100000");


        -- Testing: LSR on inputs ra = 7 and rb = 12 (only the ones that are used for the instruction).
        IR <= "1001010001110110";
        RegIn <= "11100011";
        wait until (clock = '1');
        assert(RegAOut = "01010000");


        -- Testing: OR on inputs ra = 27 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0010101110110101";
        RegIn <= "00010101";
        wait until (clock = '1');
        assert(RegAOut = "10100110");
        assert(RegBOut = "00000101");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "01101101";
        wait until (clock = '1');
        assert(RegAOut = "01100000");
        IR <= "1001011000000000";
        RegIn <= "11111101";
        wait until (clock = '1');
        assert(RegAOut = "01111000");


        -- Testing: ORI on inputs ra = 17 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0110000000010000";
        RegIn <= "10011100";
        wait until (clock = '1');
        assert(RegAOut = "10011001");


        -- Testing: OR on inputs ra = 17 and rb = 24 (only the ones that are used for the instruction).
        IR <= "0010101100011000";
        RegIn <= "10111110";
        wait until (clock = '1');
        assert(RegAOut = "10011100");
        assert(RegBOut = "01101101");


        -- Testing: SUB on inputs ra = 1 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0001101000010110";
        RegIn <= "10111000";
        wait until (clock = '1');
        assert(RegAOut = "00011110");
        assert(RegBOut = "01001101");


        -- Testing: SUB on inputs ra = 4 and rb = 17 (only the ones that are used for the instruction).
        IR <= "0001101001000001";
        RegIn <= "11011011";
        wait until (clock = '1');
        assert(RegAOut = "11111100");
        assert(RegBOut = "10111110");


        -- Testing: ANDI on inputs ra = 31 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0111000011110000";
        RegIn <= "01010001";
        wait until (clock = '1');
        assert(RegAOut = "00101010");


        -- Testing: ADC on inputs ra = 28 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0001111111000000";
        RegIn <= "01001000";
        wait until (clock = '1');
        assert(RegAOut = "00111010");
        assert(RegBOut = "10010110");


        -- Testing: BLD on inputs ra = 21 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1111100101010011";
        RegIn <= "01110011";
        wait until (clock = '1');
        assert(RegAOut = "01110011");


        -- Testing: SBC on inputs ra = 19 and rb = 12 (only the ones that are used for the instruction).
        IR <= "0000100100111100";
        RegIn <= "10011110";
        wait until (clock = '1');
        assert(RegAOut = "11100000");
        assert(RegBOut = "01101010");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "01100110";
        wait until (clock = '1');
        assert(RegAOut = "01011101");
        IR <= "1001011100010000";
        RegIn <= "00111101";
        wait until (clock = '1');
        assert(RegAOut = "00010101");


        -- Testing: CPI on inputs ra = 2 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0011000000100000";
        RegIn <= "11000011";
        wait until (clock = '1');
        assert(RegAOut = "11101011");


        -- Testing: EOR on inputs ra = 29 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0010010111010000";
        RegIn <= "00010001";
        wait until (clock = '1');
        assert(RegAOut = "11101110");
        assert(RegBOut = "01100111");


        -- Testing: BSET on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000101000";
        wait until (clock = '1');


        -- Testing: SWAP on inputs ra = 7 and rb = 15 (only the ones that are used for the instruction).
        IR <= "1001010001110010";
        RegIn <= "11011011";
        wait until (clock = '1');
        assert(RegAOut = "11100011");


        -- Testing: ROR on inputs ra = 14 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001010011100111";
        RegIn <= "00110001";
        wait until (clock = '1');
        assert(RegAOut = "10101110");


        -- Testing: BLD on inputs ra = 20 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1111100101000000";
        RegIn <= "11010001";
        wait until (clock = '1');
        assert(RegAOut = "11010001");


        -- Testing: SUBI on inputs ra = 28 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0101000011000000";
        RegIn <= "11101000";
        wait until (clock = '1');
        assert(RegAOut = "01001000");


        -- Testing: ANDI on inputs ra = 25 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0111000010010000";
        RegIn <= "01110001";
        wait until (clock = '1');
        assert(RegAOut = "11111101");


        -- Testing: BST on inputs ra = 7 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111101001110100";
        wait until (clock = '1');
        assert(RegAOut = "11011011");


        -- Testing: SBCI on inputs ra = 20 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0100000001000000";
        RegIn <= "11011101";
        wait until (clock = '1');
        assert(RegAOut = "11010001");


        -- Testing: SBCI on inputs ra = 16 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0100000000000000";
        RegIn <= "11000000";
        wait until (clock = '1');
        assert(RegAOut = "10010110");


        -- Testing: EOR on inputs ra = 3 and rb = 21 (only the ones that are used for the instruction).
        IR <= "0010011000110101";
        RegIn <= "11100010";
        wait until (clock = '1');
        assert(RegAOut = "01000000");
        assert(RegBOut = "01110011");


        -- Testing: SWAP on inputs ra = 25 and rb = 25 (only the ones that are used for the instruction).
        IR <= "1001010110010010";
        RegIn <= "00111111";
        wait until (clock = '1');
        assert(RegAOut = "01110001");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "11100000";
        wait until (clock = '1');
        assert(RegAOut = "01100110");
        IR <= "1001011100010000";
        RegIn <= "10010111";
        wait until (clock = '1');
        assert(RegAOut = "00111101");


        -- Testing: BSET on inputs ra = 5 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001011000";
        wait until (clock = '1');


        -- Testing: BSET on inputs ra = 6 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001101000";
        wait until (clock = '1');


        -- Testing: ADC on inputs ra = 29 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0001111111011110";
        RegIn <= "01100001";
        wait until (clock = '1');
        assert(RegAOut = "00010001");
        assert(RegBOut = "00010110");


        -- Testing: ADC on inputs ra = 0 and rb = 29 (only the ones that are used for the instruction).
        IR <= "0001111000001101";
        RegIn <= "10000110";
        wait until (clock = '1');
        assert(RegAOut = "01100111");
        assert(RegBOut = "01100001");


        -- Testing: BSET on inputs ra = 6 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001101000";
        wait until (clock = '1');


        -- Testing: SBC on inputs ra = 26 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0000100110100001";
        RegIn <= "00101010";
        wait until (clock = '1');
        assert(RegAOut = "11100000");
        assert(RegBOut = "10111000");


        -- Testing: COM on inputs ra = 27 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010110110000";
        RegIn <= "00111011";
        wait until (clock = '1');
        assert(RegAOut = "10010111");


        -- Testing: ROR on inputs ra = 24 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001010110000111";
        RegIn <= "10001010";
        wait until (clock = '1');
        assert(RegAOut = "01101101");


        -- Testing: SWAP on inputs ra = 28 and rb = 22 (only the ones that are used for the instruction).
        IR <= "1001010111000010";
        RegIn <= "10111010";
        wait until (clock = '1');
        assert(RegAOut = "11101000");


        -- Testing: OR on inputs ra = 28 and rb = 6 (only the ones that are used for the instruction).
        IR <= "0010100111000110";
        RegIn <= "01111011";
        wait until (clock = '1');
        assert(RegAOut = "10111010");
        assert(RegBOut = "00101111");


        -- Testing: ADIW on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000000000";
        RegIn <= "00011001";
        wait until (clock = '1');
        assert(RegAOut = "10001010");
        IR <= "1001011000000000";
        RegIn <= "11100110";
        wait until (clock = '1');
        assert(RegAOut = "00111111");


        -- Testing: MUL on inputs ra = 18 and rb = 6 (only the ones that are used for the instruction).
        IR <= "1001110100100110";
        RegIn <= "10010000";
        wait until (clock = '1');
        assert(RegAOut = "11101011");
        assert(RegBOut = "00101111");
        IR <= "1001110100100110";
        RegIn <= "11110000";
        wait until (clock = '1');
        assert(RegAOut = "11101011");
        assert(RegBOut = "00101111");


        -- Testing: ADIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011000100000";
        RegIn <= "01001100";
        wait until (clock = '1');
        assert(RegAOut = "01111011");
        IR <= "1001011000100000";
        RegIn <= "11110100";
        wait until (clock = '1');
        assert(RegAOut = "01100001");


        -- Testing: ADC on inputs ra = 13 and rb = 10 (only the ones that are used for the instruction).
        IR <= "0001110011011010";
        RegIn <= "00110010";
        wait until (clock = '1');
        assert(RegAOut = "00001101");
        assert(RegBOut = "01110000");


        -- Testing: ADD on inputs ra = 13 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0000110011011001";
        RegIn <= "10011110";
        wait until (clock = '1');
        assert(RegAOut = "00110010");
        assert(RegBOut = "01001001");


        -- Testing: ORI on inputs ra = 17 and rb = 15 (only the ones that are used for the instruction).
        IR <= "0110000000010000";
        RegIn <= "00111000";
        wait until (clock = '1');
        assert(RegAOut = "10111110");


        -- Testing: CPC on inputs ra = 15 and rb = 12 (only the ones that are used for the instruction).
        IR <= "0000010011111100";
        RegIn <= "11111001";
        wait until (clock = '1');
        assert(RegAOut = "10100011");
        assert(RegBOut = "01101010");


        -- Testing: ASR on inputs ra = 25 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001010110010101";
        RegIn <= "01110001";
        wait until (clock = '1');
        assert(RegAOut = "11100110");


        -- Testing: BSET on inputs ra = 7 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010001111000";
        wait until (clock = '1');


        -- Testing: SWAP on inputs ra = 25 and rb = 17 (only the ones that are used for the instruction).
        IR <= "1001010110010010";
        RegIn <= "01100001";
        wait until (clock = '1');
        assert(RegAOut = "01110001");


        -- Testing: BLD on inputs ra = 21 and rb = 4 (only the ones that are used for the instruction).
        IR <= "1111100101010100";
        RegIn <= "00101001";
        wait until (clock = '1');
        assert(RegAOut = "00101001");


        -- Testing: SBIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100110000";
        RegIn <= "10000101";
        wait until (clock = '1');
        assert(RegAOut = "00010110");
        IR <= "1001011100110000";
        RegIn <= "00111011";
        wait until (clock = '1');
        assert(RegAOut = "01010001");


        -- Testing: AND on inputs ra = 20 and rb = 9 (only the ones that are used for the instruction).
        IR <= "0010000101001001";
        RegIn <= "11001011";
        wait until (clock = '1');
        assert(RegAOut = "11011101");
        assert(RegBOut = "01001001");


        -- Testing: SBIW on inputs ra = 3 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100110000";
        RegIn <= "11110110";
        wait until (clock = '1');
        assert(RegAOut = "10000101");
        IR <= "1001011100110000";
        RegIn <= "11001010";
        wait until (clock = '1');
        assert(RegAOut = "00111011");


        -- Testing: ASR on inputs ra = 19 and rb = 3 (only the ones that are used for the instruction).
        IR <= "1001010100110101";
        RegIn <= "10011001";
        wait until (clock = '1');
        assert(RegAOut = "10011110");


        -- Testing: INC on inputs ra = 16 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1001010100000011";
        RegIn <= "00111110";
        wait until (clock = '1');
        assert(RegAOut = "11000000");


        -- Testing: AND on inputs ra = 25 and rb = 28 (only the ones that are used for the instruction).
        IR <= "0010001110011100";
        RegIn <= "01101101";
        wait until (clock = '1');
        assert(RegAOut = "01100001");
        assert(RegBOut = "01001100");


        -- Testing: ADD on inputs ra = 4 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0000110001000001";
        RegIn <= "01101010";
        wait until (clock = '1');
        assert(RegAOut = "11011011");
        assert(RegBOut = "11110000");


        -- Testing: ROR on inputs ra = 26 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010110100111";
        RegIn <= "00011110";
        wait until (clock = '1');
        assert(RegAOut = "00101010");


        -- Testing: AND on inputs ra = 8 and rb = 22 (only the ones that are used for the instruction).
        IR <= "0010001010000110";
        RegIn <= "01101010";
        wait until (clock = '1');
        assert(RegAOut = "11110000");
        assert(RegBOut = "01001101");


        -- Testing: CP on inputs ra = 24 and rb = 1 (only the ones that are used for the instruction).
        IR <= "0001010110000001";
        RegIn <= "10111011";
        wait until (clock = '1');
        assert(RegAOut = "00011001");
        assert(RegBOut = "11110000");


        -- Testing: DEC on inputs ra = 31 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010111111010";
        RegIn <= "11011111";
        wait until (clock = '1');
        assert(RegAOut = "11001010");


        -- Testing: AND on inputs ra = 24 and rb = 23 (only the ones that are used for the instruction).
        IR <= "0010001110000111";
        RegIn <= "00010111";
        wait until (clock = '1');
        assert(RegAOut = "00011001");
        assert(RegBOut = "01100000");


        -- Testing: AND on inputs ra = 17 and rb = 8 (only the ones that are used for the instruction).
        IR <= "0010000100011000";
        RegIn <= "01101101";
        wait until (clock = '1');
        assert(RegAOut = "00111000");
        assert(RegBOut = "01101010");


        -- Testing: CPC on inputs ra = 5 and rb = 12 (only the ones that are used for the instruction).
        IR <= "0000010001011100";
        RegIn <= "01000111";
        wait until (clock = '1');
        assert(RegAOut = "00100001");
        assert(RegBOut = "01101010");


        -- Testing: OR on inputs ra = 10 and rb = 11 (only the ones that are used for the instruction).
        IR <= "0010100010101011";
        RegIn <= "00111101";
        wait until (clock = '1');
        assert(RegAOut = "01110000");
        assert(RegBOut = "00100000");


        -- Testing: BSET on inputs ra = 0 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000001000";
        wait until (clock = '1');


        -- Testing: OR on inputs ra = 24 and rb = 16 (only the ones that are used for the instruction).
        IR <= "0010101110000000";
        RegIn <= "01111011";
        wait until (clock = '1');
        assert(RegAOut = "00010111");
        assert(RegBOut = "00111110");


        -- Testing: SWAP on inputs ra = 29 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1001010111010010";
        RegIn <= "11010111";
        wait until (clock = '1');
        assert(RegAOut = "11110100");


        -- Testing: SBIW on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100010000";
        RegIn <= "11110001";
        wait until (clock = '1');
        assert(RegAOut = "00011110");
        IR <= "1001011100010000";
        RegIn <= "00001111";
        wait until (clock = '1');
        assert(RegAOut = "00111011");


        -- Testing: SBIW on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001011100100000";
        RegIn <= "00101001";
        wait until (clock = '1');
        assert(RegAOut = "01001100");
        IR <= "1001011100100000";
        RegIn <= "00001011";
        wait until (clock = '1');
        assert(RegAOut = "11010111");


        -- Testing: CPC on inputs ra = 28 and rb = 23 (only the ones that are used for the instruction).
        IR <= "0000011111000111";
        RegIn <= "01101110";
        wait until (clock = '1');
        assert(RegAOut = "00101001");
        assert(RegBOut = "01100000");


        -- Testing: CPI on inputs ra = 0 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0011000000000000";
        RegIn <= "01001001";
        wait until (clock = '1');
        assert(RegAOut = "00111110");


        -- Testing: BLD on inputs ra = 2 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1111100000100000";
        RegIn <= "00011010";
        wait until (clock = '1');
        assert(RegAOut = "00011010");


        -- Testing: BLD on inputs ra = 9 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111100010010001";
        RegIn <= "10100001";
        wait until (clock = '1');
        assert(RegAOut = "10100001");


        -- Testing: ASR on inputs ra = 19 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010100110101";
        RegIn <= "00100111";
        wait until (clock = '1');
        assert(RegAOut = "10011001");


        -- Testing: ANDI on inputs ra = 1 and rb = 7 (only the ones that are used for the instruction).
        IR <= "0111000000010000";
        RegIn <= "00000000";
        wait until (clock = '1');
        assert(RegAOut = "01101101");


        -- Testing: BST on inputs ra = 1 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1111101000010010";
        wait until (clock = '1');
        assert(RegAOut = "11110000");


        -- Testing: COM on inputs ra = 23 and rb = 8 (only the ones that are used for the instruction).
        IR <= "1001010101110000";
        RegIn <= "00100110";
        wait until (clock = '1');
        assert(RegAOut = "01100000");


        -- Testing: SWAP on inputs ra = 24 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010110000010";
        RegIn <= "01001101";
        wait until (clock = '1');
        assert(RegAOut = "01111011");


        -- Testing: INC on inputs ra = 6 and rb = 7 (only the ones that are used for the instruction).
        IR <= "1001010001100011";
        RegIn <= "01001000";
        wait until (clock = '1');
        assert(RegAOut = "00101111");


        -- Testing: SBC on inputs ra = 20 and rb = 2 (only the ones that are used for the instruction).
        IR <= "0000100101000010";
        RegIn <= "11101010";
        wait until (clock = '1');
        assert(RegAOut = "11001011");
        assert(RegBOut = "00011010");


        -- Testing: CP on inputs ra = 14 and rb = 14 (only the ones that are used for the instruction).
        IR <= "0001010011101110";
        RegIn <= "00110101";
        wait until (clock = '1');
        assert(RegAOut = "00110001");
        assert(RegBOut = "00110001");


        -- Testing: NEG on inputs ra = 26 and rb = 10 (only the ones that are used for the instruction).
        IR <= "1001010110100001";
        RegIn <= "11000110";
        wait until (clock = '1');
        assert(RegAOut = "11110001");


        -- Testing: SBCI on inputs ra = 29 and rb = 19 (only the ones that are used for the instruction).
        IR <= "0100000011010000";
        RegIn <= "01101101";
        wait until (clock = '1');
        assert(RegAOut = "00001011");


        -- Testing: SBC on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0000100000010000";
        RegIn <= "00011011";
        wait until (clock = '1');
        assert(RegAOut = "11110000");
        assert(RegBOut = "10010000");


        -- Testing: INC on inputs ra = 22 and rb = 16 (only the ones that are used for the instruction).
        IR <= "1001010101100011";
        RegIn <= "00000001";
        wait until (clock = '1');
        assert(RegAOut = "01001101");


        -- Testing: INC on inputs ra = 23 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1001010101110011";
        RegIn <= "11110110";
        wait until (clock = '1');
        assert(RegAOut = "00100110");


        -- Testing: MUL on inputs ra = 14 and rb = 2 (only the ones that are used for the instruction).
        IR <= "1001110011100010";
        RegIn <= "00011001";
        wait until (clock = '1');
        assert(RegAOut = "00110001");
        assert(RegBOut = "00011010");
        IR <= "1001110011100010";
        RegIn <= "00101100";
        wait until (clock = '1');
        assert(RegAOut = "00110001");
        assert(RegBOut = "00011010");


        -- Testing: BLD on inputs ra = 11 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1111100010110101";
        RegIn <= "01010000";
        wait until (clock = '1');
        assert(RegAOut = "01010000");


        -- Testing: SUB on inputs ra = 17 and rb = 13 (only the ones that are used for the instruction).
        IR <= "0001100100011101";
        RegIn <= "00100000";
        wait until (clock = '1');
        assert(RegAOut = "00000000");
        assert(RegBOut = "10011110");


        -- Testing: ADC on inputs ra = 23 and rb = 26 (only the ones that are used for the instruction).
        IR <= "0001111101111010";
        RegIn <= "11111010";
        wait until (clock = '1');
        assert(RegAOut = "11110110");
        assert(RegBOut = "11000110");


        -- Testing: BSET on inputs ra = 1 and rb = 0 (only the ones that are used for the instruction).
        IR <= "1001010000011000";
        wait until (clock = '1');


        -- Testing: SUB on inputs ra = 28 and rb = 18 (only the ones that are used for the instruction).
        IR <= "0001101111000010";
        RegIn <= "10111110";
        wait until (clock = '1');
        assert(RegAOut = "00101001");
        assert(RegBOut = "11101011");


        -- Testing: CPC on inputs ra = 15 and rb = 30 (only the ones that are used for the instruction).
        IR <= "0000011011111110";
        RegIn <= "11001000";
        wait until (clock = '1');
        assert(RegAOut = "10100011");
        assert(RegBOut = "11110110");


        -- Testing: DEC on inputs ra = 3 and rb = 23 (only the ones that are used for the instruction).
        IR <= "1001010000111010";
        RegIn <= "11100010";
        wait until (clock = '1');
        assert(RegAOut = "11100010");


        -- Testing: SUB on inputs ra = 16 and rb = 0 (only the ones that are used for the instruction).
        IR <= "0001100100000000";
        RegIn <= "11110101";
        wait until (clock = '1');
        assert(RegAOut = "00111110");
        assert(RegBOut = "00011001");


        -- Testing: SWAP on inputs ra = 30 and rb = 20 (only the ones that are used for the instruction).
        IR <= "1001010111100010";
        RegIn <= "10100000";
        wait until (clock = '1');
        assert(RegAOut = "11110110");


        -- Testing: SUBI on inputs ra = 5 and rb = 27 (only the ones that are used for the instruction).
        IR <= "0101000001010000";
        RegIn <= "01111110";
        wait until (clock = '1');
        assert(RegAOut = "00101001");


        -- Testing: COM on inputs ra = 18 and rb = 27 (only the ones that are used for the instruction).
        IR <= "1001010100100000";
        RegIn <= "10100111";
        wait until (clock = '1');
        assert(RegAOut = "11101011");


        -- Testing: BST on inputs ra = 12 and rb = 1 (only the ones that are used for the instruction).
        IR <= "1111101011001001";
        wait until (clock = '1');
        assert(RegAOut = "01101010");


        -- Testing: ROR on inputs ra = 31 and rb = 24 (only the ones that are used for the instruction).
        IR <= "1001010111110111";
        RegIn <= "01010100";
        wait until (clock = '1');
        assert(RegAOut = "11011111");


        -- Testing: SWAP on inputs ra = 7 and rb = 19 (only the ones that are used for the instruction).
        IR <= "1001010001110010";
        RegIn <= "10000101";
        wait until (clock = '1');
        assert(RegAOut = "11011011");


        -- Testing: INC on inputs ra = 26 and rb = 9 (only the ones that are used for the instruction).
        IR <= "1001010110100011";
        RegIn <= "01111011";
        wait until (clock = '1');
        assert(RegAOut = "11000110");


        -- Testing: MUL on inputs ra = 11 and rb = 12 (only the ones that are used for the instruction).
        IR <= "1001110010111100";
        RegIn <= "10001110";
        wait until (clock = '1');
        assert(RegAOut = "01010000");
        assert(RegBOut = "01101010");
        IR <= "1001110010111100";
        RegIn <= "00100010";
        wait until (clock = '1');
        assert(RegAOut = "01010000");
        assert(RegBOut = "01101010");


        -- Testing: DEC on inputs ra = 5 and rb = 21 (only the ones that are used for the instruction).
        IR <= "1001010001011010";
        RegIn <= "10011000";
        wait until (clock = '1');
        assert(RegAOut = "00100001");


        -- Testing: BST on inputs ra = 25 and rb = 5 (only the ones that are used for the instruction).
        IR <= "1111101110011101";
        wait until (clock = '1');
        assert(RegAOut = "01101101");



        report "DONE WITH SIMULATIONS";

        END_SIM <= TRUE;    --end of stimulus events
        wait;               --wait for the simulation to end
    end process;
    
    -- Clock process definitions
    CLOCK_CLK : process
    begin
        -- this process generates a 20 ns period, 50% duty cycle clock
        -- only generate clock if still simulating
        if end_sim = false then
            clock <= '0';
            wait for 10 ns;
        else
            wait;
        end if;
  
        if end_sim = false then
            clock <= '1';
            wait for 10 ns;
        else
            wait;
        end if;
   end process;
end TB_ARCHITECTURE;





