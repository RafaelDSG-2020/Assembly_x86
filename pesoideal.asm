extern	printf		         ; funcao C a ser chamada
extern scanf


section .data
msgin DB "%f", 0dh,0ah,0
msgchar DB "%c", 0dh,0ah,0
mWrite DB "O peso ideal eh: %lf",0dh,0ah,0
c1 DD 72.7
c2 DD 58.0
c3 DD 61.2
c4 DD 44.7


section .bss
resultado RESQ 1
altura RESD 1
sexo RESB 1

SECTION .text                ; secao de codigo
        global main		  ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging
    
    push altura
    push msgin
    call scanf
    add esp, 8
    
    push sexo
    push msgchar
    call scanf
    add esp, 8
    
    mov al, BYTE[sexo]
    cmp al,'m'
    je calculaPesoHomem
    cmp al,'f'
    je calculaPesoMulher
    
imprime:    
    push dword[resultado+4]
    push dword[resultado]
    push mWrite
    call printf
    add esp, 12    
    jmp end
    
    end:
    xor eax, eax
    ret
    
    
calculaPesoHomem:    
    fld dword[c1]
    fld dword[altura]
    fmulp st1
    fld dword[c2]
    fsubp st1, st0
    fstp QWORD[resultado]
    jmp imprime    
    
calculaPesoMulher:    
    fld dword[c3]
    fld dword[altura]
    fmulp st1
    fld dword[c4]
    fsubp st1, st0
    fstp QWORD[resultado]
    jmp imprime
        
    
    
    
    