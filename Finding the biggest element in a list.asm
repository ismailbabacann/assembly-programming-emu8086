org 100h

.data
LISTE DW 1020h, 405h, 9988h, 100h, 8998h, 250h

.code
MOV CX, 5
LEA DI, LISTE  ; Listenin adresini DI'ye y�kle
MOV AX, [DI]   ; Listenin ilk eleman�n� AX'e y�kle
ADD DI, 2      ; DI'yi bir sonraki elemana ta��

ARA:
LOOP_COUNTER:
CMP CX, 0
JE SON

CMP AX, [DI]
JGE BUYUK_ATLA

TASIMA:
MOV AX, [DI]
BUYUK_ATLA:
ADD DI, 2  ; Bir sonraki elemana ge�
DEC CX     ; CX'i azalt
JMP ARA    ; Kontrol� tekrar et

SON:
HLT