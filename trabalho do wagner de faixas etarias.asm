%include "io.inc"

extern scanf
extern printf

section .data
fms db "%lu", 0
String0 Db "Valor Invalido",0
section .bss

aux resd 1
array resd 10
cont1 resd 1
cont2 resd 1
cont3 resd 1
cont4 resd 1
cont5 resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov esi,0
 ;   mov edx,0
    mov edi,0
    @scanf:

    push aux
    push fms
    call scanf
    mov eax,[aux]
    mov [array+esi*4],eax
    inc esi
    cmp esi,10; mudar aqui depende do tamanho do vetor
    je faixas
    loop @scanf
saida:
     ;write your code here
    xor eax, eax
    ret
faixas:
    mov esi,0
    mov edx,0
    @L:
    mov eax,[array+esi*4]
    inc esi
    cmp eax,0
    JL  @INVALIDOS
    cmp eax,21
    JB  JOVENS
    cmp eax,61
    JAE IDOSOS_61
    cmp eax,41
    JAE  ADULTOS_41_60
    cmp eax,31
    JGE ADULTOS_31_40
    cmp eax,20
    JA  ADULTOS_21_30
    

       
    

    
@INVALIDOS:
    push String0            
 	     
    call printf	
    add  esp, 4	
    mov  esp, ebp
    
JOVENS:
    push ebp
    mov ebp,esp
  ;  mov ebp+8,0
    inc ebx
    jmp @L
 ADULTOS_21_30:
    inc ecx
    jmp @L
 ADULTOS_31_40:
    inc edx
    jmp @L
ADULTOS_41_60:
    inc edi
    jmp @L
IDOSOS_61:
    mov eax,0
    inc eax
    jmp @L
   