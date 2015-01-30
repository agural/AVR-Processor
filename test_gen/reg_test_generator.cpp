#include <iostream>
#include <stdlib.h>

using namespace std;


/*
IR <= "0001110000000000";
wait for clk_period * 0.5;
assert(RegAOut = 35);
assert(RegBOut = 17);
RegIn <= "00101010";
*/

struct instruction_req {
    bool regA_req;  // whether to expect a regA output from the registers
    bool regB_req;  // whether to expect a regB output from the registers
    bool regIn_req; // whether the instruction should output something back to the registers
};

/*
converts the n-bit value r to a n-bit binary string
note: n must be less than 32
*/
string to_bin(int r, int n) {
    stringstream ss;
    for(int i = (1<<(n-1)); i > 0; i >>= 1) {
        if(r >= i) {
            ss << 1;
            r -= i;
        }
        else ss << 0;
    }
}

/*
standard:  xxxxxx r ddddd rrrr
ADC     000111
ADD     000011
AND     001000
CP      000101
CPC     000001
EOR     001001
OR      001010
SBC     000010
SUB     000110
*/
void op_standard(string op, int ra, int rb) {
    cout << "IR <= \"" << op << to_bin(rb, 5)[0] << to_bin(ra, 5) << to_bin(rb, 5).substr(1) << "\";" << endl;
    cout << "wait for clk_period * 0.5;" << endl;
    cout << "assert(RegAOut = " << regs[ra] << ");" << endl;
    cout << "assert(RegBOut = " << regs[rb] << ");" << endl;
    string out = to_bin(rand() % 256, 8);
    cout << "RegIn <= \"" << out << "\";" << endl;
    regs[regAOut] = out;
}

/*
one argument: xxxxxxx ddddd xxxx
ASR     1001010     0101
COM     1001010     0000
DEC     1001010     1010
INC     1001010     0011
LSR     1001010     0110
NEG     1001010     0001
ROR     1001010     0111
SWAP    1001010     0010
*/

/*
with constant: xxxx KKKK dddd KKKK
ANDI    0111
CPI     0011
ORI     0110
SBCI    0100
SUBI    0101
*/

/*
with constant, word: xxxxxxxx KK dd KKKK
ADIW    10010110
SBIW    10010111
*/

/*
MISC1: xxxxxxxxx sss xxxx
BCLR    100101001   1000
BSET    100101000   1000
*/

/*
MISC2: xxxxxxx ddddd x bbb
BLD     1111100     0
BST     1111101     -
*/

/*
mul in a class of its own: xxxxxx r dddd rrrr
MUL     100111
*/

string regs[32];
int main () {
    map<string, instruction_req> codes;
    codes["000111"]
    return 0;
}
