
; you may customize this and other start-up templates; 
; the location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

cmp n,14
jb mes
cmp n,26
ja mes 
mov si,1
mov array[0],0
inc si
mov array[1],1 
sub n,2
mov ch,0
mov cl,n

loop1:
inc si 
mov bl,2   
mov ax,si 
mov dh, array[si-2]
mov dl, array[si-3]
div bl
cmp ah,0
je even
jmp odd

even:
add dh, dl
mov array[si-1], dh 
jmp loopend 

odd: 
sub dh, dl
mov array[si-1], dh
loop loop1 
   
loopend:
loop loop1


ret
mes:
lea si, message
mov cx, 38
mov ah, 0eh
go:     lodsb
int 10h
loop go
n db 15
array db n dup<0>
message db 'please enter a value between 14 and 26', 0

