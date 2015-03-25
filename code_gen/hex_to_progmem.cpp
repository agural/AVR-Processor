//#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <sstream>
#include <map>

using namespace std;
ifstream fin("systest\\systest\\Debug\\systest.hex");
ofstream fout("progmem.out");

int main () {
    string s;
    stringstream ss;

    // For each line in the hex file, convert it into eight 16-bit instructions for Program memory.
    int total = 0;
    fin >> s;
    while(fin >> s) {
        int len = (s.size() - 11)/4;
        total += len;

        ss << "        ";
        for(int i = 0; i < len; i++) {
            string cA = s.substr( 9 + 4 * i, 2);
            string cB = s.substr(11 + 4 * i, 2);
            ss << "X\"" << cB << cA << "\", ";
        }
        ss << endl;
    }

    // Initialize the ROM size.
    fout << "    -- define the type for the ROM (an array)" << endl;
    fout << "    type  ROMtype  is array(0 to " << (total-1) << ") of std_logic_vector(15 downto 0);" << endl;
    fout << endl;
    fout << "    -- define the actual ROM (initialized to a simple program)" << endl;
    fout << "    signal  ROMbits  :  ROMtype  :=  (" << endl;

    // Get our compiled set of instructions
    s = ss.str();
    // Remove the trailing comma and newline
    s = s.substr(0, s.size() - 12);
    fout << s << endl;

    fout << "    );" << endl;

    return 0;
}
