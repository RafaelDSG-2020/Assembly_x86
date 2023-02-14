%include "io.inc"

extern	printf		         
extern  scanf  

section .data
fms db "%lu", 0 

section .bss
num1 resd 1
num2 resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp		     
    mov  ebp,esp
    push num1
    push fms
    call scanf
    push num1+4
    push fms
    call scanf
    push DWORD[num1]
    push DWORD[num1+4]
   

    
    call soma2
   
    xor eax, eax
    ret
    
soma2:
    
    push ebp
    mov ebp, esp
    mov eax,[ebp+8] ;--- O numero a ser adicionado é pelas quantidades de instruçoes que estão dentro dessa funçao soma
    
    
    mov ebx,[ebp+12]
    add eax,ebx
    mov esp,ebp
    pop ebp
    ret 8