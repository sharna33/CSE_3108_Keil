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

    ; R4 = a;
    ; mem[0x20000000] = 42;
    ; a = mem[0x20000000]

    MOV R1, #0x20000000
    ; writeable portion of memory starts 
    ; from 0x20000000. To check memory 
    ; range, go to Debug -> Memory Map in     
    ; uvision

    MOV R9, #42
    STR R9, [R1, #2]
    LDR R4, [R1, #2]   
    END	;End of the program
