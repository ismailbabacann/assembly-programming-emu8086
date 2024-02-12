
; you may customize this and other start-up templates; 
; the location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

#start=emulation_kit.exe#

inf:
mov ah,2ch              ;get time
int 21h                 ;ch = hr, cl = min, dh = sec
mov bh,dh

mov ax,0
mov bl,10
;hour
mov al,ch
div bl 
mov dx, 2030h
mov ah,0 
mov si,ax
mov al,numbers[si]
out dx,al
mov ax,0
  
mov al,ch
div bl
mov al, ah
mov dx, 2031h 
mov ah,0
mov si,ax
mov al,numbers[si]
out dx,al
mov ax,0

;dash 
mov al,10
mov dx, 2032h 
mov ah,0
mov si,ax
mov al,numbers[si]
out dx,al
mov ax,0

;minute 
mov al,cl
div bl
mov dx, 2033h 
mov ah,0
mov si,ax
mov al,numbers[si]
out dx,al
mov ax,0

mov al,cl
div bl
mov al, ah
mov dx, 2034h 
mov ah,0
mov si,ax
mov al,numbers[si]
out dx,al
mov ax,0

;dash 
mov al,10
mov dx, 2035h
mov ah,0
mov si,ax
mov al,numbers[si]
out dx,al
mov ax,0

;second 
mov al,bh
div bl 
mov dx, 2036h 
mov ah,0
mov si,ax
mov al,numbers[si]
out dx,al
mov ax,0

mov al,bh
div bl
mov al, ah
mov dx, 2037h
mov ah,0
mov si,ax
mov al,numbers[si]
out dx,al
mov ax,0 

jmp inf

ret     

numbers	db 00111111b, 00000110b, 01011011b, 01001111b, 01100110b, 01101101b, 01111101b, 00000111b, 01111111b, 01101111b, 01000000b




