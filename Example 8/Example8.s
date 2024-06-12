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
  ; int array[5];
  ; array[0] = 2;
  ; array[1] = array[0] * 8;

  ; R0 = array base address
  MOV R0, #0x20000000  ; R0 = 0x20000000
    ; writeable portion of memory starts 
    ; from 0x20000000. To check memory 
    ; range, go to Debug -> Memory Map in     
    ; uvision

  MOV R1, #2       ; R1 = array[0] = 2
  STR R1, [R0]     ; array[0] = R1

  LDR R1, [R0]     ; R1 = array[0]
  LSL R1, R1, #3   ; R1 = R1 << 3 = R1*8
  STR R1, [R0, #4] ; array[1] = R1		
STOP  
   B  STOP    
   
   END	;End of the program
