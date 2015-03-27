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
;     3/26/15  Albert Gural     Expanded code. Added tests passed/failed subroutine.


Start:                                  ; Start of the test code

		;>>> Check Status bits
                                        ;OpA OpB Res    Flags
        BCLR    0                       ; XX  XX  --  -------0
		BRBS	0, StatusBad
        BCLR    7                       ; XX  XX  --  0------0
		BRBS	7, StatusBad
        BCLR    4                       ; XX  XX  --  0--0---0
		BRBS	4, StatusBad
        BCLR    3                       ; XX  XX  --  0--00--0
		BRBS	3, StatusBad
        BCLR    1                       ; XX  XX  --  0--00-00
		BRBS	1, StatusBad
        BCLR    5                       ; XX  XX  --  0-000-00
		BRBS	5, StatusBad
        BCLR    2                       ; XX  XX  --  0-000000
		BRBS	2, StatusBad
        BCLR    6                       ; XX  XX  --  00000000
		BRBS	6, StatusBad

                                        ;OpA OpB Res    Flags
        BSET    4                       ; XX  XX  --  00010000
		BRBC	4, StatusBad
        BSET    1                       ; XX  XX  --  00010010
		BRBC	1, StatusBad
        BSET    7                       ; XX  XX  --  10010010
		BRBC	7, StatusBad
        BSET    0                       ; XX  XX  --  10010011
		BRBC	0, StatusBad
        BSET    2                       ; XX  XX  --  10010111
		BRBC	2, StatusBad
        BSET    6                       ; XX  XX  --  11010111
		BRBC	6, StatusBad
        BSET    5                       ; XX  XX  --  11110111
		BRBC	5, StatusBad
        BSET    3                       ; XX  XX  --  11111111
		BRBC	3, StatusBad
		
		JMP		StatusGood
StatusBad:
		LDI		R16, $80
		JMP		Bad
StatusGood:


		;>>> Check that L16 functions properly
		LDI		R16, $FF
		CPI		R16, $FF
		BRNE	R16Bad
		LDI		R16, $00
		CPI		R16, $00
		BRNE	R16Bad
		LDI		R16, $55
		CPI		R16, $55
		BRNE	R16Bad
		LDI		R16, $AA
		CPI		R16, $AA
		BRNE	R16Bad

		JMP		R16Good
R16Bad:
		LDI		R16, $81				; in retrospect... this might be dumb
		JMP		Bad
R16Good:


		;>>> Check Register Setting
        LDI     R16, $FF                ; need a bunch of 0 values
		MOV		R0, R16
        MOV     R1, R16
        MOV     R2, R16
        MOV     R3, R16
        MOV     R4, R16
        MOV     R5, R16
        MOV     R6, R16
        MOV     R7, R16
        MOV     R8, R16
        MOV     R9, R16
        MOV     R10, R16
        MOV     R11, R16
        MOV     R12, R16
        MOV     R13, R16
        MOV     R14, R16
        MOV     R15, R16
        MOV     R17, R16
        MOV     R18, R16
        MOV     R19, R16
		MOV		R20, R16
        MOV     R21, R16
        MOV     R22, R16
        MOV     R23, R16
        MOV     R24, R16
        MOV     R25, R16
        MOV     R26, R16
        MOV     R27, R16
        MOV     R28, R16
        MOV     R29, R16
		MOV		R30, R16
        MOV     R31, R16
		
		
		CP		R16, R0
		BRNE	RegSetBad
		CP		R16, R1
		BRNE	RegSetBad
		CP		R16, R2
		BRNE	RegSetBad
		CP		R16, R3
		BRNE	RegSetBad
		CP		R16, R4
		BRNE	RegSetBad
		CP		R16, R5
		BRNE	RegSetBad
		CP		R16, R6
		BRNE	RegSetBad
		CP		R16, R7
		BRNE	RegSetBad
		CP		R16, R8
		BRNE	RegSetBad
		CP		R16, R9
		BRNE	RegSetBad
		CP		R16, R10
		BRNE	RegSetBad
		CP		R16, R11
		BRNE	RegSetBad
		CP		R16, R12
		BRNE	RegSetBad
		CP		R16, R13
		BRNE	RegSetBad
		CP		R16, R14
		BRNE	RegSetBad
		CP		R16, R15
		BRNE	RegSetBad
		CP		R16, R17
		BRNE	RegSetBad
		CP		R16, R18
		BRNE	RegSetBad
		CP		R16, R19
		BRNE	RegSetBad
		CP		R16, R20
		BRNE	RegSetBad
		CP		R16, R21
		BRNE	RegSetBad
		CP		R16, R22
		BRNE	RegSetBad
		CP		R16, R23
		BRNE	RegSetBad
		CP		R16, R24
		BRNE	RegSetBad
		CP		R16, R25
		BRNE	RegSetBad
		CP		R16, R26
		BRNE	RegSetBad
		CP		R16, R27
		BRNE	RegSetBad
		CP		R16, R28
		BRNE	RegSetBad
		CP		R16, R29
		BRNE	RegSetBad
		CP		R16, R30
		BRNE	RegSetBad
		CP		R16, R31
		BRNE	RegSetBad

		JMP		RegSetGood
RegSetBad:
		LDI		R16, $82
		JMP		Bad
RegSetGood:


		;>>> Check Register Clearing
        LDI     R16, 0                  ; need a bunch of 0 values
		MOV		R0, R16
        MOV     R1, R16
        MOV     R2, R16
        MOV     R3, R16
        MOV     R4, R16
        MOV     R5, R16
        MOV     R6, R16
        MOV     R7, R16
        MOV     R8, R16
        MOV     R9, R16
        MOV     R10, R16
        MOV     R11, R16
        MOV     R12, R16
        MOV     R13, R16
        MOV     R14, R16
        MOV     R15, R16
        MOV     R17, R16
        MOV     R18, R16
        MOV     R19, R16
		MOV		R20, R16
        MOV     R21, R16
        MOV     R22, R16
        MOV     R23, R16
        MOV     R24, R16
        MOV     R25, R16
        MOV     R26, R16
        MOV     R27, R16
        MOV     R28, R16
        MOV     R29, R16
		MOV		R30, R16
        MOV     R31, R16
		
		CP		R16, R0
		BRNE	RegClearBad
		CP		R16, R1
		BRNE	RegClearBad
		CP		R16, R2
		BRNE	RegClearBad
		CP		R16, R3
		BRNE	RegClearBad
		CP		R16, R4
		BRNE	RegClearBad
		CP		R16, R5
		BRNE	RegClearBad
		CP		R16, R6
		BRNE	RegClearBad
		CP		R16, R7
		BRNE	RegClearBad
		CP		R16, R8
		BRNE	RegClearBad
		CP		R16, R9
		BRNE	RegClearBad
		CP		R16, R10
		BRNE	RegClearBad
		CP		R16, R11
		BRNE	RegClearBad
		CP		R16, R12
		BRNE	RegClearBad
		CP		R16, R13
		BRNE	RegClearBad
		CP		R16, R14
		BRNE	RegClearBad
		CP		R16, R15
		BRNE	RegClearBad
		CP		R16, R17
		BRNE	RegClearBad
		CP		R16, R18
		BRNE	RegClearBad
		CP		R16, R19
		BRNE	RegClearBad
		CP		R16, R20
		BRNE	RegClearBad
		CP		R16, R21
		BRNE	RegClearBad
		CP		R16, R22
		BRNE	RegClearBad
		CP		R16, R23
		BRNE	RegClearBad
		CP		R16, R24
		BRNE	RegClearBad
		CP		R16, R25
		BRNE	RegClearBad
		CP		R16, R26
		BRNE	RegClearBad
		CP		R16, R27
		BRNE	RegClearBad
		CP		R16, R28
		BRNE	RegClearBad
		CP		R16, R29
		BRNE	RegClearBad
		CP		R16, R30
		BRNE	RegClearBad
		CP		R16, R31
		BRNE	RegClearBad

		JMP		RegClearGood
RegClearBad:
		LDI		R16, $83
		JMP		Bad
RegClearGood:


		;>>> Check BLD
		BSET	6						; Set T bit
                                        ;OpA OpB Res    Flags
        BLD     R20, 7                  ; 00  XX  80  11111111
        BLD     R21, 3                  ; 00  XX  08  11111111
        BLD     R22, 1                  ; 00  XX  02  11111111
        BLD     R23, 6                  ; 00  XX  40  11111111
        BLD     R24, 0                  ; 00  XX  01  11111111
        BLD     R25, 5                  ; 00  XX  20  11111111
        BLD     R26, 4                  ; 00  XX  10  11111111
        BLD     R27, 2                  ; 00  XX  04  11111111
		
		CPI		R20, $80
		BRNE	BLDBad
		CPI		R21, $08
		BRNE	BLDBad
		CPI		R22, $02
		BRNE	BLDBad
		CPI		R23, $40
		BRNE	BLDBad
		CPI		R24, $01
		BRNE	BLDBad
		CPI		R25, $20
		BRNE	BLDBad
		CPI		R26, $10
		BRNE	BLDBad
		CPI		R27, $04
		BRNE	BLDBad

		JMP		BLDGood
BLDBad:
		LDI		R16, $84
		JMP		Bad
BLDGood:


		;>>> Check BST
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
		BRBS	6, BSTBad
        BST     R9, 2                   ; 04  XX  --  11111111
		BRBC	6, BSTBad
        BST     R10, 7                  ; 7F  XX  --  10111111
		BRBS	6, BSTBad
        BST     R11, 0                  ; 01  XX  --  11111111
		BRBC	6, BSTBad
        BST     R12, 1                  ; FD  XX  --  10111111
		BRBS	6, BSTBad
        BST     R13, 6                  ; 40  XX  --  11111111
		BRBC	6, BSTBad
        BST     R14, 3                  ; F7  XX  --  10111111
		BRBS	6, BSTBad
        BST     R15, 4                  ; 10  XX  --  11111111
		BRBC	6, BSTBad

		JMP		BSTGood
BSTBad:
		LDI		R16, $85
		JMP		Bad
BSTGood:


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


		;>>> Check ADC
        ADC     R16, R17
		BRBC	0, ADCBad
		BRBC	2, ADCBad
		BRBC	4, ADCBad
		BRBC	5, ADCBad
		BRBS	1, ADCBad
		BRBS	3, ADCBad
		CPI		R16, $FE
		BRNE	ADCBad

        ADC     R16, R18
		BRBC	2, ADCBad
		BRBC	4, ADCBad
		BRBS	0, ADCBad
		BRBS	1, ADCBad
		BRBS	3, ADCBad
		BRBS	5, ADCBad
		CPI		R16, $FE
		BRNE	ADCBad

        ADC     R18, R17
		BRBC	2, ADCBad
		BRBC	4, ADCBad
		BRBS	0, ADCBad
		BRBS	1, ADCBad
		BRBS	3, ADCBad
		BRBS	5, ADCBad
		CPI		R18, $FF
		BRNE	ADCBad

        ADC     R25, R21
		BRBC	2, ADCBad
		BRBC	4, ADCBad
		BRBS	0, ADCBad
		BRBS	1, ADCBad
		BRBS	3, ADCBad
		BRBS	5, ADCBad
		CPI		R25, $FE
		BRNE	ADCBad

        ADC     R22, R0
		BRBS	0, ADCBad
		BRBS	1, ADCBad
		BRBS	2, ADCBad
		BRBS	3, ADCBad
		BRBS	4, ADCBad
		BRBS	5, ADCBad
		CPI		R22, $7E
		BRNE	ADCBad

		JMP		ADCGood
ADCBad:
		LDI		R16, $86
		JMP		Bad
ADCGood:


		;>>> Check ADD
        ADD     R25, R21
		BRBC	0, ADDBad
		BRBS	1, ADDBad
		BRBS	2, ADDBad
		BRBS	3, ADDBad
		BRBS	4, ADDBad
		BRBC	5, ADDBad
		CPI		R25, $7C
		BRNE	ADDBad

        ADD     R16, R17
		BRBC	0, ADDBad
		BRBS	1, ADDBad
		BRBC	2, ADDBad
		BRBS	3, ADDBad
		BRBC	4, ADDBad
		BRBC	5, ADDBad
		CPI		R16, $FD
		BRNE	ADDBad

        ADD     R18, R20
		BRBS	0, ADDBad
		BRBS	1, ADDBad
		BRBC	2, ADDBad
		BRBS	3, ADDBad
		BRBC	4, ADDBad
		BRBS	5, ADDBad
		CPI		R18, $FF
		BRNE	ADDBad

        ADD     R23, R0
		BRBS	0, ADDBad
		BRBS	1, ADDBad
		BRBC	2, ADDBad
		BRBS	3, ADDBad
		BRBC	4, ADDBad
		BRBS	5, ADDBad
		CPI		R23, $80
		BRNE	ADDBad

		JMP		ADDGood
ADDBad:
		LDI		R16, $87
		JMP		Bad
ADDGood:


		;>>> Check ADIW
                                        ;OpA OpB Res    Flags
        ADIW    R24, $0                 ; 45  00  45  --------
                                        ; 7D  XX  7C  11000000
		BRBS	0, ADIWBad
		BRBS	1, ADIWBad
		BRBS	2, ADIWBad
		BRBS	3, ADIWBad
		BRBS	4, ADIWBad
		BRBS	5, ADIWBad
		CPI		R24, $45
		BRNE	ADIWBad
		CPI		R25, $7C
		BRNE	ADIWBad

        ADIW    R26, $10                ; F0  10  00  --------
                                        ; FF  XX  00  11000011
		BRBC	0, ADIWBad
		BRBC	1, ADIWBad
		BRBS	2, ADIWBad
		BRBS	3, ADIWBad
		BRBS	4, ADIWBad
		BRBS	5, ADIWBad
		CPI		R26, $00
		BRNE	ADIWBad
		CPI		R27, $00
		BRNE	ADIWBad

		JMP		ADIWGood
ADIWBad:
		LDI		R16, $88
		JMP		Bad
ADIWGood:
 
		
		;>>> Check AND
                                        ;OpA OpB Res    Flags
        AND     R17, R28                ; FF  55  55  11000000
		BRBS	0, ANDBad
		BRBS	1, ANDBad
		BRBS	2, ANDBad
		BRBS	3, ANDBad
		BRBS	4, ANDBad
		BRBS	5, ANDBad
		CPI		R17, $55
		BRNE	ANDBad

        AND     R17, R29                ; 55  AA  00  11000010
		BRBS	0, ANDBad
		BRBC	1, ANDBad
		BRBS	2, ANDBad
		BRBS	3, ANDBad
		BRBS	4, ANDBad
		BRBS	5, ANDBad
		BRNE	ANDBad

        AND     R13, R0                 ; 40  80  00  11000010
		BRBS	0, ANDBad
		BRBC	1, ANDBad
		BRBS	2, ANDBad
		BRBS	3, ANDBad
		BRBS	4, ANDBad
		BRBS	5, ANDBad
		BRNE	ANDBad

		JMP		ANDGood
ANDBad:
		LDI		R16, $89
		JMP		Bad
ANDGood:


		;>>> Check ANDI
                                        ;OpA OpB Res    Flags
        ANDI    R28, $FF                ; 55  FF  55  11000000
		BRBS	0, ANDIBad
		BRBS	1, ANDIBad
		BRBS	2, ANDIBad
		BRBS	3, ANDIBad
		BRBS	4, ANDIBad
		BRBS	5, ANDIBad
		CPI		R28, $55
		BRNE	ANDIBad
        ANDI    R28, $00                ; 55  00  00  11000010
		BRBS	0, ANDIBad
		BRBC	1, ANDIBad
		BRBS	2, ANDIBad
		BRBS	3, ANDIBad
		BRBS	4, ANDIBad
		BRBS	5, ANDIBad
		CPI		R28, $00
		BRNE	ANDIBad
		LDI		R28, $55
		
		LDI		R16, $FF
        ANDI    R16, $FF                ; FF  FF  FF  11010100
		BRBS	0, ANDIBad
		BRBS	1, ANDIBad
		BRBC	2, ANDIBad
		BRBS	3, ANDIBad
		BRBC	4, ANDIBad
		BRBS	5, ANDIBad
		CPI		R16, $FF
		BRNE	ANDIBad
        ANDI    R16, $00                ; FF  00  00  11000010
		BRBS	0, ANDIBad
		BRBC	1, ANDIBad
		BRBS	2, ANDIBad
		BRBS	3, ANDIBad
		BRBS	4, ANDIBad
		BRBS	5, ANDIBad
		CPI		R16, $00
		BRNE	ANDIBad
		LDI		R16, $FF
		
        ANDI    R29, $FF                ; AA  FF  AA  11010100
		BRBS	0, ANDIBad
		BRBS	1, ANDIBad
		BRBC	2, ANDIBad
		BRBS	3, ANDIBad
		BRBC	4, ANDIBad
		BRBS	5, ANDIBad
		CPI		R29, $AA
		BRNE	ANDIBad
        ANDI    R29, $00                ; AA  00  00  11000010
		BRBS	0, ANDIBad
		BRBC	1, ANDIBad
		BRBS	2, ANDIBad
		BRBS	3, ANDIBad
		BRBS	4, ANDIBad
		BRBS	5, ANDIBad
		CPI		R29, $00
		BRNE	ANDIBad
		LDI		R29, $AA

		JMP		ANDIGood
ANDIBad:
		LDI		R16, $8A
		JMP		Bad
ANDIGood:


		;>>> Check ASR
                                        ;OpA OpB Res    Flags
        ASR     R16                     ; FF  XX  FF  11010101
		BRBC	0, ASRBad
		BRBS	1, ASRBad
		BRBC	2, ASRBad
		BRBS	3, ASRBad
		BRBC	4, ASRBad
		BRBS	5, ASRBad
		CPI		R16, $FF
		BRNE	ASRBad

        ASR     R27                     ; 00  XX  00  11000010
		BRBS	0, ASRBad
		BRBC	1, ASRBad
		BRBS	2, ASRBad
		BRBS	3, ASRBad
		BRBS	4, ASRBad
		BRBS	5, ASRBad
		CPI		R27, $00
		BRNE	ASRBad

        ASR     R30                     ; 70  XX  38  11000000
		BRBS	0, ASRBad
		BRBS	1, ASRBad
		BRBS	2, ASRBad
		BRBS	3, ASRBad
		BRBS	4, ASRBad
		BRBS	5, ASRBad
		CPI		R30, $38
		BRNE	ASRBad

        ASR     R8                      ; DF  XX  EF  11010101

		JMP		ASRGood
ASRBad:
		LDI		R16, $8B
		JMP		Bad
ASRGood:


		;>>> Check COM
                                        ;OpA OpB Res    Flags
        COM     R16                     ; FF  XX  00  11000011
		BRBC	0, COMBad
		BRBC	1, COMBad
		BRBS	2, COMBad
		BRBS	3, COMBad
		BRBS	4, COMBad
		BRBS	5, COMBad
		CPI		R16, $00
		BRNE	COMBad

        COM     R16                     ; 00  XX  FF  11010101
		BRBC	0, COMBad
		BRBS	1, COMBad
		BRBC	2, COMBad
		BRBS	3, COMBad
		BRBC	4, COMBad
		BRBS	5, COMBad
		CPI		R16, $FF
		BRNE	COMBad

        COM     R28                     ; 55  XX  AA  11010101
		BRBC	0, COMBad
		BRBS	1, COMBad
		BRBC	2, COMBad
		BRBS	3, COMBad
		BRBC	4, COMBad
		BRBS	5, COMBad
		CPI		R28, $AA
		BRNE	COMBad

        COM     R28                     ; AA  XX  55  11000001
		BRBC	0, COMBad
		BRBS	1, COMBad
		BRBS	2, COMBad
		BRBS	3, COMBad
		BRBS	4, COMBad
		BRBS	5, COMBad
		CPI		R28, $55
		BRNE	COMBad

		JMP		COMGood
COMBad:
		LDI		R16, $8C
		JMP		Bad
COMGood:


		;>>> Check CP
                                        ;OpA OpB Res    Flags
        CP      R17, R16                ; 00  FF  --  11100001
		BRBC	0, CPBad
		BRBS	1, CPBad
		BRBS	2, CPBad
		BRBS	3, CPBad
		BRBS	4, CPBad
		BRBC	5, CPBad

        CP      R21, R26                ; 7E  00  --  11000000
		BRBS	0, CPBad
		BRBS	1, CPBad
		BRBS	2, CPBad
		BRBS	3, CPBad
		BRBS	4, CPBad
		BRBS	5, CPBad

		LDI		R16, $40
		MOV		R3, R16
		LDI		R16, $FF
        CP      R31, R3                 ; 3F  40  --  11010101
		BRBC	0, CPBad
		BRBS	1, CPBad
		BRBC	2, CPBad
		BRBS	3, CPBad
		BRBC	4, CPBad
		BRBS	5, CPBad

		JMP		CPGood
CPBad:
		LDI		R16, $8D
		JMP		Bad
CPGood:


		;>>> Check CPC
                                        ;OpA OpB Res    Flags
        CPC     R17, R16                ; 00  FF  --  11100001
		BRBC	0, CPCBad
		BRBS	1, CPCBad
		BRBS	2, CPCBad
		BRBS	3, CPCBad
		BRBS	4, CPCBad
		BRBC	5, CPCBad

        CPC     R21, R17                ; 7E  00  --  11000000
		BRBS	0, CPCBad
		BRBS	1, CPCBad
		BRBS	2, CPCBad
		BRBS	3, CPCBad
		BRBS	4, CPCBad
		BRBS	5, CPCBad

        CPC     R17, R21                ; 00  7E  --  11110101
		BRBC	0, CPCBad
		BRBS	1, CPCBad
		BRBC	2, CPCBad
		BRBS	3, CPCBad
		BRBC	4, CPCBad
		BRBC	5, CPCBad

        CPC     R21, R16                ; 7E  FF  --  11100001
		BRBC	0, CPCBad
		BRBS	1, CPCBad
		BRBS	2, CPCBad
		BRBS	3, CPCBad
		BRBS	4, CPCBad
		BRBC	5, CPCBad

		JMP		CPCGood
CPCBad:
		LDI		R16, $8E
		JMP		Bad
CPCGood:


		;>>> Check CPI
        LDI     R30, $40
        LDI     R31, $7F
                                        ;OpA OpB Res    Flags
        CPI     R17, $7F                ; 00  7F  --  11110101
		BRBC	0, CPIBad
		BRBS	1, CPIBad
		BRBC	2, CPIBad
		BRBS	3, CPIBad
		BRBC	4, CPIBad
		BRBC	5, CPIBad

        CPI     R30, $70                ; 40  70  --  11010101
		BRBC	0, CPIBad
		BRBS	1, CPIBad
		BRBC	2, CPIBad
		BRBS	3, CPIBad
		BRBC	4, CPIBad
		BRBS	5, CPIBad

        CPI     R31, $A0                ; 7F  A0  --  11001101
		BRBC	0, CPIBad
		BRBS	1, CPIBad
		BRBC	2, CPIBad
		BRBC	3, CPIBad
		BRBS	4, CPIBad
		BRBS	5, CPIBad

		JMP		CPIGood
CPIBad:
		LDI		R16, $8F
		JMP		Bad
CPIGood:


		;>>> Check DEC
        MOV     R30, R19
                                        ;OpA OpB Res    Flags
        DEC     R17                     ; 00  XX  FF  11010101
		BRBC	0, DECBad
		BRBS	1, DECBad
		BRBC	2, DECBad
		BRBS	3, DECBad
		BRBC	4, DECBad
		BRBS	5, DECBad
		CPI		R17, $FF
		BRNE	DECBad

		LDI		R16, $80
		MOV		R0, R16
        DEC     R0                      ; 80  XX  7F  11011000
		BRBS	0, DECBad
		BRBS	1, DECBad
		BRBS	2, DECBad
		BRBC	3, DECBad
		BRBC	4, DECBad
		BRBS	5, DECBad
		MOV		R16, R0
		CPI		R16, $7F
		BRNE	DECBad
		LDI		R16, $FF

        DEC     R30                     ; 70  XX  6F  11000000
		BRBS	0, DECBad
		BRBS	1, DECBad
		BRBS	2, DECBad
		BRBS	3, DECBad
		BRBS	4, DECBad
		BRBS	5, DECBad
		CPI		R30, $6F
		BRNE	DECBad

        DEC     R17                     ; FF  XX  FE  11010100
		BRBS	0, DECBad
		BRBS	1, DECBad
		BRBC	2, DECBad
		BRBS	3, DECBad
		BRBC	4, DECBad
		BRBS	5, DECBad
		CPI		R17, $FE
		BRNE	DECBad

		JMP		DECGood
DECBad:
		LDI		R16, $90
		JMP		Bad
DECGood:


		;>>> Check EOR
        MOV     R17, R28
                                        ;OpA OpB Res    Flags
        EOR     R17, R29                ; 55  AA  FF  11010100
		BRBS	0, EORBad
		BRBS	1, EORBad
		BRBC	2, EORBad
		BRBS	3, EORBad
		BRBC	4, EORBad
		BRBS	5, EORBad
		CPI		R17, $FF
		BRNE	EORBad

        EOR     R17, R28                ; FF  55  AA  11010100
		BRBS	0, EORBad
		BRBS	1, EORBad
		BRBC	2, EORBad
		BRBS	3, EORBad
		BRBC	4, EORBad
		BRBS	5, EORBad
		CPI		R17, $AA
		BRNE	EORBad

		LDI		R18, $00
        EOR     R18, R17                ; 00  AA  AA  11010100
		BRBS	0, EORBad
		BRBS	1, EORBad
		BRBC	2, EORBad
		BRBS	3, EORBad
		BRBC	4, EORBad
		BRBS	5, EORBad
		CPI		R18, $AA
		BRNE	EORBad

        EOR     R18, R16                ; AA  FF  55  11000000
		BRBS	0, EORBad
		BRBS	1, EORBad
		BRBS	2, EORBad
		BRBS	3, EORBad
		BRBS	4, EORBad
		BRBS	5, EORBad
		CPI		R18, $55
		BRNE	EORBad

        EOR     R24, R24                ; 45  45  00  11000010
		BRBS	0, EORBad
		BRBC	1, EORBad
		BRBS	2, EORBad
		BRBS	3, EORBad
		BRBS	4, EORBad
		BRBS	5, EORBad
		CPI		R24, $00
		BRNE	EORBad


		JMP		EORGood
EORBad:
		LDI		R16, $91
		JMP		Bad
EORGood:


		;>>> Check INC
                                        ;OpA OpB Res    Flags
        INC     R24                     ; 00  XX  01  11000000
		BRBS	0, INCBad
		BRBS	1, INCBad
		BRBS	2, INCBad
		BRBS	3, INCBad
		BRBS	4, INCBad
		BRBS	5, INCBad
		CPI		R24, $01
		BRNE	INCBad

		LDI		R22, $FE
        INC     R22                     ; FE  XX  FF  11010100
		BRBS	0, INCBad
		BRBS	1, INCBad
		BRBC	2, INCBad
		BRBS	3, INCBad
		BRBC	4, INCBad
		BRBS	5, INCBad
		CPI		R22, $FF
		BRNE	INCBad

        INC     R22                     ; FF  XX  00  11000010
		BRBS	0, INCBad
		BRBC	1, INCBad
		BRBS	2, INCBad
		BRBS	3, INCBad
		BRBS	4, INCBad
		BRBS	5, INCBad
		CPI		R22, $00
		BRNE	INCBad

        INC     R0                      ; 7F  XX  80  11001100
		BRBS	0, INCBad
		BRBS	1, INCBad
		BRBC	2, INCBad
		BRBC	3, INCBad
		BRBS	4, INCBad
		BRBS	5, INCBad
		MOV		R16, R0
		CPI		R16, $80
		LDI		R16, $FF
		BRNE	INCBad


		JMP		INCGood
INCBad:
		LDI		R16, $92
		JMP		Bad
INCGood:


		;>>> Check LSR
        DEC     R26
        LDI     R31, $80
                                        ;OpA OpB Res    Flags
        LSR     R26                     ; FF  XX  7F  11011001
		BRBC	0, LSRBad
		BRBS	1, LSRBad
		BRBS	2, LSRBad
		BRBC	3, LSRBad
		BRBC	4, LSRBad
		BRBS	5, LSRBad
		CPI		R26, $7F
		BRNE	LSRBad

        LSR     R30                     ; 6F  XX  37  11011001
		BRBC	0, LSRBad
		BRBS	1, LSRBad
		BRBS	2, LSRBad
		BRBC	3, LSRBad
		BRBC	4, LSRBad
		BRBS	5, LSRBad
		CPI		R30, $37
		BRNE	LSRBad

        LSR     R20                     ; 00  XX  00  11000010
		BRBS	0, LSRBad
		BRBC	1, LSRBad
		BRBS	2, LSRBad
		BRBS	3, LSRBad
		BRBS	4, LSRBad
		BRBS	5, LSRBad
		CPI		R20, $00
		BRNE	LSRBad

        LSR     R31                     ; 80  XX  40  11000000
		BRBS	0, LSRBad
		BRBS	1, LSRBad
		BRBS	2, LSRBad
		BRBS	3, LSRBad
		BRBS	4, LSRBad
		BRBS	5, LSRBad
		CPI		R31, $40
		BRNE	LSRBad


		JMP		LSRGood
LSRBad:
		LDI		R16, $93
		JMP		Bad
LSRGood:


		;>>> Check NEG
                                        ;OpA OpB Res    Flags
        NEG     R16                     ; FF  XX  01  11100001
		BRBC	0, NEGBad
		BRBS	1, NEGBad
		BRBS	2, NEGBad
		BRBS	3, NEGBad
		BRBS	4, NEGBad
		BRBC	5, NEGBad
		CPI		R16, $01
		BRNE	NEGBad

        NEG     R22                     ; 00  XX  00  11000010
		BRBS	0, NEGBad
		BRBC	1, NEGBad
		BRBS	2, NEGBad
		BRBS	3, NEGBad
		BRBS	4, NEGBad
		BRBS	5, NEGBad
		CPI		R22, $00
		BRNE	NEGBad

        NEG     R0                      ; 80  XX  80  11001101
		BRBC	0, NEGBad
		BRBS	1, NEGBad
		BRBC	2, NEGBad
		BRBC	3, NEGBad
		BRBS	4, NEGBad
		BRBS	5, NEGBad
		MOV		R16, R0
		CPI		R16, $80
		LDI		R16, $FF
		BRNE	NEGBad

        NEG     R21                     ; 7E  XX  82  11110101
		BRBC	0, NEGBad
		BRBS	1, NEGBad
		BRBC	2, NEGBad
		BRBS	3, NEGBad
		BRBC	4, NEGBad
		BRBC	5, NEGBad
		CPI		R21, $82
		BRNE	NEGBad


		JMP		NEGGood
NEGBad:
		LDI		R16, $94
		JMP		Bad
NEGGood:


		;>>> Check OR
                                        ;OpA OpB Res    Flags
        OR      R18, R17                ; 55  AA  FF  11010100
		BRBS	0, ORBad
		BRBS	1, ORBad
		BRBC	2, ORBad
		BRBS	3, ORBad
		BRBC	4, ORBad
		BRBS	5, ORBad
		CPI		R18, $FF
		BRNE	ORBad

        OR      R18, R28                ; FF  55  FF  11010100
		BRBS	0, ORBad
		BRBS	1, ORBad
		BRBC	2, ORBad
		BRBS	3, ORBad
		BRBC	4, ORBad
		BRBS	5, ORBad
		CPI		R18, $FF
		BRNE	ORBad

        OR      R22, R17                ; 00  AA  AA  11010100
		BRBS	0, ORBad
		BRBS	1, ORBad
		BRBC	2, ORBad
		BRBS	3, ORBad
		BRBC	4, ORBad
		BRBS	5, ORBad
		CPI		R22, $AA
		BRNE	ORBad


		JMP		ORGood
ORBad:
		LDI		R16, $95
		JMP		Bad
ORGood:


		;>>> Check ORI
                                        ;OpA OpB Res    Flags
        ORI     R17, $FF                ; AA  FF  FF  11010100
		BRBS	0, ORIBad
		BRBS	1, ORIBad
		BRBC	2, ORIBad
		BRBS	3, ORIBad
		BRBC	4, ORIBad
		BRBS	5, ORIBad
		CPI		R17, $FF
		BRNE	ORIBad

        ORI     R25, $7D                ; 7D  7D  7D  11000000
		BRBS	0, ORIBad
		BRBS	1, ORIBad
		BRBS	2, ORIBad
		BRBS	3, ORIBad
		BRBS	4, ORIBad
		BRBS	5, ORIBad
		CPI		R25, $7D
		BRNE	ORIBad


		JMP		ORIGood
ORIBad:
		LDI		R16, $96
		JMP		Bad
ORIGood:


		;>>> Check ROR
		BSET	0
                                        ;OpA OpB Res    Flags
        ROR     R17                     ; FF  XX  FF  11010101
		BRBC	0, RORBad
		BRBS	1, RORBad
		BRBC	2, RORBad
		BRBS	3, RORBad
		BRBC	4, RORBad
		BRBS	5, RORBad
		CPI		R17, $FF
		BRNE	RORBad
		
		BSET	0
        ROR     R19                     ; 70  XX  B8  11001100
		BRBS	0, RORBad
		BRBS	1, RORBad
		BRBC	2, RORBad
		BRBC	3, RORBad
		BRBS	4, RORBad
		BRBS	5, RORBad
		CPI		R19, $B8
		BRNE	RORBad

		LDI		R16, $01
        ROR     R16                     ; 01  XX  00  11011011
		BRBC	0, RORBad
		BRBC	1, RORBad
		BRBS	2, RORBad
		BRBC	3, RORBad
		BRBC	4, RORBad
		BRBS	5, RORBad
		CPI		R16, $00
		BRNE	RORBad

		BSET	0
        ROR     R0                      ; 80  XX  C0  11001100
		BRBS	0, RORBad
		BRBS	1, RORBad
		BRBC	2, RORBad
		BRBC	3, RORBad
		BRBS	4, RORBad
		BRBS	5, RORBad
		MOV		R16, R0
		CPI		R16, $C0
		LDI		R16, $00
		BRNE	RORBad

        ROR     R16                     ; 00  XX  00  11000010
		BRBS	0, RORBad
		BRBC	1, RORBad
		BRBS	2, RORBad
		BRBS	3, RORBad
		BRBS	4, RORBad
		BRBS	5, RORBad
		CPI		R16, $00
		BRNE	RORBad


		JMP		RORGood
RORBad:
		LDI		R16, $97
		JMP		Bad
RORGood:


		;>>> Check SBC
        LDI     R31, $50
                                        ;OpA OpB Res    Flags
        SBC     R16, R17                ; 00  FF  01  11100001
		BRBC	0, SBCBad
		BRBS	1, SBCBad
		BRBS	2, SBCBad
		BRBS	3, SBCBad
		BRBS	4, SBCBad
		BRBC	5, SBCBad
		CPI		R16, $01
		BRNE	SBCBad

		BSET	0
        SBCI    R31, $70                ; 50  70  DF  11110101
		BRBC	0, SBCBad
		BRBS	1, SBCBad
		BRBC	2, SBCBad
		BRBS	3, SBCBad
		BRBC	4, SBCBad
		BRBC	5, SBCBad
		CPI		R31, $DF
		BRNE	SBCBad

		BSET	0
        SBC     R10, R20                ; 7F  00  7E  11000000
		BRBS	0, SBCBad
		BRBS	1, SBCBad
		BRBS	2, SBCBad
		BRBS	3, SBCBad
		BRBS	4, SBCBad
		BRBS	5, SBCBad
		MOV		R16, R10
		CPI		R16, $7E
		LDI		R16, $01
		BRNE	SBCBad


		JMP		SBCGood
SBCBad:
		LDI		R16, $98
		JMP		Bad
SBCGood:


		;>>> Check SBCI
        LDI     R25, $7F
        LDI     R24, $71
                                        ;OpA OpB Res    Flags
        SBCI    R26, $7F                ; 7F  7F  00  11000010
		BRBS	0, SBCIBad
		BRBC	1, SBCIBad
		BRBS	2, SBCIBad
		BRBS	3, SBCIBad
		BRBS	4, SBCIBad
		BRBS	5, SBCIBad
		CPI		R26, $00
		BRNE	SBCIBad

        SBC     R25, R17                ; 7F  FF  80  11001101
		BRBC	0, SBCIBad
		BRBS	1, SBCIBad
		BRBC	2, SBCIBad
		BRBC	3, SBCIBad
		BRBS	4, SBCIBad
		BRBS	5, SBCIBad
		CPI		R25, $80
		BRNE	SBCIBad

		BSET	0
        SBCI    R24, $A0                ; 71  A0  D0  11001101
		BRBC	0, SBCIBad
		BRBS	1, SBCIBad
		BRBC	2, SBCIBad
		BRBC	3, SBCIBad
		BRBS	4, SBCIBad
		BRBS	5, SBCIBad
		CPI		R24, $D0
		BRNE	SBCIBad


		JMP		SBCIGood
SBCIBad:
		LDI		R16, $99
		JMP		Bad
SBCIGood:


		;>>> Check SBIW
        LDI     R24, $0D
        LDI     R25, 0
                                        ;OpA OpB Res    Flags
        SBIW    R24, $10                ; 0D  10  FD  --------
                                        ; 00  XX  FF  11010101
		BRBC	0, SBIWBad
		BRBS	1, SBIWBad
		BRBC	2, SBIWBad
		BRBS	3, SBIWBad
		BRBC	4, SBIWBad
		BRBS	5, SBIWBad
		CPI		R24, $FD
		BRNE	SBIWBad
		CPI		R25, $FF
		BRNE	SBIWBad

        SBIW    R24, $0                 ; FD  00  FD  --------
                                        ; FF  XX  FF  11010100
		BRBS	0, SBIWBad
		BRBS	1, SBIWBad
		BRBC	2, SBIWBad
		BRBS	3, SBIWBad
		BRBC	4, SBIWBad
		BRBS	5, SBIWBad
		CPI		R24, $FD
		BRNE	SBIWBad
		CPI		R25, $FF
		BRNE	SBIWBad


		JMP		SBIWGood
SBIWBad:
		LDI		R16, $9A
		JMP		Bad
SBIWGood:


		;>>> Check SUB
        LDI     R30, $7F
        LDI     R31, $7F
                                        ;OpA OpB Res    Flags
        SUB     R16, R17                ; 01  FF  02  11100001
		BRBC	0, SUBBad
		BRBS	1, SUBBad
		BRBS	2, SUBBad
		BRBS	3, SUBBad
		BRBS	4, SUBBad
		BRBC	5, SUBBad
		CPI		R16, $02
		BRNE	SUBBad

        SUB     R30, R17                ; 7F  FF  80  11001101
		BRBC	0, SUBBad
		BRBS	1, SUBBad
		BRBC	2, SUBBad
		BRBC	3, SUBBad
		BRBS	4, SUBBad
		BRBS	5, SUBBad
		CPI		R30, $80
		BRNE	SUBBad

        SUB     R31, R20                ; 7F  00  7F  11000000
		BRBS	0, SUBBad
		BRBS	1, SUBBad
		BRBS	2, SUBBad
		BRBS	3, SUBBad
		BRBS	4, SUBBad
		BRBS	5, SUBBad
		CPI		R31, $7F
		BRNE	SUBBad


		JMP		SUBGood
SUBBad:
		LDI		R16, $9B
		JMP		Bad
SUBGood:


		;>>> Check SUBI
        LDI     R30, $50
        LDI     R31, $71
                                        ;OpA OpB Res    Flags
        SUBI    R20, $7F                ; 00  7F  81  11110101
		BRBC	0, SUBIBad
		BRBS	1, SUBIBad
		BRBC	2, SUBIBad
		BRBS	3, SUBIBad
		BRBC	4, SUBIBad
		BRBC	5, SUBIBad
		CPI		R20, $81
		BRNE	SUBIBad

        SUBI    R30, $70                ; 50  70  E0  11010101
		BRBC	0, SUBIBad
		BRBS	1, SUBIBad
		BRBC	2, SUBIBad
		BRBS	3, SUBIBad
		BRBC	4, SUBIBad
		BRBS	5, SUBIBad
		CPI		R30, $E0
		BRNE	SUBIBad

        SUBI    R31, $A0                ; 71  A0  D1  11001101
		BRBC	0, SUBIBad
		BRBS	1, SUBIBad
		BRBC	2, SUBIBad
		BRBC	3, SUBIBad
		BRBS	4, SUBIBad
		BRBS	5, SUBIBad
		CPI		R31, $D1
		BRNE	SUBIBad


		JMP		SUBIGood
SUBIBad:
		LDI		R16, $9C
		JMP		Bad
SUBIGood:


		;>>> Check SWAP
                                        ;OpA OpB Res    Flags
        SWAP    R21                     ; 82  XX  28  11000010
		BRBS	0, SWAPBad
		BRBC	1, SWAPBad
		BRBS	2, SWAPBad
		BRBS	3, SWAPBad
		BRBS	4, SWAPBad
		BRBS	5, SWAPBad
		CPI		R21, $28
		BRNE	SWAPBad

        SWAP    R10                     ; 7E  XX  E7  11000010
		BRBS	0, SWAPBad
		BRBC	1, SWAPBad
		BRBS	2, SWAPBad
		BRBS	3, SWAPBad
		BRBS	4, SWAPBad
		BRBS	5, SWAPBad
		MOV		R16, R10
		CPI		R16, $E7
		LDI		R16, $02
		BRNE	SWAPBad

        SWAP    R27                     ; 00  XX  00  11000010
		BRBS	0, SWAPBad
		BRBC	1, SWAPBad
		BRBS	2, SWAPBad
		BRBS	3, SWAPBad
		BRBS	4, SWAPBad
		BRBS	5, SWAPBad
		CPI		R27, $00
		BRNE	SWAPBad


		JMP		SWAPGood
SWAPBad:
		LDI		R16, $9D
		JMP		Bad
SWAPGood:


		;>>> Check PUSH/POP
                                        ; store address registers
        PUSH    R26                     ; write 00 @ FFFF
        PUSH    R27                     ; write 00 @ FFFE
        PUSH    R28                     ; write 55 @ FFFD
        PUSH    R29                     ; write AA @ FFFC
        PUSH    R30                     ; write E0 @ FFFB
        PUSH    R31                     ; write D1 @ FFFA
                                        ; pop back into the same regs
        POP		R26                     ; read D1 @ FFFA
        POP		R27                     ; read E0 @ FFFB
        POP		R28                     ; read AA @ FFFC
        POP		R29                     ; read 55 @ FFFD
        POP		R30                     ; read 00 @ FFFE
        POP		R31                     ; read 00 @ FFFF
		
		CPI		R26, $D1
		BRNE	PPBad
		CPI		R27, $E0
		BRNE	PPBad
		CPI		R28, $AA
		BRNE	PPBad
		CPI		R29, $55
		BRNE	PPBad
		CPI		R30, $00
		BRNE	PPBad
		CPI		R31, $00
		BRNE	PPBad

		JMP		PPGood
PPBad:
		LDI		R16, $9E
		JMP		Bad
PPGood:

                                        ; setup addresses for writing
        LDI     R27, $FF                ; X = FFFF
        LDI     R26, $FF
        LDI     R29, $FF                ; Y = FFC0
        LDI     R28, $C0
        LDI     R31, $00                ; Z = 0080
        LDI     R30, $80


		;>>> Check STS / LDS
		LDI		R16, $55
        STS		$5555, R16				; write 55 @ 5555
		LDI		R16, $AA
        STS		$AAAA, R16				; write AA @ AAAA
		LDI		R16, $00
        STS		$1234, R16				; write 00 @ 1234
		LDI		R16, $FF
        STS		$4321, R16				; write FF @ 4321
		LDI		R16, $6E
        STS		$6E6E, R16				; write 6E @ 6E6E
		
        LDS     R16, $5555              ; read 55 @ 5555
		CPI		R16, $55
		BRNE	STSBad
        LDS     R16, $AAAA              ; read AA @ AAAA
		CPI		R16, $AA
		BRNE	STSBad
        LDS     R16, $1234              ; read 00 @ 1234
		CPI		R16, $00
		BRNE	STSBad
        LDS     R16, $4321              ; read FF @ 4321
		CPI		R16, $FF
		BRNE	STSBad
        LDS     R16, $6E6E              ; read 6E @ 6E6E
		CPI		R16, $6E
		BRNE	STSBad

		JMP		STSGood
STSBad:
		LDI		R16, $A0
		JMP		Bad
STSGood:


		;>>> Check ST/LD (X)
		LDI		R18, $01
		LDI		R19, $02
		LDI		R20, $04
		LDI		R21, $10
		LDI		R22, $20
		LDI		R23, $40

        ST       X, R19                 ; write 02 @ FFFF
		LD		R16, X
		CPI		R16, $02
		BRNE	STXBad

        ST      -X, R23                 ; write 40 @ FFFE
		LD		R16, X
		CPI		R16, $40
		BRNE	STXBad

        ST      X+, R18                 ; write 01 @ FFFE
		LD		R16, -X
		CPI		R16, $01
		BRNE	STXBad
		LD		R16, X+					; (just to re-increment X)

        ST      X+, R22                 ; write 20 @ FFFF
		LD		R16, -X
		CPI		R16, $20
		BRNE	STXBad
		LD		R16, X+
		CPI		R16, $20
		BRNE	STXBad

        ST       X, R21                 ; write 10 @ 0000
		LD		R16, X
		CPI		R16, $10
		BRNE	STXBad
		LD		R16, -X
		CPI		R16, $20
		BRNE	STXBad
		LD		R16, -X
		CPI		R16, $01
		BRNE	STXBad
		LD		R16, X+
		CPI		R16, $01
		BRNE	STXBad
		LD		R16, X+
		CPI		R16, $20
		BRNE	STXBad

		JMP		STXGood
STXBad:
		LDI		R16, $A1
		JMP		Bad
STXGood:


		;>>> Check ST/LD (Quick verification with Y and Z)
        ST      Y+, R18                 ; write 01 @ FFC0
        ST      Y+, R19                 ; write 02 @ FFC1
        ST       Y, R20                 ; write 04 @ FFC2
        ST      -Y, R21                 ; write 10 @ FFC1
		
        ST      Z+, R22                 ; write 20 @ 0080
        ST      Z+, R23                 ; write 40 @ 0081
        ST       Z, R18                 ; write 01 @ 0082
        ST      -Z, R19                 ; write 02 @ 0081
		
		LD		R16, -Y					; read 01 @ FFC0
		CPI		R16, $01
		BRNE	STYZBad
		LD		R16, Y+					; read 01 @ FFC0
		CPI		R16, $01
		BRNE	STYZBad
		LD		R16, Y+					; read 10 @ FFC1
		CPI		R16, $10
		BRNE	STYZBad
		LD		R16, Y					; read 04 @ FFC2
		CPI		R16, $04
		BRNE	STYZBad
		
		LD		R16, -Z					; read 20 @ 0080
		CPI		R16, $20
		BRNE	STYZBad
		LD		R16, Z+					; read 20 @ 0080
		CPI		R16, $20
		BRNE	STYZBad
		LD		R16, Z+					; read 02 @ 0081
		CPI		R16, $02
		BRNE	STYZBad
		LD		R16, Z					; read 01 @ 0082
		CPI		R16, $01
		BRNE	STYZBad

		JMP		STYZGood
STYZBad:
		LDI		R16, $A2
		JMP		Bad
STYZGood:

		;>>> Check STD/LDD
		LDI		R29, $FF				; restore Y = FFC0
		LDI		R28, $C0				;
		LDI		R31, $00				; restore Z = 0080
		LDI		R30, $80				;

        STD     Y + 60, R18             ; write 01 @ FFFC
        STD     Y + 2 , R19             ; write 02 @ FFC2
        STD     Y + 22, R20             ; write 04 @ FFD6
        STD     Y + 1 , R21             ; write 10 @ FFC1

        STD     Z + 30, R19             ; write 02 @ 009E
        STD     Z + 1 , R20             ; write 04 @ 0081
        STD     Z + 63, R22             ; write 20 @ 00BF
        STD     Z + 32, R23             ; write 40 @ 00A0

                                        ;setup new addresses for reading
        LDI     R29, $00                ; Y = 0081
        LDI     R28, $81
        LDI     R31, $FF                ; Z = FFC0
        LDI     R30, $C0

		LDD		R16, Z + 60				; read 01 @ FFFC
		CPI		R16, $01
		BRNE	STDBad
		LDD		R16, Z + 2				; read 02 @ FFC2
		CPI		R16, $02
		BRNE	STDBad
		LDD		R16, Z + 22				; read 04 @ FFD6
		CPI		R16, $04
		BRNE	STDBad
		LDD		R16, Z + 1				; read 10 @ FFC1
		CPI		R16, $10
		BRNE	STDBad

        LDD     R16, Y + 29             ; read 02 @ 009E
		CPI		R16, $02
		BRNE	STDBad
        LDD     R16, Y + 0              ; read 04 @ 0081
		CPI		R16, $04
		BRNE	STDBad
        LDD     R16, Y + 62             ; read 20 @ 00BF
		CPI		R16, $20
		BRNE	STDBad
        LDD     R16, Y + 31             ; read 40 @ 00A0
		CPI		R16, $40
		BRNE	STDBad

		JMP		STDGood
STDBad:
		LDI		R16, $A3
		JMP		Bad
STDGood:


TestJumps:                              ; test unconditional jumping

        JMP     JumpTest                ; just test jumping
		LDI		R16, $A4
		JMP		Bad						; yeah, uh... this definitely makes sense...

BackRJump:
        LDI     R22, $5A
        LDI     R23, $5A
        RJMP    ForwardRJump            ; test a forward RJMP
		LDI		R16, $A6
		JMP		Bad

JumpTest:
        LDI     R24, $A5
        RJMP    BackRJump               ; test a backward RJMP
		LDI		R16, $A5
		JMP		Bad

ForwardRJump:
        LDI     R30, LOW(IndirJump)     ; finally test an indirect jump
        LDI     R31, HIGH(IndirJump)
        IJMP
        LDI     R16, $A7                ; should skip these instructions
        JMP		Bad
IndirJump:
		CALL	TestCalls				; seems like you need to initialize SP
										; with one more push than pop

TestCalls:                              ; test subroutine calls
        CALL    Subr1                   ; direct subroutine call
		CPI		R27, $31
		BRNE	CALLBad
		CPI		R28, $41
		BRNE	CALLBad
		CPI		R29, $59
		BRNE	CALLBad
		LDI		R27, $00				; reset everything
		LDI		R28, $00
		LDI		R29, $00

        RCALL   Subr1                   ; relative direct subroutine call
		CPI		R27, $31
		BRNE	CALLBad
		CPI		R28, $41
		BRNE	CALLBad
		CPI		R29, $59
		BRNE	CALLBad
		LDI		R27, $00				; reset everything
		LDI		R28, $00
		LDI		R29, $00

        LDI     R30, LOW(Subr1)
        LDI     R31, HIGH(Subr1)
        ICALL                           ; indirect subroutine call
		CPI		R27, $31
		BRNE	CALLBad
		CPI		R28, $41
		BRNE	CALLBad
		CPI		R29, $59
		BRNE	CALLBad

		BCLR	7
        CALL    SubrI                   ; direct subroutine call
		CPI		R25, $FF				; with interrupt return (RETI)
		BRNE	CALLBad
		CPI		R26, $7F
		BRNE	CALLBad
		CPI		R30, $66
		BRNE	CALLBad
		BRBC	7, CALLBad				; interrupt flag should be set
		
		JMP		CALLGood
CALLBad:
		LDI		R16, $A8
		JMP		Bad
CALLGood:


TestBranches:                           ; test some conditional branches
		LDI		R28, $7F
		LDI		R27, $FF
        CP      R28, R27
        BRLO    Branch1                 ; should branch: $7F U< $FF
		LDI		R16, $B0
        JMP     Bad
Branch1:
		LDI		R16, $B1
        BRLT    BrBad		            ; should not branch: $7F S> $FF
        BREQ    BrBad		            ; should not branch: $7F != $FF
        BRNE    Branch2                 ; should branch: $7F != $FF
		JMP		Bad
Branch2:
		LDI		R16, $B2
        LDI     R21, $69
        ADD     R21, R21
        BRHC    BrBad		            ; should not branch (HC is set)
        OR      R27, R27                ; this is a negative number
        BRMI    Branch3                 ; should take the branch
        JMP     Bad
Branch3:
		LDI		R16, $B3
        OR      R28, R28                ; this is a positive number
        BRMI    BrBad		            ; should not take the branch
        BRPL    Branch4                 ; now should take it
BrBad:
		JMP		Bad
Branch4:
		LDI		R16, $B4
        OR      R27, R27                ; this is a negative number
        BRPL    Bad			            ; should not take the branch
        SUB     R28, R27                ; this generates an overflow
        BRVS    Branch5                 ; so should take the branch
        JMP     Bad
Branch5:
		LDI		R16, $B5
        DEC     R28                     ; 80 - 1 -> 7F => overflow
        BRVC    Bad			            ; should not take the branch
        CPI     R27, 1                  ; -1 < 1
        BRGE    Bad			            ; so should not take the branch
        CLI                             ; clear interrupt flag
        BRIE    Bad			            ; so should not take the branch
        CALL    SubrI                   ; call subroutine that ends with RETI
        BRID    Bad			            ; RETI set I flag, don't branch
        BST     R30, 1                  ; set the T flag
        BRTC    Bad			            ; so should not branch
        BST     R30, 3                  ; now clear the T flag
        BRTS    Bad			            ; and still should not branch
        ADD     R30, R30                ; R30 is now $CC (no carry)
        BRSH    Branch6                 ; so should take the branch
        JMP     Bad
Branch6:
		LDI		R16, $B6
        ADD     R30, R30                ; should set the carry and half carry
        BRSH    Bad			            ; should not take branch
        BRHS    TestSkips               ; but should take this one
        JMP     Bad


TestSkips:                              ; test skip instructions
		LDI		R16, $B7
        CPSE    R22, R23                ; skip a 1 byte instruction
        RJMP    Bad
        CPSE    R22, R23                ; skip a 2 byte instruction
        JMP     Bad
        CPSE    R22, R24                ; don't skip
        LDI     R22, $80
        SBRC    R22, 6                  ; should skip a 1 byte instruction
        LDI     R22, $FF
        SBRC    R22, 3                  ; should skip a 2 byte instruction
        JMP     Bad
        SBRC    R22, 7                  ; don't skip
        LDI     R22, $A5
        SBRS    R22, 0                  ; should skip a 1 byte instruction
        LDI     R22, 0
        SBRS    R22, 5                  ; should skip a 2 byte instruction
        JMP     Bad
        SBRS    R22, 1                  ; don't skip
        JMP     Good                    ; all tests passed!


Subr1:                                  ; the subroutine
        LDI     R27, $31
        LDI     R28, $41
        LDI     R29, $59
        RET


SubrI:                                  ; subroutine ending with RETI
        LDI     R25, $FF
        LDI     R26, $7F
        LDI     R30, $66
        RETI


Good:									; All tests passed!
		LDI		R16, 0					; No errors
		JMP		Good

Bad:									; Some test failed :(
										; R16 holds error message
		JMP		Bad

