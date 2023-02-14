%include "io.inc"
section .data
matriz  dd 6, 7, 8, 9
slinha EQU ($-matriz)
qcolunas EQU slinha/4
        dd 2, 1, 5, 3
        dd 8, 5, 15, 2
qlinhas EQU ($-matriz)/slinha


section .bss
aux RESD 1
i RESD 1
j RESD 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging


    mov ecx, qlinhas
    mov esi, 0; i
l1: 
    mov [aux], ecx
    mov ecx, qcolunas
    mov edi, 0 ;j
l2:
    mov eax, qcolunas
    mul esi
    add eax, edi
    
    mov edx, [matriz+(eax*4)]
    inc edi
    loop l2
   
    mov ecx, [aux]
    inc esi
    loop l1
    
    
    xor eax, eax
    ret