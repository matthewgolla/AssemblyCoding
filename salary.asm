.ORIG x3000
MAIN AND R5,R5,#0
AND R4,R4,#0
JSR INPUT
JSR CHECKDONE
JSR SEARCH
ADD R4,R4,#0
BRNP AGAIN
LEA R0,NOTHING
TRAP x22
LD R0,NEWLINE
TRAP x21
AGAIN BR MAIN
INPUT ST R7,SAVER7
LEA R1,INPUTTEDNAME
LEA R0,PROMPT
TRAP x22
LOOP LD R2,NEGENTER
TRAP x20
TRAP x21
STR R0,R1,#0
ADD R1,R1,#1
ADD R2,R2,R0
BRNP LOOP
LD R7,SAVER7
LD R0,ROOT
LD R6,STACKPOINTER
RET
CHECKDONE LD R3,NEGD
LD R0,INPUTTEDNAME
ADD R3,R3,R0
BRZ FIN
LD R0,ROOT
RET
FIN LEA R0,INPUTTEDNAME
LDR R0,R0,#1
LD R2,NEGENTER
ADD R2,R2,R0
BRZ DONE
LD R0,ROOT
RET
DONE TRAP x25
PROMPT .STRINGZ "Type a professor's name and then press Enter:"
NOTHING .STRINGZ "No Entry"
NEGENTER .FILL xFFF6
NEGD .FILL xFF9C
INPUTTEDNAME .BLKW #21
SAVER7 .BLKW #1
ROOT .FILL x4000
STACKPOINTER .FILL xFE00
BACK .FILL x3005
NEWLINE .FILL x0A
SEARCH ADD R6,R6,#-1
STR R7,R6,#0
ADD R6,R6,#-1
STR R0,R6,#0
LDR R1,R0,#0
BRZ SKIP
ADD R0,R1,#0
JSR SEARCH
SKIP ADD R0,R0,#1
LDR R1,R0,#0
BRZ SKIP2
JSR SEARCH
SKIP2 ADD R0,R0,#1
LEA R1,INPUTTEDNAME
LDR R4,R0,#0
LOOP3 LDR R3,R1,#0
NOT R3,R3
ADD R3,R3,#1
LDR R2,R4,#0
BRZ FINISH
ADD R2,R2,R3
BRZ SKIP3
ADD R5,R5,#1
SKIP3 ADD R4,R4,#1
ADD R1,R1,#1
BR LOOP3
FINISH LD R2,NEWLINE
ADD R2,R2,R3
BRZ SKIP4
ADD R5,R5,#1
SKIP4 ADD R5,R5,#0
BRP NOPE
ADD R0,R0,#1
LDR R0,R0,#0
JSR PRINT_NUM
LD R7,BACK
LD R6,STACKPOINTER
AND R4,R4,#0
ADD R4,R4,#1
RET
NOPE LDR R0,R6,#0
ADD R6,R6,#1
LDR R7,R6,#0
ADD R6,R6,#1
AND R5,R5,#0
AND R4,R4,#0
RET
; Subroutine that prints a positive 2's complement number on the display
; Input Register: R0 (positive 2's complement number)
; Output Registers: None
; Algorithm: The subroutine keeps dividing the input number by 10. It stores 
;            the remainder of each division in some sequential storage growing
;            backwards. When the quotient of the division hits zero, it prints
;            the stored digits in the reverse order and returns.
PRINT_NUM        ST   R0, PRINT_NUM_SAVER0
                 ST   R1, PRINT_NUM_SAVER1
                 ST   R6, PRINT_NUM_SAVER6
                 ST   R7, PRINT_NUM_SAVER7

                 LEA  R6, PRINT_NUM_LF ; initialize the local stack pointer
PRINT_NUM_AGAIN  JSR  DIV10            ; Extract next digit by dividing by 10
                 ADD  R6, R6, #-1
                 LD   R7, PRINT_NUM_HEX30
                 ADD  R0, R0, R7       ; Convert the single digit to ASCII
                 STR  R0, R6, #0       ; push the ASCII digit onto the stack
                 ADD  R1, R1, #0
                 BRz  PRINT_NUM_DONE   ; If the quotient is zero, we are ready to print
                 ADD  R0, R1, #0
                 BR   PRINT_NUM_AGAIN
PRINT_NUM_DONE   ADD  R0, R6, #0
                 TRAP x22              ; Print all the digits in the reverse order
                 LD   R0, PRINT_NUM_SAVER0
                 LD   R1, PRINT_NUM_SAVER1
                 LD   R6, PRINT_NUM_SAVER6
                 LD   R7, PRINT_NUM_SAVER7
                 RET

PRINT_NUM_STACK  .BLKW 5
PRINT_NUM_LF     .FILL x000A  
PRINT_NUM_NULL   .FILL x0000
PRINT_NUM_HEX30  .FILL x0030
PRINT_NUM_SAVER0 .BLKW 1
PRINT_NUM_SAVER1 .BLKW 1
PRINT_NUM_SAVER6 .BLKW 1
PRINT_NUM_SAVER7 .BLKW 1

; Subroutine for dividing a number by 10
; Input: R0 (the dividend)
; Outputs: R0 (the remainder), R1(the quotient)
DIV10            AND  R1, R1, #0
DIV10_AGAIN      ADD  R0, R0, #-10
                 BRn  DIV10_DONE
                 ADD  R1, R1, #1
                 BR   DIV10_AGAIN
DIV10_DONE       ADD  R0, R0, #10
                 RET
.END
