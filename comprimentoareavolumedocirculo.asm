%include "io.inc"

extern scanf
extern printf

section .data
fms db "%f",0
fms_out db "%.2f", 0ah,0
valor dd 2
valor2 dd 3
valor3 dd 4

section .bss
raio RESD 1
Comprimento RESQ 1
Area RESQ 1
Volume RESQ 1


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging



    mov esi,raio
    
    push esi
    push fms
    call scanf
    add esp,8
    
    finit 
    fld DWORD[raio]
    Fldpi
    fmul
    fimul DWORD[valor]
    fstp QWORD[Comprimento]     
    
    finit
    fld DWORD[raio]
    fmul st0,st0
    fldpi
    fmul
    fstp QWORD[Area]
    
    finit
    fld DWORD[raio]
    fmul st0,st0
    fld DWORD[raio]
    fmul 
    fild DWORD[valor2]
    fmul
    fldpi 
    fmul
    fild DWORD[valor3]
    fdiv   
    fstp QWORD[Volume]
    
    
    push Dword[Comprimento+4]
    push Dword[Comprimento]
    push fms_out
    call printf
    add esp,12
    
    push Dword[Area+4]
    push Dword[Area]
    push fms_out
    call printf
    add esp,12
    
    push Dword[Volume+4]
    push Dword[Volume]
    push fms_out
    call printf
    add esp,12
    
    ;write your code here
    xor eax, eax
    ret