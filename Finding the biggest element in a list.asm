org 100h

.data
LISTE DW 1020h, 405h, 9988h, 100h, 8998h, 250h

.code
MOV CX, 5
LEA DI, LISTE  ; Listenin adresini DI'ye yükle
MOV AX, [DI]   ; Listenin ilk elemanýný AX'e yükle
ADD DI, 2      ; DI'yi bir sonraki elemana taþý

ARA:
LOOP_COUNTER:
CMP CX, 0
JE SON

CMP AX, [DI]
JGE BUYUK_ATLA

TASIMA:
MOV AX, [DI]
BUYUK_ATLA:
ADD DI, 2  ; Bir sonraki elemana geç
DEC CX     ; CX'i azalt
JMP ARA    ; Kontrolü tekrar et

SON:
HLT