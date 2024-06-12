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
   
   ; R1 = 0xFFFFFF00
   MOV R1, #0xFF000000
   ORR R1, #0xFF0000
   ORR R1, #0xFF00
   ORR R1, #0x00
		
   MOV R2, #4
   LSL R3, R1, #4
   LSR R4, R1, #4 
   ASR R5, R1, R2
   ROR R6, R1, #3		

STOP  
   B  STOP    
   
   END	;End of the program
