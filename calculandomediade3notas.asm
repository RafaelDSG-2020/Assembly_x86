%include "io.inc"

extern scanf 
extern printf

section .data
fms db "%f", 0ah, 0

fmsss db "%.2f", 0ah, 0
div3 dd 3
section .bss
array RESD 1
veri RESQ 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging

    mov esi,array
incremente:
    push esi
    push fms
    call scanf
    inc ebx
    add esp,8
    add esi,4
    cmp ebx,3
    je FPU
    jmp incremente
FPU:
    finit

    fld DWORD[array]
    fadd DWORD[array+4]
    fadd DWORD[array+8]
    fild DWORD[div3]
    Fdiv 
    fstp QWORD [veri]

    
    push DWORD[veri+4]
    push DWORD[veri]
    push fmsss
    call printf
    add esp,12
    xor eax, eax
    ret