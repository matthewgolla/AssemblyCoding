         .ORIG x4000

ROOT_PTR .FILL NODE1

NODE1    .FILL NODE2
         .FILL NODE4
         .FILL JOE
         .FILL #20000

NODE2    .FILL x0000
         .FILL NODE3
         .FILL DANIEL
         .FILL #24000

ALI      .STRINGZ "Ali"
DAN      .STRINGZ "Dan"

NODE4    .FILL x0000
         .FILL x0000
         .FILL ALI
         .FILL #18000

NODE3    .FILL x0000
         .FILL x0000
         .FILL DAN
         .FILL #16000

DANIEL   .STRINGZ "Daniel"
JOE      .STRINGZ "Joe"

         .END