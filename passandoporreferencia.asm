%include "io.inc"

extern scanf 
extern printf

section .data
fms db "%lu",0ah

section .bss
array RESD 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov esi,array
    mov edx,esi
    mov ebx,0
l1:

    push esi
    push fms
    call scanf
    inc ebx
    add esp,8
    add esi,4
    cmp ebx,3
    je  prox
    jmp l1
prox:
    mov esi,0
    push array
    call incremente
    mov esi,0
proximo:
        
    push DWORD[array+4*esi]
    push fms
    call printf
    mov esp,ebp 
    inc esi
    cmp esi,3
    je fim
    jmp proximo
fim:      
    xor eax, eax
    ret
incremente:
    enter 0,0
    mov edx,0
    mov esi,[EBP+8]
looop:    
    
    mov eax,[esi]
    imul eax,ebx
    mov DWORD[array+edx*4],eax
    inc edx
    add esi,4
    cmp edx,3
    je saida
    jmp looop
saida:    
    leave
    ret 4