%include "io.inc"

extern scanf
extern printf

section .data
fms db "%c",0

section .bss
aux RESD 1
arrayc RESD 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
mov esi,0

vet:
    push aux
    push fms
    call scanf
    add esp,8
    mov ebx,DWORD[aux]
    mov DWORD[arrayc+esi*4],ebx
    inc esi
    cmp esi,10
    je verifica
    jmp vet
    
    
verifica:
    mov esi,0
    verifi:
    mov eax,DWORD[arrayc+esi*4]  
    cmp eax,'a'
    jae verific
    cmp eax,'A'
    jae verific2
    cmp esi,10
    je saida
    
    
    
mudandoparamaiusculo:
    sub eax,32
    mov DWORD[arrayc+4*esi],eax
    inc esi
    jmp verifi
mudandoparaminusculo:
    add eax,32
    mov DWORD[arrayc+4*esi],eax
    inc esi
    jmp verifi
    
verific:
    cmp eax,'z'
    jbe mudandoparamaiusculo
verific2:
    cmp eax,'Z'
    jbe mudandoparaminusculo  
saida:
    mov esi,0
    printrando:
    push  DWORD[arrayc+esi*4]
    push fms
    call printf
    mov esp,ebp
    inc esi
    cmp esi,10
    je fim 
    jmp printrando
fim:              
    ;write your code here
    xor eax, eax
    ret