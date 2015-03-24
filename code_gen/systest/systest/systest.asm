; This is the testcode for Homework #5.  It is in AVR assembly so
; that it will be easy to generate the actual testcode.  It was assembled
; targetting an ATMega16.
;
;
; Revision History
;     5/11/00  Glen George      Initial revision (from 4/23/00 version of 
;                               alutest.asm and 5/11/00 version of
;                               memtest.asm).
;     5/13/00  Glen George      Fixed mistakes in BST instructions (wrong
;                               registers).  Fixed some flag and register
;                               value problems.
;     7/27/00  Glen George      Added instructions for Homework #5 (jumps,
;                               calls, etc.).
;     5/16/04  Glen George      Added more testing and updated comments.
;     2/8/06   Glen George      Fixed some mistakes in the comments.
;     1/22/08  Glen George      Changed the code a litte to match up with the
;                               comments and vice-versa.
;     3/24/15  Albert Gural     Imported code.


Start:                                  ; Start of the test code

                                        ;OpA OpB Res    Flags
        BCLR    0                       ; XX  XX  --  -------0
        BCLR    7                       ; XX  XX  --  0------0
        BCLR    4                       ; XX  XX  --  0--0---0
        BCLR    3                       ; XX  XX  --  0--00--0
        BCLR    1                       ; XX  XX  --  0--00-00
        BCLR    5                       ; XX  XX  --  0-000-00
        BCLR    2                       ; XX  XX  --  0-000000
        BCLR    6                       ; XX  XX  --  00000000

                                        ;OpA OpB Res    Flags
        BSET    4                       ; XX  XX  --  00010000
        BSET    1                       ; XX  XX  --  00010010
        BSET    7                       ; XX  XX  --  10010010
        BSET    0                       ; XX  XX  --  10010011
        BSET    2                       ; XX  XX  --  10010111
        BSET    6                       ; XX  XX  --  11010111
        BSET    5                       ; XX  XX  --  11110111
        BSET    3                       ; XX  XX  --  11111111

        LDI     R16, 0                  ; need a bunch of 0 values
        MOV     R0, R16
        MOV     R1, R16
        MOV     R2, R16
        MOV     R3, R16
        MOV     R4, R16
        MOV     R5, R16
        MOV     R6, R16
        MOV     R7, R16

                                        ;OpA OpB Res    Flags
        BLD     R0, 7                   ; 00  XX  80  11111111
        BLD     R1, 3                   ; 00  XX  08  11111111
        BLD     R2, 1                   ; 00  XX  02  11111111
        BLD     R3, 6                   ; 00  XX  40  11111111
        BLD     R4, 0                   ; 00  XX  01  11111111
        BLD     R5, 5                   ; 00  XX  20  11111111
        BLD     R6, 4                   ; 00  XX  10  11111111
        BLD     R7, 2                   ; 00  XX  04  11111111

        LDI     R20, $DF                ; initialize for BST
        MOV     R8, R20
        LDI     R20, $04
        MOV     R9, R20
        LDI     R20, $7F
        MOV     R10, R20
        LDI     R20, $01
        MOV     R11, R20
        LDI     R20, $FD
        MOV     R12, R20
        LDI     R20, $40
        MOV     R13, R20
        LDI     R20, $F7
        MOV     R14, R20
        LDI     R20, $10
        MOV     R15, R20
                                        ;OpA OpB Res    Flags
        BST     R8, 5                   ; DF  XX  --  10111111
        BST     R9, 2                   ; 04  XX  --  11111111
        BST     R10, 7                  ; 7F  XX  --  10111111
        BST     R11, 0                  ; 01  XX  --  11111111
        BST     R12, 1                  ; FD  XX  --  10111111
        BST     R13, 6                  ; 40  XX  --  11111111
        BST     R14, 3                  ; F7  XX  --  10111111
        BST     R15, 4                  ; 10  XX  --  11111111

        LDI     R16, $FF                ; initialize for ALU ops
        LDI     R17, $FF
        LDI     R18, 0
        LDI     R19, $70
        LDI     R20, 0
        LDI     R21, $7E
        LDI     R22, $7E
        LDI     R23, $80
        LDI     R24, $45
        LDI     R25, $80
        LDI     R26, $F0
        LDI     R27, $FF
        LDI     R28, $55
        LDI     R29, $AA
        LDI     R30, $70
        LDI     R31, $3F

                                        ;OpA OpB Res    Flags
        ADC     R16, R17                ; FF  FF  FF  11110101
        ADC     R16, R18                ; FF  00  00  11100011
        ADC     R18, R17                ; 00  FF  00  11100011
        ADC     R25, R21                ; 80  7E  FF  11010100
        ADC     R22, R0                 ; 7E  80  FE  11010100

                                        ;OpA OpB Res    Flags
        ADD     R25, R21                ; FF  7E  7D  11100001
        ADD     R16, R17                ; 00  FF  FF  11010100
        ADD     R18, R20                ; 00  00  00  11000010
        ADD     R23, R0                 ; 80  80  00  11011011

                                        ;OpA OpB Res    Flags
        ADIW    R24, $0                 ; 45  00  45  --------
                                        ; 7D  XX  7D  11000000
        ADIW    R26, $10                ; F0  10  00  --------
                                        ; FF  XX  00  11000011
 
                                        ;OpA OpB Res    Flags
        AND     R17, R28                ; FF  55  55  11000001
        AND     R17, R29                ; 55  AA  00  11000011
        AND     R13, R0                 ; 40  80  00  11000011

                                        ;OpA OpB Res    Flags
        ANDI    R28, $FF                ; 55  FF  55  11000001
        ANDI    R16, $FF                ; FF  FF  FF  11010101
        ANDI    R29, $FF                ; AA  FF  AA  11010101

                                        ;OpA OpB Res    Flags
        ASR     R16                     ; FF  XX  FF  11010101
        ASR     R27                     ; 00  XX  00  11000010
        ASR     R30                     ; 70  XX  38  11000000
        ASR     R8                      ; DF  XX  EF  11010101

                                        ;OpA OpB Res    Flags
        COM     R16                     ; FF  XX  00  11000011
        COM     R16                     ; 00  XX  FF  11010101
        COM     R28                     ; 55  XX  AA  11010101
        COM     R28                     ; AA  XX  55  11000001

                                        ;OpA OpB Res    Flags
        CP      R17, R16                ; 00  FF  --  11100001
        CP      R21, R26                ; 7E  00  --  11000000
        CP      R31, R3                 ; 3F  40  --  11010101

                                        ;OpA OpB Res    Flags
        CPC     R17, R16                ; 00  FF  --  11100001
        CPC     R21, R17                ; 7E  00  --  11000000
        CPC     R17, R21                ; 00  7E  --  11110101
        CPC     R21, R16                ; 7E  FF  --  11100001

        LDI     R30, $40
        LDI     R31, $7F
                                        ;OpA OpB Res    Flags
        CPI     R17, $7F                ; 00  7F  --  11110101
        CPI     R30, $70                ; 40  70  --  11010101
        CPI     R31, $A0                ; 7F  A0  --  11001101

        MOV     R30, R19
                                        ;OpA OpB Res    Flags
        DEC     R17                     ; 00  XX  FF  11010101
        DEC     R0                      ; 80  XX  7F  11011001
        DEC     R30                     ; 70  XX  6F  11000001
        DEC     R17                     ; FF  XX  FE  11010101

        MOV     R17, R28
                                        ;OpA OpB Res    Flags
        EOR     R17, R29                ; 55  AA  FF  11010101
        EOR     R17, R28                ; FF  55  AA  11010101
        EOR     R18, R17                ; 00  AA  AA  11010101
        EOR     R18, R16                ; AA  FF  55  11000001
        EOR     R24, R24                ; 45  45  00  11000011

                                        ;OpA OpB Res    Flags
        INC     R24                     ; 00  XX  01  11000001
        INC     R22                     ; FE  XX  FF  11010101
        INC     R22                     ; FF  XX  00  11000011
        INC     R0                      ; 7F  XX  80  11001101

        DEC     R26
        LDI     R31, $80
                                        ;OpA OpB Res    Flags
        LSR     R26                     ; FF  XX  7F  11011001
        LSR     R30                     ; 6F  XX  37  11011001
        LSR     R20                     ; 00  XX  00  11000010
        LSR     R31                     ; 80  XX  40  11000000

                                        ;OpA OpB Res    Flags
        NEG     R16                     ; FF  XX  01  11100001
        NEG     R22                     ; 00  XX  00  11000010
        NEG     R0                      ; 80  XX  80  11001101
        NEG     R21                     ; 7E  XX  82  11110101

                                        ;OpA OpB Res    Flags
        OR      R18, R17                ; 55  AA  FF  11110101
        OR      R18, R28                ; FF  55  FF  11110101
        OR      R22, R17                ; 00  AA  AA  11110101

                                        ;OpA OpB Res    Flags
        ORI     R17, $FF                ; AA  FF  FF  11110101
        ORI     R25, $7D                ; 7D  7D  7D  11100001

                                        ;OpA OpB Res    Flags
        ROR     R17                     ; FF  XX  FF  11110101
        ROR     R19                     ; 70  XX  B8  11101100
        ROR     R16                     ; 01  XX  00  11111011
        ROR     R0                      ; 80  XX  C0  11101100
        ROR     R16                     ; 00  XX  00  11100010

        LDI     R31, $50
                                        ;OpA OpB Res    Flags
        SBC     R16, R17                ; 00  FF  01  11100001
        SBCI    R31, $70                ; 50  70  DF  11110101
        SBC     R10, R20                ; 7F  00  7E  11000000

        LDI     R25, $7F
        LDI     R24, $71
                                        ;OpA OpB Res    Flags
        SBCI    R26, $7F                ; 7F  7F  00  11000000
        SBC     R25, R17                ; 7F  FF  80  11000000
        SBCI    R24, $A0                ; 71  A0  D0  11001101

        LDI     R24, $0D
        LDI     R25, 0
                                        ;OpA OpB Res    Flags
        SBIW    R24, $10                ; 0D  10  FD  --------
                                        ; 00  XX  FF  11010101
        SBIW    R24, $0                 ; FD  00  FD  --------
                                        ; FF  XX  FF  11010100

        LDI     R30, $7F
        LDI     R31, $7F
                                        ;OpA OpB Res    Flags
        SUB     R16, R17                ; 01  FF  02  11100001
        SUB     R30, R17                ; 7F  FF  80  11001101
        SUB     R31, R20                ; 7F  00  7F  11000000

        LDI     R30, $50
        LDI     R31, $71
                                        ;OpA OpB Res    Flags
        SUBI    R20, $7F                ; 00  7F  81  11110101
        SUBI    R30, $70                ; 50  70  E0  11010101
        SUBI    R31, $A0                ; 71  A0  D1  11001101

                                        ;OpA OpB Res    Flags
        SWAP    R21                     ; 82  XX  28  11001101
        SWAP    R10                     ; 7E  XX  E7  11001101
        SWAP    R27                     ; 00  XX  00  11001101

                                        ; store address registers
        PUSH    R26                     ; write 00 @ FFFF
        PUSH    R27                     ; write 00 @ FFFE
        PUSH    R28                     ; write 55 @ FFFD
        PUSH    R29                     ; write AA @ FFFC
        PUSH    R30                     ; write E0 @ FFFB
        PUSH    R31                     ; write D1 @ FFFA
                                        ; pop back into a couple other regs
        POP     R0                      ; read D1 @ FFFA
        POP     R1                      ; read E0 @ FFFB

                                        ; setup addresses for writing
        LDI     R27, $FF                ; X = FFFF
        LDI     R26, $FF
        LDI     R29, $FF                ; Y = FFC0
        LDI     R28, $C0
        LDI     R31, $00                ; Z = 0080
        LDI     R30, $80

        STS      $5555, R0              ; write D1 @ 5555
        STS      $AAAA, R1              ; write E0 @ AAAA

        ST       X, R2                  ; write 02 @ FFFF
        ST      -X, R3                  ; write 40 @ FFFE
        ST      X+, R4                  ; write 01 @ FFFE
        ST      X+, R5                  ; write 20 @ FFFF
        ST       X, R6                  ; write 10 @ 0000

        ST      Y+, R7                  ; write 04 @ FFC0
        ST       Y, R8                  ; write EF @ FFC1
        ST      -Y, R9                  ; write 04 @ FFC0
        ST       Y, R10                 ; write E7 @ FFC0
        STD     Y + 60, R11             ; write 01 @ FFFC
        STD     Y + 2, R12              ; write FD @ FFC2
        STD     Y + 22, R13             ; write 00 @ FFD6
        STD     Y + 1, R14              ; write F7 @ FFC1

        ST      Z+, R15                 ; write 10 @ 0080
        ST       Z, R16                 ; write 02 @ 0081
        ST      -Z, R17                 ; write FF @ 0080
        ST       Z, R18                 ; write FF @ 0080
        STD     Z + 30, R19             ; write B8 @ 009E
        STD     Z + 1, R20              ; write 81 @ 0081
        STD     Z + 63, R21             ; write 28 @ 00BF
        STD     Z + 32, R22             ; write AA @ 00A0

                                        ; setup another address for writing
        LDI     R29, $FF                ; Y = FFE0
        LDI     R28, $E0

        ST      -Y, R23                 ; write 00 @ FFDF
        ST      Y+, R24                 ; write FD @ FFDF
        STD     Y + 63, R25             ; write FF @ 001F


                                        ;setup new addresses for reading
        LDI     R27, 0                  ; X = 0
        LDI     R26, 0
        LDI     R29, $FF                ; Y = FFFF
        LDI     R28, $FF
        LDI     R31, $FF                ; Z = FFC0
        LDI     R30, $C0

        LDS     R0, $AAAA               ; read E0 @ AAAA
        LDS     R1, $5555               ; read D1 @ 5555

        LD      R7, X                   ; read 10 @ 0000
        LD      R9, -X                  ; read 20 @ FFFF
        LD      R20, X+                 ; read 20 @ FFFF
        LD      R21, X                  ; read 10 @ 0000

        LD      R6, Y+                  ; read 20 @ FFFF
        LD      R23, Y                  ; read 10 @ 0000
        LD      R22, -Y                 ; read 20 @ FFFF
        LDD     R15, Y + 32             ; read FF @ 001F

        LD      R4, Z+                  ; read 04 @ FFC0
        LD      R13, Z                  ; read EF @ FFC1
        LD      R2, -Z                  ; read 04 @ FFC0
        LDD     R17, Z + 60             ; read 01 @ FFFC


TestJumps:                              ; test unconditional jumping

        JMP     JumpTest                ; just test jumping
BackRJump:
        LDI     R22, $5A
        LDI     R23, $5A
        RJMP    ForwardRJump            ; test a forward RJMP
JumpTest:
        LDI     R24, $A5
        RJMP    BackRJump               ; test a backward RJMP
ForwardRJump:
        LDI     R30, LOW(IndirJump)     ; finally test an indirect jump
        LDI     R31, HIGH(IndirJump)
        IJMP
        LDI     R27, 0                  ; should skip these instructions
        LDI     R28, 0
IndirJump:


TestCalls:                              ; test subroutine calls
        CALL    Subr1                   ; direct subroutine call
        RCALL   Subr1                   ; relative direct subroutine call
        LDI     R30, LOW(Subr1)
        LDI     R31, HIGH(Subr1)
        ICALL                           ; indirect subroutine call


TestBranches:                           ; test some conditional branches
        CP      R28, R27
        BRLO    Branch1                 ; should branch: $7F U< $FF
        JMP     TestBranches
Branch1:
        BRLT    TestBranches            ; should not branch: $7F S> $FF
        BREQ    TestBranches            ; should not branch: $7F != $FF
        BRNE    Branch2                 ; should branch: $7F != $FF
        JMP     TestBranches
Branch2:
        LDI     R21, $69
        ADD     R21, R21
        BRHC    TestBranches            ; should not branch (HC is set)
        OR      R27, R27                ; this is a negative number
        BRMI    Branch3                 ; should take the branch
        JMP     TestBranches
Branch3:
        OR      R28, R28                ; this is a positive number
        BRMI    TestBranches            ; should not take the branch
        BRPL    Branch4                 ; now should take it
        JMP     TestBranches
Branch4:
        OR      R27, R27                ; this is a negative number
        BRPL    TestBranches            ; should not take the branch
        SUB     R28, R27                ; this generates an overflow
        BRVS    Branch5                 ; so should take the branch
        JMP     TestBranches
Branch5:
        DEC     R28                     ; 80 - 1 -> 7F => overflow
        BRVC    TestBranches            ; should not take the branch
        CPI     R27, 1                  ; -1 < 1
        BRGE    TestBranches            ; so should not take the branch
        CLI                             ; clear interrupt flag
        BRIE    TestBranches            ; so should not take the branch
        CALL    SubrI                   ; call subroutine that ends with RETI
        BRID    TestBranches            ; RETI set I flag, don't branch
        BST     R30, 1                  ; set the T flag
        BRTC    TestBranches            ; so should not branch
        BST     R30, 3                  ; now clear the T flag
        BRTS    TestBranches            ; and still should not branch
        ADD     R30, R30                ; R30 is now $CC (no carry)
        BRSH    Branch6                 ; so should take the branch
        JMP     TestBranches
Branch6:
        ADD     R30, R30                ; should set the carry and half carry
        BRSH    TestBranches            ; should not take branch
        BRHS    TestSkips               ; but should take this one
        JMP     TestBranches


TestSkips:                              ; test skip instructions
        CPSE    R22, R23                ; skip a 1 byte instruction
        RJMP    TestSkips
        CPSE    R22, R23                ; skip a 2 byte instruction
        JMP     TestSkips
        CPSE    R22, R24                ; don't skip
        LDI     R22, $80
        SBRC    R22, 6                  ; should skip a 1 byte instruction
        LDI     R22, $FF
        SBRC    R22, 3                  ; should skip a 2 byte instruction
        JMP     TestSkips
        SBRC    R22, 7                  ; don't skip
        LDI     R22, $A5
        SBRS    R22, 0                  ; should skip a 1 byte instruction
        LDI     R22, 0
        SBRS    R22, 5                  ; should skip a 2 byte instruction
        JMP     TestSkips
        SBRS    R22, 1                  ; don't skip
        JMP     Start                   ; start over


Subr1:                                  ; the subroutine
        LDI     R27, $FF
        LDI     R28, $7F
        LDI     R29, 0
        RET


SubrI:                                  ; subroutine ending with RETI
        LDI     R25, $FF
        LDI     R26, $7F
        LDI     R30, $66
        RETI
