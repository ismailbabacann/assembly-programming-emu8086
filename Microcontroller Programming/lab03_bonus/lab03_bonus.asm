
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov AX,num1
mov BX,num2    

loopgcd:
mov gcd,BX
div BX
cmp DX,0
je end
mov AX,BX
mov BX,DX
mov DX,0
loop loopgcd
end: 

ret        
num1 dw 18
num2 dw 9
gcd dw 0
