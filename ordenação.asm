%include "io.inc"



extern	printf		         ; funcao C a ser chamada
extern scanf


section .data
msgin DB "%d", 0dh,0ah
size1 DD 10
size2 DD 10
vetresiterator DD 0

section .bss
vet1 RESD 10
vet2 RESD 10
vetres RESD 20


SECTION .text                ; secao de codigo
        global main		  ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging
    mov ecx, 10
    
    mov esi, vet1 
l1: ;le vetor 1
    pushad
    push esi
    push msgin
    call scanf
    add esp, 8    
    popad
    add esi, 4
    loop l1
    
    mov ecx, 10
    mov esi, vet2   
;l2: ; le vetor 2
 ;   pushad
 ;   push esi
 ;   push msgin
 ;   call scanf
 ;   add esp, 8
 ;   popad
  ;  add esi, 4
   ; loop l2

    mov DWORD[vetresiterator], vetres 
;Ordenacao

ldestino: ; busca menor e move para o destino em vetres
    push DWORD[size1]
    push vet1
    call buscaMenor
    mov ebx, eax
    
    push DWORD[size2]
    push vet2
    call buscaMenor
    
    cmp ebx, -1
    je movVet2
    cmp eax, -1
    je movVet1
    
    push edx
    mov edx, [vet2+eax*4]
    cmp [vet1+ebx*4], edx
    pop edx
    jl movVet1
    jmp movVet2
c1:    
    cmp DWORD[size1], 0
    jg ldestino
    cmp DWORD[size2], 0
    jg ldestino 
    
    
    mov ecx, 20
    mov DWORD[vetresiterator], vetres
printResult:    
    pushad
    mov eax, DWORD[vetresiterator]
    push DWORD[eax] 
    push msgin
    call printf
    add esp, 8
    popad
    add DWORD[vetresiterator],4
    loop printResult
    
end:
    xor eax, eax
    ret
    
movVet1:
    push DWORD[size1]
    push ebx
    push vet1
    push DWORD[vetresiterator]
    call movVet
    dec DWORD[size1] 
    add DWORD[vetresiterator],4
    jmp c1
    
movVet2:
    push DWORD[size2]    
    push eax
    push vet2
    push DWORD[vetresiterator]
    call movVet   
    dec DWORD[size2] 
    add DWORD[vetresiterator],4
    jmp c1
    
    
;-------------------------------------------------------
movVet:
;Receives: posição do elemento a ser movido, endereço do vetor, posição de destino em vetres na pilha
;Returns: 
;------------------------------------------------------- 
    enter 0,0
    pushad
    
    mov esi, [ebp+8]    ;destino
    mov ebx, [ebp+12]   ;endereço vetor
    mov edx, [ebp+16]   ;valor
    mov ecx, [ebp+20]   ;tamanho
    dec ecx
      
    
    mov eax, [ebx+4*edx]
    mov [esi], eax

    mov eax, [ebx+4*ecx]
    mov [ebx+4*edx], eax
            
    popad
    leave
    ret 16
    
;-------------------------------------------------------
buscaMenor:
;Receives: endereço do vetor e tamanho na pilha
;Returns: posição menor valor em EAX
;-------------------------------------------------------
    enter 0,0
    push esi   ;salvando contexto
    push ecx   ;salvando contexto
    push edx   ;salvando contexto
    push ebx   ;salvando contexto
    push edi   ;salvando contexto
    mov esi, [ebp+8] ; endereço do vetor
    mov ecx, [ebp+12]; tamanho
testaVetorUnitario:
    cmp ecx, 1 ; testa se o vetor tem somente um elemento
    jne testaVetorVazio  ;testa se tem 
    mov eax, 0
    jmp resultado
testaVetorVazio:    
    cmp ecx, 0 ; testa se o vetor está vazio
    jne buscaVetor
    mov eax, -1
    jmp resultado 
buscaVetor:
    mov eax, 0 ;posição menor elemento
    mov edx, 1 ;posição iterador
    dec ecx    ;decrementa ecx pois começa a partir do segundo elemento
loopMenor:
    mov edi, [esi+eax*4]
    mov ebx, [esi+edx*4]
    cmp edi, ebx
    jge atualizaMenor
    
continueLoopMenor:
    inc edx   
    loop loopMenor        
    jmp resultado
    
atualizaMenor:
    mov eax, edx
    jmp continueLoopMenor         
      
resultado:    
    pop edi
    pop ebx
    pop edx
    pop ecx
    pop esi      

    leave 
    ret 8   