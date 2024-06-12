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

    MOV R5, #17
    MOV R9, #23

    MOV R2, #4
    MOV R3, #2
    MOV R0, #0xFF
    MOV R9, #0xFF

    CMP   R5, R9 ; performs R5-R9
                 ; sets condition flags

    SUBEQ R1, R2, R3 
    ; executes if R5==R9 (Z=1)
    
    ORRMI R4, R0, R9    
    ; executes if R5-R9 is negative (N=1)		

STOP  
   B  STOP    
   
   END	;End of the program
