%include "io.inc"

extern scanf
extern printf

section .data
fms db "%lu",0
string db "Eh multiplo",0
string2 db "Nao Eh multiplo",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov esi,0


; Confere se é divisivel por 2
    mov eax,5
    mov ebx,2
    mov edx,0
    idiv ebx
    cmp edx,0
    je contador
    cmp edx,1
    je  saida2
teste_se_eh_multiplode_3:
    mov eax,6
    mov ebx,3
    mov edx,0
    idiv ebx
    cmp edx,0
    je contador

contador:
    inc esi
    cmp esi,1
    je teste_se_eh_multiplode_3
    cmp esi,2
    je saida  




saida:
    push string            	     
    call printf	

    mov  esp, ebp

saida2:
    push string2
    call printf
    mov esp,ebp


