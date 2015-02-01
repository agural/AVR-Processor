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


        -- Testing: CPC
        IR <= "0000011000111110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000011");
        assert(RegBOut = "00011110");
        RegIn <= "10000100";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111011000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001100");
        assert(RegBOut = "00010110");
        RegIn <= "10101110";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010000");
        RegIn <= "11110001";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100110111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011011");
        assert(RegBOut = "00001001");
        RegIn <= "11101011";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011100");
        RegIn <= "10011001";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011000");
        RegIn <= "00000110";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011001");
        RegIn <= "10110111";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011110");
        RegIn <= "00010010";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000110");
        RegIn <= "10111011";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011001101111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000110");
        assert(RegBOut = "00011111");
        RegIn <= "00000011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000110");
        RegIn <= "00100101";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110111");
        RegIn <= "00011111";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100101000100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010100");
        RegIn <= "10010110";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010001010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000101");
        RegIn <= "00010011";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100010011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001001");
        assert(RegBOut = "00001010");
        RegIn <= "00011100";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010011100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001110");
        RegIn <= "00100000";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110001");
        RegIn <= "01000000";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010101100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010110");
        RegIn <= "00010010";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111100100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010010");
        assert(RegBOut = "00010010");
        RegIn <= "10011110";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        RegIn <= "10101101";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010100000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000000");
        RegIn <= "00110010";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010001");
        RegIn <= "11110110";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101100011101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010001");
        assert(RegBOut = "00011101");
        RegIn <= "11100001";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        RegIn <= "10110000";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010110010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        assert(RegBOut = "00000010");
        RegIn <= "10111001";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011101");
        RegIn <= "00101100";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010111100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010010");
        RegIn <= "10011001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011100");
        assert(RegBOut = "00000000");
        RegIn <= "10110010";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111001110110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000111");
        assert(RegBOut = "00010010");
        RegIn <= "10111111";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010101100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010010");
        RegIn <= "00101101";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000011100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100000");
        assert(RegBOut = "00000110");
        RegIn <= "10000011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011010");
        RegIn <= "11111111";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101011");
        RegIn <= "01101001";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110000011101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000001");
        assert(RegBOut = "00001101");
        RegIn <= "11010001";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010111011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101100");
        RegIn <= "00010110";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100001001111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000100");
        assert(RegBOut = "00001111");
        RegIn <= "01001010";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100101");
        RegIn <= "00111001";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        RegIn <= "00101100";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010010110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001011");
        RegIn <= "00010010";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010100110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010011");
        RegIn <= "10011110";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111101000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010110");
        assert(RegBOut = "00010101");
        RegIn <= "11010100";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010101000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010100");
        RegIn <= "01011001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100101010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010101");
        RegIn <= "00100010";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011001");
        RegIn <= "11010011";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010011010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001101");
        RegIn <= "11010011";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110101010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100010");
        assert(RegBOut = "00000110");
        RegIn <= "11011001";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010010100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001010");
        RegIn <= "11000000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101001");
        RegIn <= "10000001";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110001001110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001010");
        assert(RegBOut = "10000011");
        RegIn <= "01011111";
        wait for 10 ns;
        IR <= "1001110001001110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001010");
        assert(RegBOut = "10000011");
        RegIn <= "01010000";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010101000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011001");
        RegIn <= "10001101";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010110110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000001");
        RegIn <= "00010101";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010110110110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010101");
        RegIn <= "10000010";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101110000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111001");
        assert(RegBOut = "00110010");
        RegIn <= "10010010";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011001");
        RegIn <= "01101001";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010010");
        RegIn <= "01101010";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010011");
        RegIn <= "11011001";
        wait for 10 ns;
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010110");
        RegIn <= "00010110";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010001111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111111");
        RegIn <= "11010100";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111111");
        RegIn <= "11010000";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010010000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001000");
        RegIn <= "11111010";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010110111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000010");
        RegIn <= "10101101";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010001000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001010");
        RegIn <= "01111001";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011100101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011110");
        assert(RegBOut = "10101101");
        RegIn <= "00100101";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011001011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010011");
        assert(RegBOut = "11011001");
        RegIn <= "11110100";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111100111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011110");
        assert(RegBOut = "10010010");
        RegIn <= "00101000";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010010110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010010");
        RegIn <= "11000101";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010110011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101100");
        RegIn <= "10010111";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101010101110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000000");
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010000");
        RegIn <= "01101000";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101101");
        RegIn <= "11010100";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010010100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000000");
        RegIn <= "00100101";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100001");
        RegIn <= "00010100";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100110111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010100");
        assert(RegBOut = "00100101");
        RegIn <= "10100101";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010010000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111010");
        RegIn <= "10001100";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100010011011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110010");
        assert(RegBOut = "11000101");
        RegIn <= "10000111";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101110");
        RegIn <= "11110001";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010111010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010110");
        RegIn <= "10010101";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010110110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100101");
        RegIn <= "11000000";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010010011000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000111");
        assert(RegBOut = "10001100");
        RegIn <= "10011010";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010001101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000110");
        RegIn <= "10110101";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011001");
        RegIn <= "11011001";
        wait for 10 ns;
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110000");
        RegIn <= "00100011";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010101010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101001");
        RegIn <= "00111000";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010100010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010100");
        RegIn <= "01101100";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010001100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110101");
        RegIn <= "01001110";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010100000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110010");
        RegIn <= "11111110";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101100");
        RegIn <= "11100010";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110001110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010100");
        assert(RegBOut = "11110100");
        RegIn <= "00111000";
        wait for 10 ns;
        IR <= "1001110001110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010100");
        assert(RegBOut = "11110100");
        RegIn <= "00101010";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010010010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000111");
        RegIn <= "10000010";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010110100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101000");
        RegIn <= "01111000";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011000110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000011");
        assert(RegBOut = "11100010");
        RegIn <= "00100110";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111000");
        RegIn <= "00111110";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000000");
        RegIn <= "01100010";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010101101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101101");
        RegIn <= "00110100";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010111");
        RegIn <= "00111111";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010111100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011001");
        RegIn <= "01101101";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010000110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000011");
        RegIn <= "00101000";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100111100101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101101");
        RegIn <= "11001011";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010000110110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        RegIn <= "01000001";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011001011011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110100");
        assert(RegBOut = "01100010");
        RegIn <= "00101000";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110010010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000010");
        assert(RegBOut = "11110100");
        RegIn <= "11100111";
        wait for 10 ns;
        IR <= "1001110010010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000010");
        assert(RegBOut = "11110100");
        RegIn <= "00101100";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101001100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001110");
        assert(RegBOut = "00110100");
        RegIn <= "00001000";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010100111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        assert(RegBOut = "10001100");
        RegIn <= "10001101";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001011");
        RegIn <= "01110001";
        wait for 10 ns;
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100011");
        RegIn <= "11111111";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010011000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110001");
        RegIn <= "10000111";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010100110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        RegIn <= "11010000";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        RegIn <= "11000010";
        wait for 10 ns;
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111111");
        RegIn <= "01000110";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011001");
        RegIn <= "00110000";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010101");
        RegIn <= "01111111";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111110");
        RegIn <= "01010100";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011100100101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011110");
        assert(RegBOut = "00111000");
        RegIn <= "10101010";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011010000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001100");
        assert(RegBOut = "11010000");
        RegIn <= "00001011";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010111000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110000");
        RegIn <= "11001010";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010111010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111111");
        RegIn <= "10001001";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001000011011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101100");
        assert(RegBOut = "01100010");
        RegIn <= "11111101";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010011110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001111");
        RegIn <= "11110110";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100010");
        RegIn <= "10011001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000010100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111110");
        RegIn <= "10100110";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101100110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010000");
        assert(RegBOut = "11010000");
        RegIn <= "00001011";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100010");
        RegIn <= "01011110";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110011000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000111");
        assert(RegBOut = "01000001");
        RegIn <= "01001100";
        wait for 10 ns;
        IR <= "1001110011000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000111");
        assert(RegBOut = "01000001");
        RegIn <= "01110011";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011001010100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110100");
        assert(RegBOut = "10001101");
        RegIn <= "00110001";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000010100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100110");
        RegIn <= "11001111";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010100000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010100");
        RegIn <= "00100111";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011110001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010010");
        assert(RegBOut = "10001001");
        RegIn <= "00010100";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010101000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001101");
        RegIn <= "00100111";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101000101100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        assert(RegBOut = "11001010");
        RegIn <= "10011100";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110110001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010010");
        assert(RegBOut = "11010011");
        RegIn <= "10001100";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100000000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001100");
        assert(RegBOut = "01000001");
        RegIn <= "01100100";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010001100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001000");
        assert(RegBOut = "11010100");
        RegIn <= "10010101";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100111");
        RegIn <= "10001101";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111011011001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010011");
        assert(RegBOut = "00111111");
        RegIn <= "11100111";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001010");
        RegIn <= "10110001";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001001");
        RegIn <= "10000000";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010010000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001011");
        assert(RegBOut = "01110011");
        RegIn <= "11101001";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010000010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110011");
        RegIn <= "11010101";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010001000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111001");
        RegIn <= "10011111";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011100");
        assert(RegBOut = "01100100");
        RegIn <= "00100110";
        wait for 10 ns;
        IR <= "1001110000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011100");
        assert(RegBOut = "00100110");
        RegIn <= "11111110";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100100010100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011110");
        RegIn <= "10010011";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100100111111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001011");
        assert(RegBOut = "11110110");
        RegIn <= "01110011";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001101");
        RegIn <= "10001010";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010111100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000010");
        RegIn <= "01101111";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010011110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110110");
        RegIn <= "10100001";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110001");
        RegIn <= "01100101";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000000");
        RegIn <= "00100111";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010101100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110100");
        assert(RegBOut = "11010100");
        RegIn <= "10101101";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000011100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101111");
        RegIn <= "10100110";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010010010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000010");
        RegIn <= "01101001";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001100");
        RegIn <= "01001101";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111111");
        RegIn <= "00000001";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010101110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010111");
        RegIn <= "11000110";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000111011000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100111");
        assert(RegBOut = "11101001");
        RegIn <= "10100110";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010010111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000101");
        assert(RegBOut = "11101001");
        RegIn <= "10000001";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111000101001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011100");
        assert(RegBOut = "00000001");
        RegIn <= "01010100";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011001110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010100");
        assert(RegBOut = "10010011");
        RegIn <= "00010111";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110110001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001101");
        assert(RegBOut = "11100111");
        RegIn <= "10010010";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101111011001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100110");
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111110110100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011001");
        assert(RegBOut = "00100111");
        RegIn <= "00011100";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100100000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001010");
        RegIn <= "11110101";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110101");
        RegIn <= "01101101";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000001000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100111");
        RegIn <= "10001011";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111001010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110001");
        assert(RegBOut = "10010011");
        RegIn <= "00001000";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001111");
        RegIn <= "11110111";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011100");
        RegIn <= "11101011";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110011111110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100001");
        assert(RegBOut = "10000011");
        RegIn <= "00111100";
        wait for 10 ns;
        IR <= "1001110011111110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100001");
        assert(RegBOut = "10000011");
        RegIn <= "01111011";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101011");
        RegIn <= "10001010";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110011110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100001");
        assert(RegBOut = "11010100");
        RegIn <= "01011100";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001000");
        RegIn <= "01001010";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010100101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011110");
        RegIn <= "01100001";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010001000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011111");
        RegIn <= "11000011";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000110");
        RegIn <= "01001010";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010011100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000011");
        RegIn <= "01101111";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100101");
        RegIn <= "11101111";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100110");
        RegIn <= "00010000";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110110111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001010");
        assert(RegBOut = "11101001");
        RegIn <= "10000001";
        wait for 10 ns;
        IR <= "1001110110111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001010");
        assert(RegBOut = "11101001");
        RegIn <= "01000011";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010010");
        RegIn <= "11110110";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110111100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101111");
        assert(RegBOut = "11010100");
        RegIn <= "10100001";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010010001010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101001");
        RegIn <= "01101100";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010001000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000011");
        RegIn <= "11011110";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110110");
        RegIn <= "00010000";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000001");
        RegIn <= "11111111";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010000110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000001");
        RegIn <= "11001111";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010100");
        RegIn <= "01011001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111010001111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101100");
        assert(RegBOut = "01000110");
        RegIn <= "01011101";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000011110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000110");
        RegIn <= "01001001";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010011100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101111");
        RegIn <= "00111100";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010111100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100001");
        RegIn <= "10011000";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100100101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100001");
        assert(RegBOut = "11100111");
        RegIn <= "00101011";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010101000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        RegIn <= "10111011";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011011110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011100");
        assert(RegBOut = "01110011");
        RegIn <= "11100010";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111111101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011000");
        assert(RegBOut = "00010000");
        RegIn <= "00011101";
        wait for 10 ns;
        IR <= "1001111111101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011000");
        assert(RegBOut = "00010000");
        RegIn <= "11011000";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111100111111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110011");
        assert(RegBOut = "01001001");
        RegIn <= "00000001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110100001011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101101");
        assert(RegBOut = "11000101");
        RegIn <= "00010110";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010000111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001111");
        RegIn <= "10000011";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111101011000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111000");
        assert(RegBOut = "00010000");
        RegIn <= "10011000";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000011001110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000111");
        assert(RegBOut = "00111100");
        RegIn <= "10001011";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101011101100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111100");
        assert(RegBOut = "11101111");
        RegIn <= "10111100";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010010100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100101");
        RegIn <= "00111101";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011101000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111011");
        assert(RegBOut = "10010011");
        RegIn <= "10010010";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110011111101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011100");
        assert(RegBOut = "11100111");
        RegIn <= "10110101";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010100000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010110");
        RegIn <= "01011110";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101000001100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011101");
        assert(RegBOut = "11101111");
        RegIn <= "10000000";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010000101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010100");
        assert(RegBOut = "11000101");
        RegIn <= "00010111";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111101100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110100");
        assert(RegBOut = "10010011");
        RegIn <= "00100001";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010111010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010000");
        RegIn <= "11101010";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100111100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011000");
        assert(RegBOut = "01010100");
        RegIn <= "10001101";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110010001100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011101");
        assert(RegBOut = "10001011");
        RegIn <= "10111000";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010110011110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111111");
        assert(RegBOut = "10111100");
        RegIn <= "10101111";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010111110110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001001");
        RegIn <= "10010100";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010111010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101010");
        RegIn <= "11100101";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010100000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011110");
        RegIn <= "01000110";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101100100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101011");
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101111");
        RegIn <= "00011101";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010000");
        RegIn <= "00000010";
        wait for 10 ns;
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111111");
        RegIn <= "01010101";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101111");
        RegIn <= "00001011";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000010010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101001");
        assert(RegBOut = "00001000");
        RegIn <= "00100011";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001010");
        RegIn <= "00110011";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011000");
        RegIn <= "01101000";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110111");
        RegIn <= "10110010";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001010");
        RegIn <= "00110010";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000010100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110010");
        RegIn <= "01011010";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101010011101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100011");
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100011");
        RegIn <= "00111010";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101100111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000001");
        assert(RegBOut = "00000010");
        RegIn <= "00001101";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110010");
        RegIn <= "10011010";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100001001000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011110");
        assert(RegBOut = "10111000");
        RegIn <= "10110010";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010101010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101000");
        assert(RegBOut = "00001000");
        RegIn <= "10100100";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010000110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000011");
        RegIn <= "11010110";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111000010100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011000");
        assert(RegBOut = "10111011");
        RegIn <= "10101001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100001000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110010");
        RegIn <= "00011000";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100011100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111100");
        RegIn <= "00011100";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010010100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111101");
        assert(RegBOut = "10000000");
        RegIn <= "11001111";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110101101111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100001");
        assert(RegBOut = "10110101");
        RegIn <= "01000101";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011010010111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111010");
        assert(RegBOut = "01001010");
        RegIn <= "10101000";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000011001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        assert(RegBOut = "11100111");
        RegIn <= "11101010";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010011010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100111");
        RegIn <= "01001110";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100001000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011000");
        RegIn <= "11111000";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010110000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        RegIn <= "11010101";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000000");
        RegIn <= "01001110";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010111111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010100");
        RegIn <= "11111100";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111100001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000110");
        assert(RegBOut = "11100101");
        RegIn <= "10111111";
        wait for 10 ns;
        IR <= "1001111100001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000110");
        assert(RegBOut = "11100101");
        RegIn <= "11101110";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000001000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111000");
        assert(RegBOut = "01001010");
        RegIn <= "11101001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100001110110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011001");
        RegIn <= "11101100";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101000101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010100");
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100100000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000110");
        assert(RegBOut = "00001000");
        RegIn <= "00110010";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000001000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111011");
        RegIn <= "00000010";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100011000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101010");
        RegIn <= "00000001";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010110000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010101");
        RegIn <= "10010000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101011");
        RegIn <= "00010110";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010010001010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111000");
        RegIn <= "00011100";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010101110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001010");
        RegIn <= "00110111";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101100101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010110");
        assert(RegBOut = "10011010");
        RegIn <= "11110010";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100101100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000101");
        RegIn <= "11101101";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010101110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110111");
        RegIn <= "11001010";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101000100100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010100");
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010111110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111100");
        RegIn <= "11100000";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101111001011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001011");
        assert(RegBOut = "10011010");
        RegIn <= "11011111";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100000");
        RegIn <= "11011101";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010110010100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010101");
        assert(RegBOut = "11101001");
        RegIn <= "00011011";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100001100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001000");
        assert(RegBOut = "11101110");
        RegIn <= "00011101";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100001011000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001010");
        assert(RegBOut = "00011100");
        RegIn <= "10111100";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101010111111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000101");
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101110010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010101");
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010000101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010100");
        RegIn <= "01110001";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001101");
        RegIn <= "00000001";
        wait for 10 ns;
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011101");
        RegIn <= "11011011";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110010");
        RegIn <= "00011010";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101111000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011111");
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101111101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000001");
        assert(RegBOut = "11100101");
        RegIn <= "10001101";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011111");
        RegIn <= "00000100";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100101");
        RegIn <= "01100111";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100111111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011011");
        assert(RegBOut = "10101000");
        RegIn <= "00011001";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010100010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010011");
        RegIn <= "11111000";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100010001000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011100");
        assert(RegBOut = "00011100");
        RegIn <= "01010001";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101000000100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111111");
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010100100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110010");
        RegIn <= "10010100";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010100001010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110010");
        RegIn <= "10000011";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011000110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010110");
        assert(RegBOut = "01101000");
        RegIn <= "01000001";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101111010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100111");
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010011111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110101");
        RegIn <= "00111000";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110010");
        RegIn <= "01011100";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011010");
        RegIn <= "11101111";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000001011001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111100");
        assert(RegBOut = "10101000");
        RegIn <= "11000100";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010111100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001101");
        RegIn <= "10011100";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000100");
        RegIn <= "01001011";
        wait for 10 ns;
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100111");
        RegIn <= "10111110";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000001100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101101");
        RegIn <= "10000111";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010010100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111101");
        RegIn <= "00110110";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101011001100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000001");
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010010110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000101");
        RegIn <= "00111101";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001101");
        RegIn <= "00001110";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010100100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010100");
        RegIn <= "11110100";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010011111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111000");
        RegIn <= "00011000";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111011111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011000");
        assert(RegBOut = "10010000");
        RegIn <= "00111111";
        wait for 10 ns;
        IR <= "1001111011111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011000");
        assert(RegBOut = "10010000");
        RegIn <= "01110100";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100011110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011000");
        assert(RegBOut = "01110001");
        RegIn <= "01010100";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010111110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011001");
        RegIn <= "00111001";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011101");
        RegIn <= "01100111";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010000");
        RegIn <= "11111110";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010101");
        RegIn <= "01110111";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101111");
        RegIn <= "10010011";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001010");
        RegIn <= "10110011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111110");
        RegIn <= "10000111";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110111");
        RegIn <= "10110110";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111000101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        assert(RegBOut = "10111110");
        RegIn <= "11100100";
        wait for 10 ns;
        IR <= "1001111000101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        assert(RegBOut = "10111110");
        RegIn <= "01010110";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011000011011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010110");
        assert(RegBOut = "10010011");
        RegIn <= "01101110";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010011000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000001");
        RegIn <= "11100111";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100111111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111001");
        assert(RegBOut = "10101000");
        RegIn <= "11001100";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001110");
        RegIn <= "10101001";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011100");
        RegIn <= "01001011";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010011");
        RegIn <= "01000001";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100100101000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110100");
        assert(RegBOut = "01010001");
        RegIn <= "00111111";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011101011000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101000");
        assert(RegBOut = "10000111");
        RegIn <= "10101110";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100100011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111000");
        assert(RegBOut = "00110110");
        RegIn <= "10000000";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010011100101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011100");
        RegIn <= "00011010";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010101011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101110");
        assert(RegBOut = "00110110");
        RegIn <= "10111110";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101001011111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000100");
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010100110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101001");
        RegIn <= "11001001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100010100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110110");
        RegIn <= "00110010";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101011111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010100");
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011100");
        RegIn <= "00100110";
        wait for 10 ns;
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001100");
        RegIn <= "10110110";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101110001000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000111");
        assert(RegBOut = "10000111");
        RegIn <= "00000010";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010011101111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011010");
        assert(RegBOut = "01010100");
        RegIn <= "00010011";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011110101001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001011");
        assert(RegBOut = "10110110");
        RegIn <= "00101001";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010001101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100111");
        RegIn <= "00101010";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010011110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010100");
        RegIn <= "01000111";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100000010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101110");
        RegIn <= "01001011";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010010100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110010");
        RegIn <= "10101000";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010000000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100100");
        RegIn <= "00110100";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000011");
        RegIn <= "11000111";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001011111101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000111");
        assert(RegBOut = "10111110");
        RegIn <= "10000100";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000111");
        RegIn <= "01101001";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        assert(RegBOut = "01101001");
        RegIn <= "00100100";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111110001111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        assert(RegBOut = "10110110");
        RegIn <= "00101000";
        wait for 10 ns;
        IR <= "1001111110001111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        assert(RegBOut = "10110110");
        RegIn <= "11000000";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010010110110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111101");
        RegIn <= "11111111";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010111010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111110");
        RegIn <= "01100100";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001001");
        RegIn <= "10011010";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000001");
        RegIn <= "10001110";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010000011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000000");
        RegIn <= "01110100";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010000110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001110");
        RegIn <= "00001100";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100110");
        RegIn <= "10100010";
        wait for 10 ns;
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110110");
        RegIn <= "01000100";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010111000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001011");
        RegIn <= "00011000";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110100001001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101001");
        assert(RegBOut = "10101000");
        RegIn <= "11100001";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000001000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111011");
        RegIn <= "01110111";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100110101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001011");
        assert(RegBOut = "01001110");
        RegIn <= "01001010";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101110111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000001");
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        RegIn <= "01001110";
        wait for 10 ns;
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110110");
        RegIn <= "10110110";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010110011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110110");
        RegIn <= "01110000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100001");
        RegIn <= "11100000";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101100");
        RegIn <= "01011111";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011010101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101000");
        assert(RegBOut = "01001010");
        RegIn <= "01000011";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110000");
        RegIn <= "01011010";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010010110110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111111");
        RegIn <= "11011100";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010101010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111110");
        RegIn <= "10011101";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100111000100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011000");
        assert(RegBOut = "11101001");
        RegIn <= "10000111";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110001111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011111");
        assert(RegBOut = "01010001");
        RegIn <= "01001000";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010110000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001110");
        RegIn <= "01001000";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010111010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100100");
        RegIn <= "11011110";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101000100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010101010111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011101");
        assert(RegBOut = "01001000");
        RegIn <= "10000000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100010");
        RegIn <= "00001011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001011");
        RegIn <= "10110001";
        wait for 10 ns;
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000100");
        RegIn <= "00010001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010010000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010001");
        RegIn <= "00010101";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100111000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000111");
        RegIn <= "01011010";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111111110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010001");
        assert(RegBOut = "10110011");
        RegIn <= "01010101";
        wait for 10 ns;
        IR <= "1001111111110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010001");
        assert(RegBOut = "10110011");
        RegIn <= "11011010";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100100111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011010");
        assert(RegBOut = "01000011");
        RegIn <= "01100000";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001110010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011010");
        assert(RegBOut = "10011101");
        RegIn <= "00100101";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010100100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111111");
        RegIn <= "01101101";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110001");
        RegIn <= "01010111";
        wait for 10 ns;
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010001");
        RegIn <= "01000101";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000000000100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010101");
        assert(RegBOut = "11101001");
        RegIn <= "11101100";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011010");
        RegIn <= "00111011";
        wait for 10 ns;
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011110");
        RegIn <= "10001111";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000001000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110111");
        RegIn <= "11111001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010111");
        RegIn <= "00000011";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110011011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001110");
        assert(RegBOut = "01000011");
        RegIn <= "00010111";
        wait for 10 ns;
        IR <= "1001110011011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001110");
        assert(RegBOut = "01000011");
        RegIn <= "10110001";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011101");
        RegIn <= "00101001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111000101111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        assert(RegBOut = "01000101");
        RegIn <= "00101000";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010011110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000100");
        RegIn <= "00010010";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101010011111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101000");
        assert(RegBOut = "01000101");
        RegIn <= "10001011";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111011");
        RegIn <= "00000100";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001111");
        RegIn <= "10011111";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111101100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000111");
        assert(RegBOut = "01101101");
        RegIn <= "00100110";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000100");
        RegIn <= "11111100";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000000");
        RegIn <= "11010111";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011111111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000101");
        assert(RegBOut = "01001010");
        RegIn <= "10100111";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010110100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001010");
        RegIn <= "11001101";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010010010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        assert(RegBOut = "11000100");
        RegIn <= "10000111";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100101001110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110111");
        assert(RegBOut = "00011010");
        RegIn <= "10101111";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000100");
        RegIn <= "10001011";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010110000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001000");
        RegIn <= "10110000";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101010000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010101");
        assert(RegBOut = "00100110");
        RegIn <= "01001110";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010100010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010111");
        assert(RegBOut = "10110001");
        RegIn <= "01110111";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000001");
        RegIn <= "01001101";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101011010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001110");
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010111010111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011111");
        RegIn <= "10001011";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010100111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100000");
        RegIn <= "00000100";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000011");
        RegIn <= "01100101";
        wait for 10 ns;
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100111");
        RegIn <= "01110100";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010101010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011101");
        RegIn <= "01111101";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001110101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001101");
        assert(RegBOut = "10001011");
        RegIn <= "00110110";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010101001010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101111");
        RegIn <= "00100011";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011001001001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101001");
        assert(RegBOut = "00100101");
        RegIn <= "00101100";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110010010100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        assert(RegBOut = "11101001");
        RegIn <= "10011101";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010111");
        RegIn <= "01110001";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101101");
        RegIn <= "11010000";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110000");
        RegIn <= "11010110";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110111111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110100");
        assert(RegBOut = "10011101");
        RegIn <= "10010110";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110001000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101001");
        assert(RegBOut = "00101010");
        RegIn <= "01011111";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000100");
        RegIn <= "11000011";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010100100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101101");
        RegIn <= "00001000";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000010100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110110");
        RegIn <= "11110000";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111100");
        RegIn <= "10101101";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110011110100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010010");
        assert(RegBOut = "01011111");
        RegIn <= "10000101";
        wait for 10 ns;
        IR <= "1001110011110100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010010");
        assert(RegBOut = "01011111");
        RegIn <= "10010110";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110000");
        RegIn <= "00011110";
        wait for 10 ns;
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100101");
        RegIn <= "10000001";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101011001011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100111");
        assert(RegBOut = "01001101");
        RegIn <= "11101001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110000");
        RegIn <= "00011101";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001101");
        RegIn <= "01001010";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010100010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        assert(RegBOut = "10010110");
        RegIn <= "01011000";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110011");
        RegIn <= "00001101";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100101011000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111101");
        assert(RegBOut = "01001110");
        RegIn <= "10101010";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011110");
        RegIn <= "11010000";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000001");
        RegIn <= "00010100";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101100010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000101");
        assert(RegBOut = "11100000");
        RegIn <= "00101011";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010000110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001100");
        RegIn <= "11100011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011101");
        RegIn <= "01100010";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001010");
        RegIn <= "00101000";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100000");
        RegIn <= "00010111";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010001111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001000");
        assert(RegBOut = "01001110");
        RegIn <= "11110111";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001000");
        RegIn <= "11100001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111011111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010010");
        assert(RegBOut = "01100010");
        RegIn <= "01100101";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101110000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010000");
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101011");
        RegIn <= "00101100";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        RegIn <= "01100010";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111001011001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100010");
        assert(RegBOut = "00010100");
        RegIn <= "10110000";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010000000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101100");
        RegIn <= "11000011";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010110100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100010");
        RegIn <= "00100100";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011100001011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010111");
        assert(RegBOut = "00101000");
        RegIn <= "11000100";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010100011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        RegIn <= "11011000";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111010100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000011");
        assert(RegBOut = "00000100");
        RegIn <= "11100110";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100001");
        RegIn <= "00100000";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010010000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001110");
        RegIn <= "11110010";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110010100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100110");
        assert(RegBOut = "01001000");
        RegIn <= "11010111";
        wait for 10 ns;
        IR <= "1001110010100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100110");
        assert(RegBOut = "01001000");
        RegIn <= "01100001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111101110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001101");
        assert(RegBOut = "00010111");
        RegIn <= "11011011";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011000");
        RegIn <= "11100101";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011111");
        RegIn <= "11100001";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000100");
        RegIn <= "10001101";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010111000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101101");
        assert(RegBOut = "00101010");
        RegIn <= "11001110";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010000011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100001");
        RegIn <= "10011101";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010110100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100100");
        RegIn <= "00000110";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010010110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011100");
        RegIn <= "11111111";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100011000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101001");
        RegIn <= "00011001";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111101100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100110");
        assert(RegBOut = "11011011");
        RegIn <= "00100101";
        wait for 10 ns;
        IR <= "1001111101100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100110");
        assert(RegBOut = "11011011");
        RegIn <= "10010011";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010010110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111111");
        RegIn <= "11001110";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101111110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010110");
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111000111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100011");
        assert(RegBOut = "00010100");
        RegIn <= "11000110";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010101010111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101010");
        RegIn <= "10100001";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011011");
        RegIn <= "00111110";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010100010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011000");
        RegIn <= "11011001";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010000");
        RegIn <= "11001100";
        wait for 10 ns;
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010100");
        RegIn <= "01110011";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000100000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010111");
        assert(RegBOut = "10010011");
        RegIn <= "10000011";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010101000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100011");
        RegIn <= "10100011";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001011001011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011001");
        assert(RegBOut = "00101000");
        RegIn <= "10001011";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010110111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        assert(RegBOut = "10011101");
        RegIn <= "11101101";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100001");
        RegIn <= "11101111";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110101110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111110");
        assert(RegBOut = "10010011");
        RegIn <= "00100010";
        wait for 10 ns;
        IR <= "1001110101110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111110");
        assert(RegBOut = "10010011");
        RegIn <= "10101111";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010010000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110010");
        RegIn <= "11101110";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101111");
        RegIn <= "10010000";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111010110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001110");
        assert(RegBOut = "00100000");
        RegIn <= "00011100";
        wait for 10 ns;
        IR <= "1001111010110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001110");
        assert(RegBOut = "00100000");
        RegIn <= "00001111";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011011101100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011010");
        assert(RegBOut = "11001110");
        RegIn <= "11101101";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110000");
        RegIn <= "01110010";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010111101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100101");
        RegIn <= "00000101";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001100");
        RegIn <= "00001001";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100010110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001110");
        assert(RegBOut = "01001000");
        RegIn <= "01101001";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010111100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000101");
        RegIn <= "01110100";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010110100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000110");
        RegIn <= "11101100";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010110");
        RegIn <= "01011001";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101101101000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100110");
        assert(RegBOut = "11001100");
        RegIn <= "10100011";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101001110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001000");
        assert(RegBOut = "10010000");
        RegIn <= "11100000";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010010110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101001");
        RegIn <= "01101011";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010101000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100011");
        RegIn <= "00110110";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100010110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101011");
        RegIn <= "10111100";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        RegIn <= "11000000";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001100");
        RegIn <= "01011001";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110011");
        RegIn <= "00010111";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        RegIn <= "00000010";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100011011101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001110");
        assert(RegBOut = "01001110");
        RegIn <= "10100111";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101011111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100101");
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000000");
        RegIn <= "10101110";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110101111011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111110");
        assert(RegBOut = "10111100");
        RegIn <= "11100101";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100100100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100000");
        RegIn <= "11111100";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011001");
        RegIn <= "01110011";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010011100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011010");
        assert(RegBOut = "11000110");
        RegIn <= "00010110";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110011");
        RegIn <= "00010011";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010011010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100111");
        RegIn <= "00100000";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010010100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100110");
        RegIn <= "11000110";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101001011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110010");
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001110");
        RegIn <= "11000011";
        wait for 10 ns;
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        RegIn <= "00100110";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000001100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100011");
        RegIn <= "10000011";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010110110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000000");
        RegIn <= "11110011";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100011100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011010");
        assert(RegBOut = "11100000");
        RegIn <= "00101011";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100100011011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011001");
        assert(RegBOut = "10111100");
        RegIn <= "10111111";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000110");
        assert(RegBOut = "00011100");
        RegIn <= "00111011";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000011");
        RegIn <= "01101111";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010111010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100110");
        RegIn <= "00001010";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101001111100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100000");
        assert(RegBOut = "01101111");
        RegIn <= "01101011";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111011001111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        assert(RegBOut = "00010011");
        RegIn <= "10110011";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000100");
        RegIn <= "00011111";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000011100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101011");
        assert(RegBOut = "00001111");
        RegIn <= "11010001";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010111010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001010");
        RegIn <= "01110111";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100100010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111111");
        assert(RegBOut = "00101000");
        RegIn <= "11001111";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100011100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010001");
        RegIn <= "11011010";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101100001010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000011");
        assert(RegBOut = "11101100");
        RegIn <= "11011111";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010010111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111100");
        RegIn <= "00010010";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000001100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000011");
        RegIn <= "11110111";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010010010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011101");
        RegIn <= "10110010";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110111001001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101111");
        assert(RegBOut = "10110010");
        RegIn <= "01110100";
        wait for 10 ns;
        IR <= "1001110111001001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101111");
        assert(RegBOut = "10110010");
        RegIn <= "01101110";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010010010111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110010");
        RegIn <= "01110000";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010111");
        RegIn <= "01001010";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101100101100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111100");
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001111");
        RegIn <= "01100000";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010001100101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101010");
        RegIn <= "01011011";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111011011110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100000");
        assert(RegBOut = "01110100");
        RegIn <= "00000010";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011001");
        RegIn <= "10010101";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010110100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101100");
        RegIn <= "00011011";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000010100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011011");
        RegIn <= "01001000";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010101000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110110");
        RegIn <= "10100100";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101000000100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110100");
        assert(RegBOut = "10100100");
        RegIn <= "11101010";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110101111100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100101");
        assert(RegBOut = "10110011");
        RegIn <= "10101110";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111100111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        assert(RegBOut = "01001010");
        RegIn <= "01000011";
        wait for 10 ns;
        IR <= "1001111100111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        assert(RegBOut = "01001010");
        RegIn <= "01111110";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101001101100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011011");
        assert(RegBOut = "01101111");
        RegIn <= "00111010";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001010");
        RegIn <= "10001110";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110111");
        RegIn <= "01100100";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111011");
        RegIn <= "01000001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100101000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100100");
        RegIn <= "11010011";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010001001010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100001");
        RegIn <= "11111101";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111010");
        RegIn <= "10011000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101110");
        RegIn <= "11110001";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010100100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111100");
        RegIn <= "01011111";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101111");
        RegIn <= "00110010";
        wait for 10 ns;
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100100");
        RegIn <= "11000001";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010010111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010010");
        RegIn <= "01100010";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110000110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000001");
        assert(RegBOut = "01110010");
        RegIn <= "10101111";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010111100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110100");
        RegIn <= "01101101";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110010");
        RegIn <= "10001011";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100000");
        RegIn <= "00111001";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110100110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        assert(RegBOut = "00101000");
        RegIn <= "10001010";
        wait for 10 ns;
        IR <= "1001110100110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        assert(RegBOut = "00101000");
        RegIn <= "11100101";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110101010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010000");
        assert(RegBOut = "10101111");
        RegIn <= "11000111";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010011");
        RegIn <= "10010011";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110010");
        RegIn <= "10011101";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010101");
        RegIn <= "10001011";
        wait for 10 ns;
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001110");
        RegIn <= "01100110";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010100001010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011111");
        RegIn <= "10000111";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010101101111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110111");
        assert(RegBOut = "01100101");
        RegIn <= "00111101";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011101");
        RegIn <= "11110110";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000001");
        RegIn <= "00111010";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010100110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        RegIn <= "11110011";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        RegIn <= "01001001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100010010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110000");
        RegIn <= "11011010";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010110010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100110");
        RegIn <= "10001001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110000010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100101");
        assert(RegBOut = "10001011");
        RegIn <= "10111001";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010010100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000110");
        RegIn <= "01111110";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110100111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110011");
        assert(RegBOut = "01111110");
        RegIn <= "11011101";
        wait for 10 ns;
        IR <= "1001110100111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110011");
        assert(RegBOut = "01111110");
        RegIn <= "10010000";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010111110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010011");
        RegIn <= "11010011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001000");
        RegIn <= "01011100";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110011");
        RegIn <= "00010111";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100000110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101111");
        assert(RegBOut = "10101111");
        RegIn <= "11101010";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101100100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011111");
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011100");
        RegIn <= "01100100";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010111");
        RegIn <= "00111111";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111010101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111110");
        assert(RegBOut = "00111111");
        RegIn <= "01100110";
        wait for 10 ns;
        IR <= "1001111010101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111110");
        assert(RegBOut = "00111111");
        RegIn <= "11011010";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010011");
        RegIn <= "01100111";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110110");
        RegIn <= "10110101";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111010");
        RegIn <= "10000010";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111001");
        RegIn <= "00101000";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010101000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010011");
        RegIn <= "00011010";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110001");
        RegIn <= "00101100";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101101");
        RegIn <= "11100001";
        wait for 10 ns;
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100111");
        RegIn <= "00100010";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010101010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000111");
        RegIn <= "01110011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110101");
        RegIn <= "10010011";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000010");
        RegIn <= "01110101";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100001");
        RegIn <= "10001110";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010011010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        RegIn <= "01000000";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111111000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010011");
        assert(RegBOut = "11110111");
        RegIn <= "10011001";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011000111101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101010");
        assert(RegBOut = "01110101");
        RegIn <= "00010001";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110011");
        RegIn <= "10111101";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010110000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001001");
        RegIn <= "11000101";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101100110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110011");
        assert(RegBOut = "11110011");
        RegIn <= "00011000";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100010010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011010");
        RegIn <= "01010110";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000001000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011010");
        RegIn <= "01010000";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100100");
        RegIn <= "00011110";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111111");
        RegIn <= "00000101";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010011011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000000");
        RegIn <= "10110001";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010101010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111101");
        RegIn <= "01010011";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011111");
        RegIn <= "00010111";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010001110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101011");
        RegIn <= "01011101";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011000");
        RegIn <= "01001000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000111");
        RegIn <= "00010001";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000101");
        RegIn <= "11101101";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011001");
        RegIn <= "00010011";
        wait for 10 ns;
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110101");
        RegIn <= "10010010";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010000100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        RegIn <= "10001101";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010001000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111101");
        RegIn <= "00110100";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010111100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001110");
        assert(RegBOut = "10001101");
        RegIn <= "00010000";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110011");
        RegIn <= "00100001";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001001");
        RegIn <= "10000000";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011101010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010011");
        assert(RegBOut = "00010111");
        RegIn <= "01000011";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100101010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010011");
        RegIn <= "00000001";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010100000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010001");
        RegIn <= "00000011";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010110");
        RegIn <= "01101011";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010110001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101101");
        assert(RegBOut = "10110001");
        RegIn <= "01101111";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010011");
        RegIn <= "10110001";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100000001011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100110");
        assert(RegBOut = "01100010");
        RegIn <= "00010110";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000001000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010000");
        RegIn <= "11010101";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010000");
        RegIn <= "11001110";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110001");
        RegIn <= "00011110";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010010");
        RegIn <= "11110000";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010000010100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011010");
        assert(RegBOut = "00110100");
        RegIn <= "10010101";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101101");
        RegIn <= "11000000";
        wait for 10 ns;
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000000");
        RegIn <= "11000110";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000010111101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100010");
        assert(RegBOut = "10110001");
        RegIn <= "10100101";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011000");
        RegIn <= "01001110";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010100100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010111");
        RegIn <= "11011000";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010111111101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100010");
        assert(RegBOut = "10110001");
        RegIn <= "11010100";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010011100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011010");
        assert(RegBOut = "01001110");
        RegIn <= "00111000";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000000");
        RegIn <= "11010011";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000110");
        RegIn <= "11111100";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010011");
        RegIn <= "10111110";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010001111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011101");
        assert(RegBOut = "01111110");
        RegIn <= "10111100";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010110100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011110");
        RegIn <= "00010001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100010100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111110");
        RegIn <= "10011000";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100100001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000011");
        assert(RegBOut = "10110001");
        RegIn <= "10001001";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110100010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        assert(RegBOut = "10001011");
        RegIn <= "11001110";
        wait for 10 ns;
        IR <= "1001110100010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        assert(RegBOut = "10001011");
        RegIn <= "11010100";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001110");
        RegIn <= "01101100";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010001000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110100");
        RegIn <= "01101010";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        RegIn <= "11101111";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111111110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100010");
        assert(RegBOut = "10001001");
        RegIn <= "01000001";
        wait for 10 ns;
        IR <= "1001111111110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100010");
        assert(RegBOut = "10001001");
        RegIn <= "10110100";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101101111011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101100");
        assert(RegBOut = "00000101");
        RegIn <= "00110010";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110011000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100001");
        assert(RegBOut = "11101010");
        RegIn <= "01000111";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011101");
        RegIn <= "10011001";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111100011110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101111");
        assert(RegBOut = "01101100");
        RegIn <= "01110101";
        wait for 10 ns;
        IR <= "1001111100011110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101111");
        assert(RegBOut = "01101100");
        RegIn <= "11001100";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100001000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101010");
        RegIn <= "00111010";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010001110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011001");
        RegIn <= "01111010";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010010111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100101");
        RegIn <= "00010100";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010001");
        RegIn <= "11010011";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000101");
        RegIn <= "11110100";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010000011000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001100");
        assert(RegBOut = "11101110");
        RegIn <= "00101010";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010100000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001001");
        RegIn <= "11011110";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010110000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111110");
        RegIn <= "10110110";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100111110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100010");
        RegIn <= "01011111";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100011011001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110001");
        assert(RegBOut = "01101011");
        RegIn <= "01101110";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100111001000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011110");
        assert(RegBOut = "11101110");
        RegIn <= "00101110";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010110100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010011");
        RegIn <= "01110011";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010100010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101111");
        assert(RegBOut = "00101010");
        RegIn <= "11010011";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010010100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011000");
        assert(RegBOut = "01111010");
        RegIn <= "00010101";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110000");
        RegIn <= "01000100";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010011000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000111");
        RegIn <= "00000010";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110100000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011110");
        assert(RegBOut = "01111010");
        RegIn <= "00011111";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001000");
        RegIn <= "01101010";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011000001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110101");
        assert(RegBOut = "11110000");
        RegIn <= "11000111";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101110001010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110110");
        assert(RegBOut = "01110011");
        RegIn <= "10000010";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100001110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111010");
        RegIn <= "11100001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100111010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110000");
        RegIn <= "11100010";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101111011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100010");
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101110");
        RegIn <= "01100101";
        wait for 10 ns;
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100010");
        RegIn <= "11001000";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000010");
        RegIn <= "01101100";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010001001011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111010");
        assert(RegBOut = "00010100");
        RegIn <= "10111111";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001000");
        RegIn <= "01111001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100010100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011000");
        RegIn <= "11011011";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011000");
        RegIn <= "01010100";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010110101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110011");
        RegIn <= "10111101";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110100110100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101010");
        assert(RegBOut = "00111010");
        RegIn <= "10110111";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110111");
        RegIn <= "01011111";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111101");
        RegIn <= "10001011";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110100");
        RegIn <= "11010000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000001");
        RegIn <= "11001010";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101010");
        assert(RegBOut = "00011111");
        RegIn <= "01101011";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010111010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001000");
        RegIn <= "10010101";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110011111001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100101");
        assert(RegBOut = "01101011");
        RegIn <= "10100000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110010");
        RegIn <= "11110010";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        RegIn <= "11001111";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010010100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011011");
        RegIn <= "01110011";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101011011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101110");
        assert(RegBOut = "01100101");
        RegIn <= "01011110";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010111110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011111");
        RegIn <= "11110000";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010100010111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101111");
        RegIn <= "00110101";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010000000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110101");
        RegIn <= "01000001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100010100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110011");
        RegIn <= "10101111";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010001000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111010");
        RegIn <= "00011110";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100100110001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011111");
        RegIn <= "11010111";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010111000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100101");
        RegIn <= "10010100";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010100");
        RegIn <= "00010001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        RegIn <= "10010010";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010000");
        RegIn <= "10000101";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010010");
        RegIn <= "11101101";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000101");
        RegIn <= "10100000";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101011");
        RegIn <= "11011110";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010001011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001111");
        assert(RegBOut = "00000010");
        RegIn <= "10100000";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010001");
        RegIn <= "11011110";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010100");
        RegIn <= "10000101";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010101");
        RegIn <= "00111111";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100000");
        RegIn <= "11001001";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111111");
        RegIn <= "00010110";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010101101001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110111");
        assert(RegBOut = "01101011");
        RegIn <= "00110110";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110100011111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110101");
        assert(RegBOut = "10100000");
        RegIn <= "10000111";
        wait for 10 ns;
        IR <= "1001110100011111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110101");
        assert(RegBOut = "10100000");
        RegIn <= "00111001";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000101");
        RegIn <= "01100101";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010110");
        RegIn <= "11010000";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111001011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001111");
        assert(RegBOut = "01100101");
        RegIn <= "10110001";
        wait for 10 ns;
        IR <= "1001111001011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001111");
        assert(RegBOut = "01100101");
        RegIn <= "01110010";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111110000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101100");
        assert(RegBOut = "00110110");
        RegIn <= "10011001";
        wait for 10 ns;
        IR <= "1001111110000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101100");
        assert(RegBOut = "00110110");
        RegIn <= "11101000";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010101000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010000");
        RegIn <= "10000110";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010101110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110010");
        RegIn <= "00000001";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101010");
        RegIn <= "00100101";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100101");
        RegIn <= "00101101";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010000");
        RegIn <= "01000010";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010110000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101100");
        RegIn <= "00000000";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100100100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011110");
        RegIn <= "00101001";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101001100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001110");
        assert(RegBOut = "00000001");
        RegIn <= "10111001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101111101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101100");
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010001110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100001");
        RegIn <= "11010001";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101001");
        RegIn <= "01111101";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010100110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010111");
        RegIn <= "00000000";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010111011001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000010");
        assert(RegBOut = "01101011");
        RegIn <= "00110001";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010010110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010100");
        RegIn <= "00111011";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000001100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110110");
        RegIn <= "10011111";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010010000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101110");
        assert(RegBOut = "10111001");
        RegIn <= "01111000";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010000101000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001101");
        assert(RegBOut = "01111000");
        RegIn <= "00000011";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100111001000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101101");
        assert(RegBOut = "01111000");
        RegIn <= "01011110";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000000");
        RegIn <= "00101101";
        wait for 10 ns;
        IR <= "1001011100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111100");
        RegIn <= "10101000";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010010100101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101111");
        RegIn <= "00101110";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010011010111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011110");
        RegIn <= "00100100";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100010111011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111011");
        assert(RegBOut = "00111011");
        RegIn <= "00011100";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101100100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111101");
        assert(RegBOut = "01111101");
        RegIn <= "11011010";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101001110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010001");
        assert(RegBOut = "00000000");
        RegIn <= "10111001";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010011110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100000");
        RegIn <= "01001011";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111101001001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000110");
        assert(RegBOut = "10101000");
        RegIn <= "01000000";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010001010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001111");
        RegIn <= "10001001";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010111110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110000");
        RegIn <= "10111101";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101010110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011100");
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000000");
        RegIn <= "01001100";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001011010010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101011");
        assert(RegBOut = "00110101");
        RegIn <= "10011101";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011010101100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101110");
        assert(RegBOut = "01011110");
        RegIn <= "01111000";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001001");
        RegIn <= "00100001";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010111010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110001");
        RegIn <= "10000100";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010100011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110101");
        RegIn <= "01000001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111101001000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000000");
        assert(RegBOut = "00101101");
        RegIn <= "10111010";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010111010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000100");
        RegIn <= "01101001";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101000000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011001");
        assert(RegBOut = "10011111");
        RegIn <= "01111000";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101001");
        RegIn <= "10001011";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101101");
        RegIn <= "10010111";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001001");
        RegIn <= "00101000";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010110110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        RegIn <= "10110011";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110110110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110011");
        assert(RegBOut = "10111001");
        RegIn <= "00111010";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011100010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000001");
        assert(RegBOut = "11011010");
        RegIn <= "01010001";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010100100101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011010");
        RegIn <= "00010010";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110010111100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011100");
        assert(RegBOut = "00000010");
        RegIn <= "00010011";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100101000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111010");
        RegIn <= "11100011";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111111101110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101100");
        assert(RegBOut = "01101100");
        RegIn <= "10100011";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010101011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001010");
        RegIn <= "10101110";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111111001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011110");
        assert(RegBOut = "10001011");
        RegIn <= "01000010";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010111");
        RegIn <= "01100011";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111010");
        RegIn <= "10001010";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100000110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100101");
        RegIn <= "01011011";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100101110100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000001");
        assert(RegBOut = "00011110");
        RegIn <= "00001110";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101110010111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101000");
        assert(RegBOut = "00001110");
        RegIn <= "00101000";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101110011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        assert(RegBOut = "01000010");
        RegIn <= "10010011";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000111100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100011");
        assert(RegBOut = "10111001");
        RegIn <= "10100011";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010011110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001011");
        RegIn <= "10011111";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100111110110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111101");
        assert(RegBOut = "10111001");
        RegIn <= "11011110";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010001110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111001");
        RegIn <= "01111110";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100011");
        RegIn <= "00100001";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001010");
        RegIn <= "00001110";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001110");
        RegIn <= "00111001";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100011");
        RegIn <= "00111001";
        wait for 10 ns;
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011110");
        RegIn <= "11001101";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100001");
        RegIn <= "00100101";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111001");
        RegIn <= "10110011";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010001010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100001");
        RegIn <= "01010011";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000010");
        RegIn <= "11111100";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010000010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101000");
        RegIn <= "00111011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101101");
        RegIn <= "11111110";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010011");
        RegIn <= "10100011";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001101010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101110");
        assert(RegBOut = "00000000");
        RegIn <= "00101000";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010100110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000000");
        assert(RegBOut = "01111110");
        RegIn <= "11100011";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010101100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011111");
        RegIn <= "11110110";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010100111101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000000");
        assert(RegBOut = "00100100");
        RegIn <= "10000000";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101010111100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010011");
        assert(RegBOut = "01000010");
        RegIn <= "11001001";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010000001110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111000");
        assert(RegBOut = "00111000");
        RegIn <= "11000000";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010010000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111000");
        RegIn <= "10101000";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111000");
        RegIn <= "00001110";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011011");
        assert(RegBOut = "00011111");
        RegIn <= "11111110";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010110110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110011");
        RegIn <= "01110110";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010101111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001110");
        assert(RegBOut = "10101000");
        RegIn <= "00011011";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110111101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111001");
        assert(RegBOut = "11001001");
        RegIn <= "00101011";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111000101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001101");
        assert(RegBOut = "10001011");
        RegIn <= "10110011";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111110000100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111110");
        assert(RegBOut = "11100011");
        RegIn <= "00000010";
        wait for 10 ns;
        IR <= "1001111110000100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111110");
        assert(RegBOut = "11100011");
        RegIn <= "00100101";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001010011101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101011");
        assert(RegBOut = "10001011");
        RegIn <= "10101000";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101110110100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110110");
        assert(RegBOut = "11100011");
        RegIn <= "11111001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111101110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001110");
        assert(RegBOut = "00101000");
        RegIn <= "01111101";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100101100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110110");
        assert(RegBOut = "00000010");
        RegIn <= "11100100";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010001111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111110");
        RegIn <= "00001101";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        RegIn <= "00001101";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010000100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10110011");
        RegIn <= "00000101";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010100010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000001");
        assert(RegBOut = "00100101");
        RegIn <= "10000110";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010001000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011110");
        RegIn <= "01101100";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100110100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100101");
        assert(RegBOut = "00001101");
        RegIn <= "01010000";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011110101101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010000");
        assert(RegBOut = "10001011");
        RegIn <= "10101111";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101111101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101011");
        assert(RegBOut = "01010000");
        RegIn <= "00111011";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100100100100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010010");
        RegIn <= "10001001";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100010111110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001001");
        assert(RegBOut = "00111000");
        RegIn <= "00111110";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101111000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000010");
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001110111000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111001");
        assert(RegBOut = "11111110");
        RegIn <= "11000100";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010010010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101000");
        RegIn <= "01001001";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010100000101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011111");
        RegIn <= "11000100";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000000");
        RegIn <= "01110110";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111011000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        assert(RegBOut = "10001001");
        RegIn <= "00010011";
        wait for 10 ns;
        IR <= "1001111011000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        assert(RegBOut = "10001001");
        RegIn <= "10100011";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010001100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111001");
        RegIn <= "00110111";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010011000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000010");
        RegIn <= "10100000";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010000");
        RegIn <= "11111000";
        wait for 10 ns;
        IR <= "1001011000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000100");
        RegIn <= "11101100";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100100010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000110");
        RegIn <= "01111101";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111101");
        RegIn <= "00100111";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111100110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110110");
        assert(RegBOut = "00101000");
        RegIn <= "11100000";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101111000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000010");
        assert(RegBOut = "11000100");
        RegIn <= "11100111";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010111100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111011");
        RegIn <= "11111011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100111");
        RegIn <= "10000110";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001011");
        RegIn <= "00001100";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011110101100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111000");
        assert(RegBOut = "10000110");
        RegIn <= "01010001";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000010110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101100");
        RegIn <= "00000101";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001100");
        RegIn <= "11101110";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011011110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011111");
        assert(RegBOut = "00101000");
        RegIn <= "10100011";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010110010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100011");
        RegIn <= "11101110";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001001");
        RegIn <= "01110101";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110101011001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101000");
        assert(RegBOut = "01001001");
        RegIn <= "10011001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010011010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100100");
        RegIn <= "00001101";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000110");
        RegIn <= "01010111";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100001010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010011");
        RegIn <= "00100001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011101110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100111");
        assert(RegBOut = "10011001");
        RegIn <= "11101011";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010100001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000100");
        assert(RegBOut = "00001101");
        RegIn <= "11110101";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110010001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101000");
        assert(RegBOut = "00001101");
        RegIn <= "01100100";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101110");
        RegIn <= "01111000";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010100010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111101");
        RegIn <= "10101110";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011111000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010111");
        assert(RegBOut = "10101110");
        RegIn <= "01010100";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010001");
        RegIn <= "10101101";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101100");
        RegIn <= "10100111";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010100");
        RegIn <= "00110111";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010100100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001001");
        RegIn <= "11110011";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010101110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100111");
        RegIn <= "11110101";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010101100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100100");
        RegIn <= "01001101";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101011101000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111000");
        assert(RegBOut = "11111110");
        RegIn <= "10101110";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110100001000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110101");
        assert(RegBOut = "01100100");
        RegIn <= "10010110";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101110");
        RegIn <= "10011001";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010000000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010011");
        RegIn <= "11000101";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101101");
        RegIn <= "01011101";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100111");
        RegIn <= "10100110";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000111101010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011001");
        assert(RegBOut = "10011001");
        RegIn <= "00110100";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110101");
        RegIn <= "01101010";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010001110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001101");
        RegIn <= "01010000";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101001001111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101100");
        assert(RegBOut = "11001101");
        RegIn <= "11111100";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101111101100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111011");
        assert(RegBOut = "00110111");
        RegIn <= "01100011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100011");
        RegIn <= "10111101";
        wait for 10 ns;
        IR <= "1001011000110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001101");
        RegIn <= "01000001";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110011");
        RegIn <= "01100100";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110110011111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111000");
        assert(RegBOut = "10100011");
        RegIn <= "01011110";
        wait for 10 ns;
        IR <= "1001110110011111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111000");
        assert(RegBOut = "10100011");
        RegIn <= "10010001";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010011011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001111000001000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011110");
        assert(RegBOut = "11111110");
        RegIn <= "10010101";
        wait for 10 ns;
        IR <= "1001111000001000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010101");
        assert(RegBOut = "11111110");
        RegIn <= "11000001";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100100");
        RegIn <= "11101011";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010000110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111110");
        RegIn <= "01000000";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110100");
        RegIn <= "00000101";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111110001110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111110");
        assert(RegBOut = "10111101");
        RegIn <= "00101101";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000011100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111101");
        RegIn <= "00010110";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010010001010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100100");
        RegIn <= "11100001";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110111");
        RegIn <= "00000110";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010010111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111110");
        RegIn <= "00100000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000110");
        RegIn <= "11111100";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010010000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100001");
        RegIn <= "11110000";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010001100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110111");
        RegIn <= "01101110";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010010100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101110");
        RegIn <= "11011000";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010010100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011000");
        RegIn <= "10010110";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110000101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000101");
        assert(RegBOut = "00100000");
        RegIn <= "01100111";
        wait for 10 ns;
        IR <= "1001110000101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000101");
        assert(RegBOut = "00100000");
        RegIn <= "00011110";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101010100100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010110");
        assert(RegBOut = "11100011");
        RegIn <= "11010101";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010111111011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000001");
        assert(RegBOut = "00100000");
        RegIn <= "00101010";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110001101010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101110");
        assert(RegBOut = "11010101");
        RegIn <= "00101111";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000001110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101010");
        RegIn <= "01111010";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101010101111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010101");
        assert(RegBOut = "00101010");
        RegIn <= "01110000";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010111111101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101010");
        assert(RegBOut = "00001101");
        RegIn <= "11000100";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111100");
        RegIn <= "00111010";
        wait for 10 ns;


        -- Testing: BCLR
        IR <= "1001010010011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000010000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101101");
        RegIn <= "01100000";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000101101110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111010");
        assert(RegBOut = "11100000");
        RegIn <= "01100000";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100000");
        RegIn <= "01101010";
        wait for 10 ns;


        -- Testing: LSR
        IR <= "1001010001110110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010000");
        RegIn <= "11100011";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101110110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100110");
        assert(RegBOut = "00000101");
        RegIn <= "00010101";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100000");
        RegIn <= "01101101";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111000");
        RegIn <= "11111101";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011001");
        RegIn <= "10011100";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101100011000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011100");
        assert(RegBOut = "01101101");
        RegIn <= "10111110";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101000010110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011110");
        assert(RegBOut = "01001101");
        RegIn <= "10111000";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101001000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111100");
        assert(RegBOut = "10111110");
        RegIn <= "11011011";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000011110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101010");
        RegIn <= "01010001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111111000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111010");
        assert(RegBOut = "10010110");
        RegIn <= "01001000";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100101010011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000101");
        RegIn <= "01110011";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100100111100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100000");
        assert(RegBOut = "01101010");
        RegIn <= "10011110";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01011101");
        RegIn <= "01100110";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010101");
        RegIn <= "00111101";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101011");
        RegIn <= "11000011";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010010111010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101110");
        assert(RegBOut = "01100111");
        RegIn <= "00010001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010001110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100011");
        RegIn <= "11011011";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010011100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10101110");
        RegIn <= "00110001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100101000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100011");
        RegIn <= "11010001";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000011000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001000");
        RegIn <= "11101000";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000010010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11111101");
        RegIn <= "01110001";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101001110100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011011");
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000001000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010001");
        RegIn <= "11011101";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010110");
        RegIn <= "11000000";
        wait for 10 ns;


        -- Testing: EOR
        IR <= "0010011000110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01000000");
        assert(RegBOut = "01110011");
        RegIn <= "11100010";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010110010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        RegIn <= "00111111";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100110");
        RegIn <= "11100000";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111101");
        RegIn <= "10010111";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111111011110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010001");
        assert(RegBOut = "00010110");
        RegIn <= "01100001";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111000001101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100111");
        assert(RegBOut = "01100001");
        RegIn <= "10000110";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001101000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100110100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100000");
        assert(RegBOut = "10111000");
        RegIn <= "00101010";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010110110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10010111");
        RegIn <= "00111011";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010110000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101101");
        RegIn <= "10001010";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010111000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101000");
        RegIn <= "10111010";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100111000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111010");
        assert(RegBOut = "00101111");
        RegIn <= "01111011";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10001010");
        RegIn <= "00011001";
        wait for 10 ns;
        IR <= "1001011000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111111");
        RegIn <= "11100110";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110100100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101011");
        assert(RegBOut = "00101111");
        RegIn <= "10010000";
        wait for 10 ns;
        IR <= "1001110100100110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101011");
        assert(RegBOut = "00101111");
        RegIn <= "11110000";
        wait for 10 ns;


        -- Testing: ADIW
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111011");
        RegIn <= "01001100";
        wait for 10 ns;
        IR <= "1001011000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100001");
        RegIn <= "11110100";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001110011011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001101");
        assert(RegBOut = "01110000");
        RegIn <= "00110010";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110011011001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110010");
        assert(RegBOut = "01001001");
        RegIn <= "10011110";
        wait for 10 ns;


        -- Testing: ORI
        IR <= "0110000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10111110");
        RegIn <= "00111000";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010011111100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100011");
        assert(RegBOut = "01101010");
        RegIn <= "11111001";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010110010101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100110");
        RegIn <= "01110001";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010001111000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010110010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110001");
        RegIn <= "01100001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100101010100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110011");
        RegIn <= "00101001";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010110");
        RegIn <= "10000101";
        wait for 10 ns;
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010001");
        RegIn <= "00111011";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000101001001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011101");
        assert(RegBOut = "01001001");
        RegIn <= "11001011";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10000101");
        RegIn <= "11110110";
        wait for 10 ns;
        IR <= "1001011100110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111011");
        RegIn <= "11001010";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010100110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011110");
        RegIn <= "10011001";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010100000011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000000");
        RegIn <= "00111110";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001110011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100001");
        assert(RegBOut = "01001100");
        RegIn <= "01101101";
        wait for 10 ns;


        -- Testing: ADD
        IR <= "0000110001000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011011");
        assert(RegBOut = "11110000");
        RegIn <= "01101010";
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010110100111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101010");
        RegIn <= "00011110";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001010000110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110000");
        assert(RegBOut = "01001101");
        RegIn <= "01101010";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010110000001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011001");
        assert(RegBOut = "11110000");
        RegIn <= "10111011";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010111111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001010");
        RegIn <= "11011111";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010001110000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011001");
        assert(RegBOut = "01100000");
        RegIn <= "00010111";
        wait for 10 ns;


        -- Testing: AND
        IR <= "0010000100011000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111000");
        assert(RegBOut = "01101010");
        RegIn <= "01101101";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000010001011100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100001");
        assert(RegBOut = "01101010");
        RegIn <= "01000111";
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010100010101011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01110000");
        assert(RegBOut = "00100000");
        RegIn <= "00111101";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000001000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: OR
        IR <= "0010101110000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00010111");
        assert(RegBOut = "00111110");
        RegIn <= "01111011";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010111010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110100");
        RegIn <= "11010111";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00011110");
        RegIn <= "11110001";
        wait for 10 ns;
        IR <= "1001011100010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111011");
        RegIn <= "00001111";
        wait for 10 ns;


        -- Testing: SBIW
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001100");
        RegIn <= "00101001";
        wait for 10 ns;
        IR <= "1001011100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11010111");
        RegIn <= "00001011";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011111000111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101001");
        assert(RegBOut = "01100000");
        RegIn <= "01101110";
        wait for 10 ns;


        -- Testing: CPI
        IR <= "0011000000000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111110");
        RegIn <= "01001001";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100000100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000101");
        RegIn <= "00011010";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100010010001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001001");
        RegIn <= "10100001";
        wait for 10 ns;


        -- Testing: ASR
        IR <= "1001010100110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10011001");
        RegIn <= "00100111";
        wait for 10 ns;


        -- Testing: ANDI
        IR <= "0111000000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101101");
        RegIn <= "00000000";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101000010010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110000");
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010101110000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01100000");
        RegIn <= "00100110";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010110000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01111011");
        RegIn <= "01001101";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010001100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101111");
        RegIn <= "01001000";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100101000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11001011");
        assert(RegBOut = "00011010");
        RegIn <= "11101010";
        wait for 10 ns;


        -- Testing: CP
        IR <= "0001010011101110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110001");
        assert(RegBOut = "00110001");
        RegIn <= "00110101";
        wait for 10 ns;


        -- Testing: NEG
        IR <= "1001010110100001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110001");
        RegIn <= "11000110";
        wait for 10 ns;


        -- Testing: SBCI
        IR <= "0100000011010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00001011");
        RegIn <= "01101101";
        wait for 10 ns;


        -- Testing: SBC
        IR <= "0000100000010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110000");
        assert(RegBOut = "10010000");
        RegIn <= "00011011";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010101100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01001101");
        RegIn <= "00000001";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010101110011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100110");
        RegIn <= "11110110";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110011100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110001");
        assert(RegBOut = "00011010");
        RegIn <= "00011001";
        wait for 10 ns;
        IR <= "1001110011100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00110001");
        assert(RegBOut = "00011010");
        RegIn <= "00101100";
        wait for 10 ns;


        -- Testing: BLD
        IR <= "1111100010110101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100000");
        RegIn <= "01010000";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100100011101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00000000");
        assert(RegBOut = "10011110");
        RegIn <= "00100000";
        wait for 10 ns;


        -- Testing: ADC
        IR <= "0001111101111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110110");
        assert(RegBOut = "11000110");
        RegIn <= "11111010";
        wait for 10 ns;


        -- Testing: BSET
        IR <= "1001010000011000";
        wait until (clock = '1');
        wait for 10 ns;
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001101111000010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101001");
        assert(RegBOut = "11101011");
        RegIn <= "10111110";
        wait for 10 ns;


        -- Testing: CPC
        IR <= "0000011011111110";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "10100011");
        assert(RegBOut = "11110110");
        RegIn <= "11001000";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010000111010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11100010");
        RegIn <= "11100010";
        wait for 10 ns;


        -- Testing: SUB
        IR <= "0001100100000000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00111110");
        assert(RegBOut = "00011001");
        RegIn <= "11110101";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010111100010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11110110");
        RegIn <= "10100000";
        wait for 10 ns;


        -- Testing: SUBI
        IR <= "0101000001010000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00101001");
        RegIn <= "01111110";
        wait for 10 ns;


        -- Testing: COM
        IR <= "1001010100100000";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11101011");
        RegIn <= "10100111";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101011001001";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101010");
        wait for 10 ns;


        -- Testing: ROR
        IR <= "1001010111110111";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011111");
        RegIn <= "01010100";
        wait for 10 ns;


        -- Testing: SWAP
        IR <= "1001010001110010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11011011");
        RegIn <= "10000101";
        wait for 10 ns;


        -- Testing: INC
        IR <= "1001010110100011";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "11000110");
        RegIn <= "01111011";
        wait for 10 ns;


        -- Testing: MUL
        IR <= "1001110010111100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010000");
        assert(RegBOut = "01101010");
        RegIn <= "10001110";
        wait for 10 ns;
        IR <= "1001110010111100";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01010000");
        assert(RegBOut = "01101010");
        RegIn <= "00100010";
        wait for 10 ns;


        -- Testing: DEC
        IR <= "1001010001011010";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "00100001");
        RegIn <= "10011000";
        wait for 10 ns;


        -- Testing: BST
        IR <= "1111101110011101";
        wait until (clock = '1');
        wait for 10 ns;
        assert(RegAOut = "01101101");
        wait for 10 ns;

        
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





