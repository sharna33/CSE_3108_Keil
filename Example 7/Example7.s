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
; int pow = 1;
; int x   = 0;
; while (pow != 128) {
;  pow = pow * 2;
;  x = x + 1;
;}

; R0 = pow, R1 = x
  MOV R0, #1	; pow = 1
  MOV R1, #0	; x = 0

WHILE
  CMP R0, #128    ; R0-128
  BEQ DONE        ; if (pow==128) exit loop
  LSL R0, R0, #1  ; pow=pow*2
  ADD R1, R1, #1  ; x=x+1
  B   WHILE       ; repeat loop
DONE
		
STOP  
   B  STOP    
   
   END	;End of the program