
;;; Directives
    PRESERVE8
    THUMB

; Vector Table Mapped to 
; Address 0 at Reset
; Linker requires __
; Vectors to be exported

    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors
    DCD  0x20001000 
    ; stack pointer value 
    ; when stack is empty
    DCD  Reset_Handler  
    ; reset vector
    ALIGN

; The program
; Linker requires Reset_Handler
    AREA    MYCODE, CODE, READONLY

    ENTRY
    EXPORT Reset_Handler
Reset_Handler
;;;;;;;;;;User Code Starts;;;;;;;;;;;;
; int i, sum = 0;
; for (i = 1; i <= 10; i++)
;     sum = sum + 5;
; }

MAIN
    SUB SP, SP, #8     ; Allocate space on the stack for i and sum
    MOV R0, #1         ; Initialize i to 1
    STR R0, [SP, #0]   ; Store 1 into i (SP+0)

    MOV R1, #0         ; Initialize sum to 0
    STR R1, [SP, #4]   ; Store 0 into sum (SP+4)

loop
    LDR R0, [SP, #0]   ; Load i from stack into R0
    CMP R0, #10        ; Compare i with 10
    BGT end_loop       ; If i > 10, exit loop

    LDR R1, [SP, #4]   ; Load sum from stack into R1
    ADD R1, R1, #5     ; sum = sum + 5
    STR R1, [SP, #4]   ; Store updated sum back to stack

    ADD R0, R0, #1     ; i = i + 1
    STR R0, [SP, #0]   ; Store updated i back to stack
    B loop             ; Repeat the loop

end_loop
    ADD SP, SP, #8     ; Deallocate space from the stack
    B STOP             ; Infinite loop to stop program

STOP 
    END    ; End of the program