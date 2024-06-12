;;; Directives
    PRESERVE8
    THUMB       
 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported

    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
 
__Vectors 
    DCD  0x20001000 
      ; stack pointer value when stack is empty
    DCD  Reset_Handler  ; reset vector
    ALIGN
 
; The program
; Linker requires Reset_Handler
    AREA    MYCODE, CODE, READONLY
 
    ENTRY
    EXPORT Reset_Handler

Reset_Handler
;;;;;;;;;;User Code Starts from the next line;;;;;;;;;;;;

   ; R1 = 0x46A1F1B7
   MOV R1, #0x46000000
   ORR R1, #0xA10000
   ORR R1, #0xF100
   ORR R1, #0xB7
   
   ; R2 = 0xFFFF0000
   MOV R2, #0xFF000000
   ORR R2, #0xFF0000
		
   AND R3, R1, R2
   ORR R4, R1, R2
   EOR R5, R1, R2
   BIC R6, R1, R2
   MVN R7, R2
		
STOP  
   B  STOP    
   
   END	;End of the program
