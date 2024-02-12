org  100h	; set location counter to 100h


start:

lea dx, msg1
mov ah, 09h
int 21h  

lea si, str1
lea di, str1  
mov ah, 01h
next:

int 21h
cmp al,0dh
je terminate
mov [di], al
inc di
jmp next

terminate:
 mov al,'$'
  mov [di],al
dothis:

dec di
mov al, [si]
cmp [di],al
jne notpalindrome
inc si 
cmp si,di
jl dothis
palindrome:
mov ah, 09h
lea dx, msg2
int 21h
jmp end
notpalindrome:
mov ah,09h
lea dx,msg3
int 21h
end:
mov ah,4ch   
int 21h


ret   ; return to the operating system.
    msg1 db 10,'enter the string:$'
    msg2 db 10,'pal:$'
    msg3 db 10,'not pal:$' 
    str1 db 50 dup(0)