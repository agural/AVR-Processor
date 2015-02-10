//#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <sstream>
#include <map>

using namespace std;
ofstream cout("reg_test.txt");

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
    return ss.str();
}

string regs[32];

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

    string out = to_bin(rand() % 256, 8);
    cout << "RegIn <= \"" << out << "\";" << endl;

    cout << "wait until (clock = '1');" << endl;
    cout << "assert(RegAOut = \"" << regs[ra] << "\");" << endl;
    cout << "assert(RegBOut = \"" << regs[rb] << "\");" << endl;

    if(op != "000101" && op != "000001") regs[ra] = out; // no result for CP, CPC
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
void op_onearg(string op, int ra, int rb) {
    cout << "IR <= \"1001010" << to_bin(ra, 5) << op << "\";" << endl;

    string out = to_bin(rand() % 256, 8);
    cout << "RegIn <= \"" << out << "\";" << endl;

    cout << "wait until (clock = '1');" << endl;
    cout << "assert(RegAOut = \"" << regs[ra] << "\");" << endl;

    regs[ra] = out;
}

/*
with constant: xxxx KKKK dddd KKKK
ANDI    0111
CPI     0011
ORI     0110
SBCI    0100
SUBI    0101
*/
void op_const(string op, int ra, int rb) {
    if(ra < 16) ra += 16;
    cout << "IR <= \"" << op << "0000" << to_bin(ra-16, 4) << "0000\";" << endl;

    string out = to_bin(rand() % 256, 8);
    cout << "RegIn <= \"" << out << "\";" << endl;

    cout << "wait until (clock = '1');" << endl;
    cout << "assert(RegAOut = \"" << regs[ra] << "\");" << endl;

    if(op != "0011") regs[ra] = out; // no result for CPI
}

/*
with constant, word: xxxxxxxx KK dd KKKK
ADIW    10010110
SBIW    10010111
*/
void op_constw(string op, int ra, int rb) {
    cout << "IR <= \"1001011" << op << "00" << to_bin(ra, 2) << "0000\";" << endl;

    string out = to_bin(rand() % 256, 8);
    cout << "RegIn <= \"" << out << "\";" << endl;

    cout << "wait until (clock = '1');" << endl;
    cout << "assert(RegAOut = \"" << regs[24 + 2 * ra] << "\");" << endl;

    regs[24 + 2 * ra] = out;


    cout << "IR <= \"1001011" << op << "00" << to_bin(ra, 2) << "0000\";" << endl;

    out = to_bin(rand() % 256, 8);
    cout << "RegIn <= \"" << out << "\";" << endl;

    cout << "wait until (clock = '1');" << endl;
    cout << "assert(RegAOut = \"" << regs[25 + 2 * ra] << "\");" << endl;

    regs[25 + 2 * ra] = out;
}

/*
MISC1: xxxxxxxxx sss xxxx
BCLR    100101001   1000
BSET    100101000   1000
*/
void op_bit1(string op, int ra, int rb) {
    cout << "IR <= \"10010100" << op << to_bin(ra, 3) << "1000\";" << endl;
    cout << "wait until (clock = '1');" << endl;
}

/*
MISC2: xxxxxxx ddddd x bbb
BLD     1111100     0
BST     1111101     -
*/
void op_bit2(string op, int ra, int rb) {
    cout << "IR <= \"111110" << op << to_bin(ra, 5) << ((op == "1")?rand()%2:0) << to_bin(rb, 3) << "\";" << endl;

    if(op == "0") {
        string out = to_bin(rand() % 256, 8);
        cout << "RegIn <= \"" << out << "\";" << endl;
        regs[ra] = out;
    }

    cout << "wait until (clock = '1');" << endl;
    cout << "assert(RegAOut = \"" << regs[ra] << "\");" << endl;
}

/*
mul in a class of its own: xxxxxx r dddd rrrr
MUL     100111
*/
void op_mult(string op, int ra, int rb) {
    cout << "IR <= \"" << op << to_bin(rb, 5)[0] << to_bin(ra, 5) << to_bin(rb, 5).substr(1) << "\";" << endl;

    string out = to_bin(rand() % 256, 8);
    cout << "RegIn <= \"" << out << "\";" << endl;

    cout << "wait until (clock = '1');" << endl;
    cout << "assert(RegAOut = \"" << regs[ra] << "\");" << endl;
    cout << "assert(RegBOut = \"" << regs[rb] << "\");" << endl;

    regs[0] = out;


    cout << "IR <= \"" << op << to_bin(rb, 5)[0] << to_bin(ra, 5) << to_bin(rb, 5).substr(1) << "\";" << endl;

    out = to_bin(rand() % 256, 8);
    cout << "RegIn <= \"" << out << "\";" << endl;

    cout << "wait until (clock = '1');" << endl;
    cout << "assert(RegAOut = \"" << regs[ra] << "\");" << endl;
    cout << "assert(RegBOut = \"" << regs[rb] << "\");" << endl;

    regs[1] = out;
}

const int NUM_OPS = 29;
string ops[NUM_OPS] = {
    "ADC","ADD","ADIW","AND","ANDI","ASR","BCLR","BLD","BSET","BST",
    "COM","CP","CPC","CPI","DEC","EOR","INC","LSR","MUL","NEG","OR",
    "ORI","ROR","SBC","SBCI","SBIW","SUB","SUBI","SWAP"
};
int main () {
    for(int i = 0; i < 32; i++) {
        regs[i] = "00000000";
    }
    map<string, pair<void (*)(string, int, int), string> > codes;
    codes["ADC" ] = make_pair(op_standard, "000111"    );
    codes["ADD" ] = make_pair(op_standard, "000011"    );
    codes["ADIW"] = make_pair(op_constw  , "0"         );
    codes["AND" ] = make_pair(op_standard, "001000"    );
    codes["ANDI"] = make_pair(op_const   , "0111"      );
    codes["ASR" ] = make_pair(op_onearg  , "0101"      );
    codes["BCLR"] = make_pair(op_bit1    , "1"         );
    codes["BLD" ] = make_pair(op_bit2    , "0"         );
    codes["BSET"] = make_pair(op_bit1    , "0"         );
    codes["BST" ] = make_pair(op_bit2    , "1"         );
    codes["COM" ] = make_pair(op_onearg  , "0000"      );
    codes["CP"  ] = make_pair(op_standard, "000101"    );
    codes["CPC" ] = make_pair(op_standard, "000001"    );
    codes["CPI" ] = make_pair(op_const   , "0011"      );
    codes["DEC" ] = make_pair(op_onearg  , "1010"      );
    codes["EOR" ] = make_pair(op_standard, "001001"    );
    codes["INC" ] = make_pair(op_onearg  , "0011"      );
    codes["LSR" ] = make_pair(op_onearg  , "0110"      );
    codes["MUL" ] = make_pair(op_mult    , "100111"    );
    codes["NEG" ] = make_pair(op_onearg  , "0001"      );
    codes["OR"  ] = make_pair(op_standard, "001010"    );
    codes["ORI" ] = make_pair(op_const   , "0110"      );
    codes["ROR" ] = make_pair(op_onearg  , "0111"      );
    codes["SBC" ] = make_pair(op_standard, "000010"    );
    codes["SBCI"] = make_pair(op_const   , "0100"      );
    codes["SBIW"] = make_pair(op_constw  , "1"         );
    codes["SUB" ] = make_pair(op_standard, "000110"    );
    codes["SUBI"] = make_pair(op_const   , "0101"      );
    codes["SWAP"] = make_pair(op_onearg  , "0010"      );

    cout << "-- initialize all registers to 0" << endl;
    for(int i = 0; i < 32; i++) {
        int ra = i;
        int rb = i;
        cout << "IR <= \"" << codes["ADD"].second << to_bin(rb, 5)[0] << to_bin(ra, 5) << to_bin(rb, 5).substr(1) << "\";" << endl;
        cout << "wait until (clock = '1');" << endl;
        cout << "wait for 10 ns;" << endl;
        string out = to_bin(i, 8);
        cout << "RegIn <= \"" << out << "\";" << endl;
        cout << "wait for 10 ns;" << endl;
        regs[ra] = out;
    }

    for(int t = 0; t < 1000; t++) {
        string cur = ops[rand() % NUM_OPS];
        int ra = rand() % 32;
        int rb = rand() % 32;
        if(cur == "ADIW" || cur == "SBIW") {
            ra = rand() % 4;
            rb = 0;
        } else if(cur == "BCLR" || cur == "BSET") {
            ra = rand() % 8;
            rb = 0;
        } else if(cur == "BLD" || cur == "BST") {
            rb = rand() % 8;
        } else {
            ;
        }
        cout << "\n\n-- Testing: " << cur << " on inputs ra = " << ra << " and rb = " << rb << " (only the ones that are used for the instruction)." << endl;
        //cout << ra << " " << rb << " " << regs[ra] << " " << regs[rb] << endl;
        codes[cur].first(codes[cur].second, ra, rb);
        /*for(int i = 0; i < 32; i++) {
            cout << i << " " << regs[i] << endl;
        }*/
    }

    return 0;
}
