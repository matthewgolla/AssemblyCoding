.ORIG x3000
LD R6,INITIALIZER6           ;load R6 with x3000 (empty stack)
LD R0,SERVICE
LD R1,VECTOR
STR R0,R1,#0                 ;set up vector
LD R0,INTERRUPT
STI R0,KBSR                  ;set bit 14 of kbsr
LOOP LEA R0,INPUT
TRAP x22
LD R0,NEWLINE
TRAP x21
JSR DELAY
BR LOOP
INITIALIZER6 .FILL x3000
VECTOR .FILL x0180
SERVICE .FILL x1500
INTERRUPT .FILL x4000
KBSR .FILL xFE00
SAVER1  .BLKW #1
INPUT .STRINGZ "Input a capital letter from the English alphabet:"
NEWLINE .FILL x0A
DELAY   ST  R1, SAVER1
        LD  R1, COUNT
REP     ADD R1,R1,#-1
        BRnp REP
        LD  R1, SAVER1
        RET
COUNT   .FILL #65535
.END
