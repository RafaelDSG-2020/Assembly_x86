
%include "io.inc"

extern printf

%define BUF_SIZE 1

section .data
in_file_err_msg db 'Input file open error.',0
in_file_name db "/home/rafael/Desktop/teste.asm",0
fms db "%lu",0


section .bss
fd_in resd 1
in_buf resd BUF_SIZE
cont RESD 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;add DWORD[cont],1
    
    mov EAX,5            
    mov EBX,in_file_name 
   ; mov EBX,1936016431
    mov ECX,0            
    mov EDX,0        
    int 0x80
    mov [fd_in],EAX    

    cmp EAX,0
    jge S0
    mov ebx,ecx
    push in_file_err_msg
    call printf
    mov ecx,ebx
    add esp,8
    mov esp,ebp
   
    jmp saida
    
    ler_arquivo: 
 ; read input file
    mov EAX,3             ;file read
    mov EBX, [fd_in]      ;file descriptor
    mov ECX, in_buf       ;input buffer
    mov EDX, BUF_SIZE     ;size
    int 0x80
    ret
    
    
S0:
    mov eax,[in_buf]
    cmp eax,10
    je done
    call ler_arquivo
    call VerifiqueP
    cmp bl,1
    je s1
    jmp S0
    
s1:
    call ler_arquivo
    call VerifiqueR
    cmp bl,1
    je s2
    jmp S0  
    
s2:
    call ler_arquivo
    call VerifiqueO
    cmp bl,1
    je s3
    jmp S0
s3:
    call ler_arquivo
    call VerifiqueC
    cmp bl,1
    je s4
    jmp S0  
s4:
    call ler_arquivo
    call VerifiqueE
    cmp bl,1
    je s5
    jmp S0      
s5:
    call ler_arquivo
    call VerifiqueS
    cmp bl,1
    je s6
    jmp S0
s6:
    call ler_arquivo
    call VerifiqueS
    cmp bl,1
    je s7
    jmp S0  
s7:
    call ler_arquivo
    call VerifiqueA
    cmp bl,1
    je s8
    jmp S0  
s8:
    call ler_arquivo
    call VerifiqueD
    cmp bl,1
    je s9
    jmp S0  
s9:
    call ler_arquivo
    call VerifiqueO
    cmp bl,1
    je s10
    jmp S0                  
s10:
    call ler_arquivo
    call VerifiqueR
    cmp bl,1
    je s11
    jmp S0 
s11:
    mov eax,0
    inc eax
    add DWORD[cont],eax
    jmp S0    
                                                              
VerifiqueP:
    enter 0,0
    mov eax,0
    mov eax,[in_buf]
    mov bl, 0
    cmp eax,'p'
    jne fim_valida_caractere
    mov bl, 1
    fim_valida_caractere:
    leave
    ret 
    ;processador
VerifiqueR:  
    enter 0,0
    mov eax,0
    mov eax,[in_buf]
    mov bl, 0
    cmp eax,'r'
    jne fim_valida
    mov bl, 1
    fim_valida:
    leave
    ret 
VerifiqueO:  
    enter 0,0
    mov eax,0
    mov eax,[in_buf]
    mov bl, 0
    cmp eax,'o'
    jne fim_validaO
    mov bl, 1
    fim_validaO:
    leave
    ret 
VerifiqueC:  
    enter 0,0
    mov eax,0
    mov eax,[in_buf]
    mov bl, 0
    cmp eax,'c'
    jne fim_validaC
    mov bl, 1
    fim_validaC:
    leave
    ret 
VerifiqueE:  
    enter 0,0
    mov eax,0
    mov eax,[in_buf]
    mov bl, 0
    cmp eax,'e'
    jne fim_validaE
    mov bl, 1
    fim_validaE:
    leave
    ret 
VerifiqueS:  
    enter 0,0
    mov eax,0
    mov eax,[in_buf]
    mov bl, 0
    cmp eax,'s'
    jne fim_validaS
    mov bl, 1
    fim_validaS:
    leave
    ret 
;VerifiqueSS:  
;    enter 0,0
;    mov eax,0
;    mov eax,[in_buf]
 ;   mov bl, 0
 ;   cmp eax,'s'
 ;   jne fim_validaSS
 ;   mov bl, 1
 ;   fim_validaSS:
 ;   leave
 ;   ret
VerifiqueA:  
    enter 0,0
    mov eax,0
    mov eax,[in_buf]
    mov bl, 0
    cmp eax,'a'
    jne fim_validaA
    mov bl, 1
    fim_validaA:
    leave
    ret      
VerifiqueD:  
    enter 0,0
    mov eax,0
    mov eax,[in_buf]
    mov bl, 0
    cmp eax,'d'
    jne fim_validaD
    mov bl, 1
    fim_validaD:
    leave
    ret 
;VerifiqueOO:  
;    enter 0,0
 ;   mov eax,0
 ;   mov eax,[in_buf]
 ;   mov bl, 0
 ;   cmp eax,'o'
 ;   jne fim_validaOO
 ;   mov bl, 1
 ;   fim_validaOO:
 ;   leave
 ;   ret 
;VerifiqueRR:  
 ;   enter 0,0
 ;   mov eax,0
  ;  mov eax,[in_buf]
  ;  mov bl, 0
  ;  cmp eax,'r'
  ;  jne fim_validaRR
  ; mov bl, 1
  ;  fim_validaRR:
  ;  leave
   ; ret 

    
    
    
    done:
    push DWORD[cont]
    push DWORD fms
    mov ebx,ecx
    call printf
    mov ecx,ebx
    add esp,8
    mov esp,ebp
    jmp saida

saida:    
    xor eax,eax
    ret

