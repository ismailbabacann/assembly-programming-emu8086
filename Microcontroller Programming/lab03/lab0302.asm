
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
mov cx,number; loop counter equalized to number

mov bl,2 ; divider starts from 2 
loop1:       ;Start loop
cmp al,1 ;to break loop
je notsquare; loop ended not a square
mov ax,number ;ax register prepared for divison
div bl   ;ax divided by bl result stored in ah and al
cmp ah,0 ;ah stores reminder if equals zero means that no reminder
je issquarecheck 
inc bl
loop loop1


issquarecheck:
cmp al,bl  ;al stores the divison value
je end ;if equals number is a square
inc bl ;increase bl to solve inf
jmp loop1 ;go to loop again to try higher numbers



notsquare:
mov issquare,0
end:
ret
issquare db 1
number dw 123



