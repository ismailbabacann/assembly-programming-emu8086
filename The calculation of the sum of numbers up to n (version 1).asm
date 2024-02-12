.DATA
LISTE DB 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
SONUC DB ? 

.CODE
ANAPROGRAM PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AX,0
    MOV CX,10
    LEA SI,LISTE  ;dizinin baslangic adresi si'ya yuklenir     
    
    BAS: MOV BL,[SI] ;TOPLAMA KISMI 
    ADC AL,BL
    INC SI
    LOOP BAS
    
    MOV SONUC,AL
    
    ANAPROGRAM ENDP
END ANAPROGRAM





