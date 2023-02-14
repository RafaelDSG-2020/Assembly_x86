; Calcular o IMC precisar do PESO EM KILOS e DA AlTURA EM METROS

extern scanf
extern printf

section .data
fms db "%f", 0ah,0
string1 db "Acima do Peso",0
string2 db "Peso Normal",0
string3 db "Abaixo do Peso",0
acima dd 30
abaixo dd 18
divi dd 2

section .bss
peso RESD 1
altura RESD 1


resultado RESQ 1

section .text
global main
main:
    mov ebp, esp; for correct debugging

    mov ebp, esp; for correct debugging
pulo:  
    push peso
    push fms
    call scanf
    add esp,8
    
    push altura
    push fms
    call scanf
    add esp,8
    
    finit
    fld DWORD[altura]
    fmul st0,st0
    fld DWORD[peso]
    fdiv st0,st1
    fstp QWORD[resultado]
    
    finit
    fild DWORD[acima]
    fld QWORD[resultado]
    fcomi st0,st1
    JAE  acimadopeso

    finit
    FLD1
    FiDIV DWORD[divi]
    fild DWORD[abaixo]
    FADD
    fld QWORD[resultado]  
    fcomi st0,st1
    JAE  pesonormal
    jmp abaixodopeso
    
    
acimadopeso:

   push string1
   call printf
   add esp,4
   mov esp,ebp  
   xor eax, eax
   ret
   
pesonormal:

   push string2
   call printf
   add esp,4
   mov esp,ebp  
   xor eax, eax
   ret
   
abaixodopeso:

   push string3
   call printf
   add esp,4
   mov esp,ebp 
   xor eax, eax
   ret
   
   