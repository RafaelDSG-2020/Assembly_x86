%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov ecx,3
    
    mov eax,0
    mov ebx,0
    
l1:
   mov edx,ecx; Ponto para Salvar o tamanho do Loop de L1
   add eax,5
   mov ecx,2
l2:
    add ebx,5
    
      
    loop l2
    mov ecx,edx; Ponto para pegar o retorno do tamanho do Loop de L1
    loop l1
    
    PRINT_UDEC 4,eax
    NEWLINE
    PRINT_UDEC 4,ebx
    ;write your code here
    xor eax, eax
    ret