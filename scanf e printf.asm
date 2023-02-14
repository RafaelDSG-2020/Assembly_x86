%include "io.inc"
extern printf
extern scanf

section .data
fms db "%lu", 0
;fms db "%s",0 ----utilizado em Strings
;fms db "%c",0 ---- Utilizado para pegar caracter por caracter juntas exemplo rafa

;string db " ",0

string db " espaço ",0dh,0ah,0

section .bss
num1 resd 1
array resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
                    ; ESP---Ponteiro de Topo de Pilha ; EBP----Ponteiro de Base de Pilha
                    
 ;----------------- vai pegar o valor inicial que é refente ao tamanho do vetor
    push num1
    push fms
    call scanf
    mov eax,[num1]; aqui vai passar o valor para o registrador eax
;--------------------    
    mov [array],eax; aqui vai fazer com que o array tenha o tamanho de eax
    add esp,8
    mov esi,0     ;------faz o incremento para acessar o array
    mov ecx,eax; colocar o tamanho do registrador de loop
    
 ;----------------  Vai pegar os valores para o array e o incrementar
@SCANF:
    push num1
    push fms
    mov ebx,ecx; manobra para evitar a perda do valor de ecx que é alterado quando faz o call scanf
    call scanf
    mov ecx,ebx; manobra para devolver o tamanho em ecx e não fazer o loop morrer
    mov eax,[num1]; passa o valor para o registrador eax, pois não pode fazer movimentaçao de memoria com memoria.
    mov [array+esi*4],eax
    inc esi; incremento para acesso à memoria
    
    loop @SCANF
    

    mov ecx,esi; como ele foi incrementado tem o tamanho do vetor. Então fazendo a passagem para registrador de loop
    mov esi,0; para utilizar novamente como incrementador
    
 ;------------------------ para iniciar amostragem dos valores do array
 @PRINTF:   
    
    push DWORD[array+esi*4]; tem que colocar o tamanho do seu array,pois o montador não sabe. Nesse caso é um DWORD
    inc esi
    push DWORD fms
    mov ebx,ecx; manobra de correçao de erro de loop
    call printf
;-----Puxando a string do local     
    push string
    call printf; fazendo a chamada
;-------
    mov ecx,ebx; manobra de correcao de erro de loop
    add esp,8
    mov esp,ebp
    loop @PRINTF
    ;write your code here
    xor eax, eax
    ret