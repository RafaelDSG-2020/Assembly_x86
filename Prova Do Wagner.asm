%include "io.inc"


extern	printf		         
extern  scanf 

; mensagens a serem pŕintadas

section .data
fms db "%lu", 0 
String3 Db "Idosos",0
String2 Db "Jovens",0
String1 Db "Adultos",0
String0 Db "Valor Invalido",0
novalinha Db 0Dh, 0Ah, 0 ; faz a quebra de uma linha

section .bss
aux RESD 1; recebe o primeiro tamanho
aux2 RESD 1; recebe os valores dentro do loop
array RESD 1; recebe o array organizado

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov esi,0; vai servir de comparador para sair dos jumps.
   ; vai pegar o tamanho
    push aux
    push fms
    call scanf
    mov ebx,[aux]
   ; mov edi,[aux]
   ; vai pegar e incrementar o array
    @L:
    push aux2
    push fms
    call scanf
    mov eax,[aux2]
    mov [array+4*esi],eax
    inc esi
    dec ebx
    cmp ebx,0
    JE @C
    jmp @L
    
    ; Vai verificar o array de idades e ver qual se encontram em cada local
    
    @C:
    inc esi
    
    @L1:
    dec esi
    cmp esi,0
    
    JE SAIDA
    mov eax,[array+4*ebx]
    inc ebx
    cmp eax,0
    JL INVALIDOS
    cmp eax,59
    JG IDOSOS
    cmp eax,20
    JB JOVENS
    cmp eax,20
    JAE ADULTOS
    cmp eax,59
    jle ADULTOS
    
    
    jmp @L1
    
    ; vai uma nova linha
novaL:
    ;PRINT_STRING novalinha
    push novalinha
    call printf
    add esp, 4
    mov esp,ebp; funciona tambem sem esse mov esp,ebp
    jmp @L1
    
    ;fim do programa
SAIDA:
    ;write your code here
    xor esi,esi
    xor ebx,ebx
    xor eax,eax
    xor eax, eax
    ret
 
    
  ; Escrita das STRINGS que contem as frases     
IDOSOS:
    push String3            
 	     
    call printf	
    add  esp, 4	
    mov  esp, ebp; fazia a correção do inicio da pilha por isso antes dava errado

    
    jmp novaL
    

   
JOVENS:
    push String2            
 	     
    call printf	
    add  esp, 4	
    mov  esp, ebp
 

    jmp novaL
   
ADULTOS:
    push String1            
 	     
    call printf	
    add  esp, 4	
    mov  esp, ebp
  
    
    jmp novaL
INVALIDOS:
    
    push String0            
 	     
    call printf	
    add  esp, 4	
    mov  esp, ebp
  
    
    jmp novaL
    
    
    
    
   