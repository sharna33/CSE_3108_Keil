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
 ;High Level Code
 ; if (i == j)
 ;   f = g + h;
 ; f = f – i;
 
 ;R0=f, R1=g, R2=h, R3=i, R4=j
 MOV R3, #2
 MOV R4, #2
 
 MOV R0, #0
 MOV R1, #3
 MOV R2, #4
 
 CMP R3, R4      ; set flags with R3-R4
 BNE L1          ; if i!=j, skip if block
 ADD R0, R1, R2  ; f = g + h
L1
 SUB R0, R0, R3  ; f = f - i
		
STOP  
   B  STOP    
   
   END	;End of the program
