ORG 100H

MOV DH, N   ; LOOP COUNTER IS N 
MOV DI, 2000H

 

MOV SI, 01H 
MOV BX, 0                   

MYLOOP:   
MOV [DI], SI 
MOV BP,SI

; Print the value in DL
MOV CX,8  ; Print 8 bits of DL
PRINT_LOOP2:
    MOV AH, 2    ; Function code for printing a character
    MOV DL, '0'  ; Default character is '0'
    TEST BP, 10000000b  ; Test the leftmost (high) bit of DL.
    JZ PRINT_ZERO2
    MOV DL, '1'  ; If the high bit is set, change character to '1'
PRINT_ZERO2:
    INT 21h
    SHL BP, 1  ; Shift to the next bit
    LOOP PRINT_LOOP2
MOV AH, 2
MOV DL,32
INT 21h
ADD BX,SI
INC SI
INC DI 
DEC DH
JZ END:      
LOOP MYLOOP   

END:
    MOV [DI], BX

MOV CX,16  ; Print 8 bits of DL
PRINT_LOOP:
    MOV AH, 2    ; Function code for printing a character
    MOV DL, '0'  ; Default character is '0'
    TEST BX, 1000000000000000b  ; Test the leftmost (high) bit of DL.
    JZ PRINT_ZERO
    MOV DL, '1'  ; If the high bit is set, change character to '1'
PRINT_ZERO:
    INT 21h
    SHL BX, 1  ; Shift to the next bit
    LOOP PRINT_LOOP


RET
N DB 5
