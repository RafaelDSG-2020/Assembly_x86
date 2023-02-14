; Exemplo de entrada a4@

%include "io.inc"

extern printf
extern scanf

section .data
fms db "%s",0
string1 db "palavra reconhecida",0
string2 db "palavra nao reconhecida",0

section .bss
aux RESD 1
array RESD 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    call lerpalavra1
    call valpalavra1
    cmp bl,1
    je s0
saida:
    xor eax, eax
    ret

    lerpalavra1:
    
    enter 0,0
    push aux
    push fms
    call scanf
    mov eax,[aux]
    mov DWORD[array],eax
    push aux
    push fms
    call scanf
    mov eax,[aux]
    mov DWORD[array+4],eax
    push aux
    push fms
    call scanf
    mov eax,[aux]
    mov DWORD[array+8],eax
    leave
    ret    
    
   
    valpalavra1:
   
    enter 0,0
    mov bl, 0
    mov al,[array]
    cmp al, 'a'
    jb fim_valida_caractere
    cmp al, 'z'
    ja fim_valida_caractere
    mov bl, 1
    fim_valida_caractere:
    leave
    ret 
     
    validanum:
   
    enter 0,0
    mov bl,0
    mov al,[array+4]
    cmp al, '0'
    jb fim_valida
    cmp al, '9'
    ja fim_valida
    mov bl, 1
    fim_valida:
    leave
    ret 
    valarroba:
    enter 0,0
    mov bl,0
    mov al,[array+8]
    cmp al, '@'
    jne fim
    mov bl, 1
    fim:
    leave
    ret 
    valpont:
    enter 0,0
    mov bl,0
    mov al,[array+8]
    cmp al,'*'
    jne fim_pont
    mov bl, 1
    fim_pont:
    leave
    ret     
      
s0:
    call validanum
    cmp bl,1
    je s1 
    jmp erro   

s1:
    call valarroba
    cmp bl,1
    je valido
    call valpont
    cmp bl,1
    je valido
    jmp erro


valido:
    push string1                 
    call printf	
    add  esp, 4	
    mov  esp, ebp
    jmp saida

erro:
    push string2                 
    call printf	
    add  esp, 4	
    mov  esp, ebp
    jmp saida