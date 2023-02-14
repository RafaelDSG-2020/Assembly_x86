%include "io.inc"

extern scanf
extern printf

section .data
fms db "%f",0
fms_out db "%.2f", 0
valor2 dd 32
valor3 dd 180
valor4 dd 100
section .bss
valor RESD 1
veri RESQ 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov esi,valor
    
    push esi
    push fms
    call scanf
   ; mov esp,ebp
    add esp,8
    add esi,4
    call conversao

   
    mov esp,ebp
    jmp saida
saida:    
    xor eax,eax
    ret  
    
conversao:
    ; 180*(valor+32)/100
    enter 0,0
    mov esi,[EBP+8]
    finit
    fld DWORD[valor]
    fiadd DWORD[valor2]
    fimul DWORD[valor3]
    fidiv DWORD[valor4]
    
    
    Fstp QWORD[veri]
    push DWORD[veri+4]
    push DWORD[veri]
    push fms_out
    call printf
    add esp,12
    leave
    ret 8
    
    
   ; xor eax, eax
   ; ret
  
    
    
    ;write your code here
    