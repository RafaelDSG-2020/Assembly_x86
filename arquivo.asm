
%include "io.inc"

section .data
localarquivo Db "/Desktop/Codigos/arquivo.txt",0 ; Endereço absoluto aonde vai ser criado o Arquivo

String Db "Testano o Conteudo", 0ah, 0dh ; Conteudo que vai ser utilizado

Tamanho EQU $-String; tamanho da string para utilizar

section .bss

texto RESD 1 ; local aonde vai ser guardado o arquivo

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    ;Criação do Arquivo para ser utilizado
    
    mov eax,8   ; Numero do procedimento que vai ser utilziado
    mov ebx,localarquivo    ; Nome do Arquivo
    mov ecx,0777o           ; Disponibilização de permissões do sistema para que possa fazer as operações do arquivo; Nesse caso tem a maxima permissão
    int 0x80    ; Chamada do Kernel linux
    
    
    mov [texto],eax
     
    ; escrita do arquivo
   
    mov edx,Tamanho  ; tamanho da saida
    mov ecx,String   ; operação de escrita   
    mov ebx,[texto]  ;       
    mov eax,4            
    int 0x80    
    
    ; FECHANDO O ARQUIVO
    
    mov eax,6   ; chamada de sistema para iniciar o fechamento            
    mov eax,[texto] ; informa o arquivo que deve ser fechado
    int 0x80
    ;write your code here
    xor eax, eax
    ret