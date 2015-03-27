# AVR-Processor
VHDL implementation of an 8-bit AVR processor supporting most AVR RISC instructions.

## Project Information
Caltech EE 119B
Albert Gural and Bryan He

## Main Project Files
* The VHDL AVR Implementation is located in `./src/AVR`.
* The AVR processor itself is a VHDL entity `AVR_CPU`.
* A test AVR project is located in `./code-gen/systest`.

## Tools
* `Xilinx ISE` (14.7) for the VHDL implementation for an `XC3S1200E-4FG320` chip.
* `Atmel Studio 6` for creating test code for an `ATmega16` chip.
* `C++` compiler for various scripts.

## Testing
### ALU
The test entity is `ALU_TEST` in the Xilinx ISE project. Test code and simulation can be run from `ALU_TEST_TB`.

### Registers
The test entity is `REG_TEST` in the Xilinx ISE project. Test code and simulation can be run from `REG_TEST_TB`.

### Memory
The test entity is `MEM_TEST` in the Xilinx ISE project. Test code and simulation can be run from `MEM_TEST_TB`.

### Full AVR CPU
The test entity is `AVR_CPU_TEST` in the Xilinx ISE project. Simulation can be run from `AVR_CPU_TEST_TB`. For convenience, a debug signal (register `R16`) has been broken out to see whether the implementation successfully passes all programming tests. Also for convenience, the program address bus is broken out.

## Modifying the AVR CPU test
The supplied tests validate basic operation of the CPU. It isn't too thorough since previous tests of the ALU, Registers, and Memory are already very thorough. However, if there's a specific test you'd like to run, you can modify the tests by following these steps.

1. Open the AVR project located in `./code-gen/systest`.
1. Modify the `systest.asm` file with updated tests. If the tests fail, you should put an error code (number between 1 and 255) on register `R16`, then jump to the label `Bad`. If the tests pass, just proceed with the rest of the tests normally.
1. Compile and run the AVR debugger to ensure the modifications pass all tests.
1. The hex file is located at `./code-gen/systest/systest/Debug/systest.hex`.
1. Compile and run `.code-gen/hex_to_progmem.cpp` (no arguments need to be provided). The file `./code-gen/progmem.out` will be modified.
1. Open `./src/AVR/progmem.vhd` and replace the program memory it contains with the program memory in `./code-gen/progmem.out`.

## Disclaimer
This project was meant as a learning experience in CPU architecture and VHDL programming. In no way are we guaranteeing that the processor works as designed, nor that it is even stable! Use at your own risk.
