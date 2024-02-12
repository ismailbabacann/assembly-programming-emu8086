org 100h

mov dh, n   ; loop counter is n 
mov di, 2000h

 

mov si, 01h 
mov bx, 0                   

myloop:   
mov [di], si 
mov bp,si

; print the value in dl
mov cx,8  ; print 8 bits of dl
print_loop2:
    mov ah, 2    ; function code for printing a character
    mov dl, '0'  ; default character is '0'
    test bp, 10000000b  ; test the leftmost (high) bit of dl.
    jz print_zero2
    mov dl, '1'  ; if the high bit is set, change character to '1'
print_zero2:
    int 21h
    shl bp, 1  ; shift to the next bit
    loop print_loop2
mov ah, 2
mov dl,32
int 21h
add bx,si
inc si
inc di 
dec dh
jz end:      
loop myloop   

end:
    mov [di], bx

mov cx,16  ; print 8 bits of dl
print_loop:
    mov ah, 2    ; function code for printing a character
    mov dl, '0'  ; default character is '0'
    test bx, 1000000000000000b  ; test the leftmost (high) bit of dl.
    jz print_zero
    mov dl, '1'  ; if the high bit is set, change character to '1'
print_zero:
    int 21h
    shl bx, 1  ; shift to the next bit
    loop print_loop


ret
n db 5
