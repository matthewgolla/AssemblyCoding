.ORIG x3000
AND R1,R1,#0
AND R2,R2,#0
AND R3,R3,#0
AND R4,R4,#0
AND R5,R5,#0
AND R6,R6,#0
JSR DISPLAY
MAIN JSR INPUT
JSR DISPLAY
JSR WINNER
BR MAIN
DISPLAY ST R7,SAVER7
LEA R0,BOARD
TRAP x22
LD R7,SAVER7
RET
INPUT ST R7,SAVER7
AGAIN LD R0,NEWLINE
TRAP x21
LEA R0,PLAYER
TRAP x22
ADD R1,R1,#1
AND R3,R1,#1
BRZ SECOND
LD R0,ONE
TRAP x21
BR BOTH
SECOND LD R0,TWO
LD R0,TWO
TRAP x21
BOTH LEA R0,PROMPT
TRAP x22
TRAP x20
TRAP x21
LD R3,NEGONE
ADD R3,R0,R3
BRN ERROR
LD R3,NEGSIX
ADD R3,R0,R3
BRP ERROR
LEA R2,BOARD
ADD R0,R0,#-16
ADD R0,R0,#-16
ADD R0,R0,#-16
ADD R3,R0,#0
LOOP ADD R3,R3,#-1
BRZ FOUND
ADD R2,R2,#2
BR LOOP
FOUND LDR R4,R2,#0
LD R3,NEGDASH
ADD R4,R4,R3
BRNP ERROR
AND R3,R1,#1
BRZ DOS
LD R4,O
BR SKIPDOS
DOS LD R4,X
SKIPDOS LEA R6,COL1
ADD R3,R0,#0
LOOP2 ADD R3,R3,#-1
BRZ COLFOUND
ADD R6,R6,#1
BR LOOP2
COLFOUND LDR R5,R6,#0
ADD R3,R5,#0
ADD R5,R5,#-5
LOOP3 BRZ DONE
ADD R2,R2,#12
ADD R5,R5,#1
BR LOOP3
DONE STR R4,R2,#0
ADD R3,R3,#1
STR R3,R6,#0
LD R0,NEWLINE
TRAP x21
LD R7,SAVER7
RET
ERROR ADD R1,R1,#-1
LD R0,NEWLINE
TRAP x21
LEA R0,FAIL
TRAP x22
BR AGAIN
BOARD .FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x0A
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x0A
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x0A
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x0A
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x0A
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x20
.FILL x2D
.FILL x00
SAVER7 .BLKW 1
SAVER72 .BLKW 1
TWO .FILL x32
O .FILL x4F
X .FILL x58
NEGO .FILL xFFB1
NEGX .FILL xFFA8
NEG36 .FILL xFFDC
ONE .FILL x31
NEGONE .FILL xFFCF
NEGSIX .FILL xFFCA
NEGDASH .FILL xFFD3
PLAYER .STRINGZ "Player "
PROMPT .STRINGZ ", choose a column: "
SAVER1 .BLKW 1
FAIL .STRINGZ "Invalid move. Try again."
TIED .STRINGZ "Tie Game."
WINS .STRINGZ " Wins."
COL1 .FILL x0000
COL2 .FILL x0000
COL3 .FILL x0000
COL4 .FILL x0000
COL5 .FILL x0000
COL6 .FILL x0000
NEWLINE .FILL x0A
WINNER ST R7,SAVER7
AND R3,R3,#0
LD R6, NEGO
ADD R5,R4,R6
BRZ ITSO
LD R6,NEGX
ITSO LEA R2,BOARD
NOT R4,R2
ADD R4,R4,#1
JSR QUAD2         ;0
ADD R2,R2,#2
JSR QUAD2         ;2
ADD R2,R2,#2
JSR QUAD2         ;4
ADD R2,R2,#2
JSR QUAD1         ;6
ADD R2,R2,#2
JSR QUAD1         ;8
ADD R2,R2,#2
JSR QUAD1         ;10
ADD R2,R2,#2
JSR QUAD2         ;12
ADD R2,R2,#2
JSR QUAD2          ;14
ADD R2,R2,#2
JSR QUAD2          ;16
ADD R2,R2,#2
JSR QUAD1          ;18
ADD R2,R2,#2
JSR QUAD1          ;20
ADD R2,R2,#2
JSR QUAD1         ;22
ADD R2,R2,#2
JSR QUAD2         ;24
ADD R2,R2,#2
JSR QUAD2          ;26
ADD R2,R2,#2
JSR QUAD2          ;28
ADD R2,R2,#2
JSR QUAD1          ;30
ADD R2,R2,#2
JSR QUAD1          ;32
ADD R2,R2,#2
JSR QUAD1         ;34
ADD R2,R2,#2
JSR QUAD3         ;36
ADD R2,R2,#2
JSR QUAD3         ;38
ADD R2,R2,#2
JSR QUAD3         ;40
ADD R2,R2,#8
JSR QUAD3         ;48
ADD R2,R2,#2
JSR QUAD3        ;50
ADD R2,R2,#2
JSR QUAD3        ;52
ADD R2,R2,#8
JSR QUAD3        ;60
ADD R2,R2,#2
JSR QUAD3         ;62
ADD R2,R2,#2
JSR QUAD3          ;64
ADD R3,R3,#0
BRP WON
LD R6,NEG36
ADD R5,R1,R6
BRZ TIE
LD R7,SAVER7
RET
TIE LD R0,NEWLINE
TRAP x21
LEA R0,TIED
TRAP x22
TRAP x25
WON LD R0,NEWLINE
TRAP x21
LEA R0,PLAYER
TRAP x22
AND R3,R1,#1
BRP ONEWON
LD R0,TWO
TRAP x21
BR LOL
ONEWON LD R0,ONE
TRAP x21
LOL LEA R0,WINS
TRAP x22
TRAP x25
QUAD1 ST R7,SAVER72
JSR DOWN
JSR SW
LD R7,SAVER72
RET
QUAD2 ST R7,SAVER72
JSR RIGHT
JSR DOWN
JSR SE
LD R7,SAVER72
RET
QUAD3 ST R7,SAVER72
JSR RIGHT
LD R7,SAVER72
RET
RIGHT ST R2,SAVER2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NOPE
ADD R2,R2,#2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NOPE
ADD R2,R2,#2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NOPE
ADD R2,R2,#2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NOPE
ADD R3,R3,#1
NOPE LD R2,SAVER2
RET
LEFT ST R2,SAVER2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NEIGH
ADD R2,R2,#-2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NEIGH
ADD R2,R2,#-2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NEIGH
ADD R2,R2,#-2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NEIGH
ADD R3,R3,#1
NEIGH LD R2,SAVER2
RET
DOWN ST R2,SAVER2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NO
ADD R2,R2,#12
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NO
ADD R2,R2,#12
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NO
ADD R2,R2,#12
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NO
ADD R3,R3,#1
NO LD R2,SAVER2
RET
SE ST R2,SAVER2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NOWAY
ADD R2,R2,#14
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NOWAY
ADD R2,R2,#14
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NOWAY
ADD R2,R2,#14
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NOWAY
ADD R3,R3,#1
NOWAY LD R2,SAVER2
RET
SW ST R2,SAVER2
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NO2
ADD R2,R2,#10
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NO2
ADD R2,R2,#10
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NO2
ADD R2,R2,#10
LDR R5,R2,#0
ADD R5,R5,R6
BRNP NO2
ADD R3,R3,#1
NO2 LD R2,SAVER2
RET
SAVER2 .BLKW 1
.END
