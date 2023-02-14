extern printf
extern scanf

section .data
v_peso dd 80.2, 50.5, 64.8, 40.0, 66.7, 45.3, 100.6, 30.2
v_altura dd 1.7 , 1.4 , 1.65, 0.7, 1.55 , 1.2 , 1.9  , 0.9      
msg db '%lf', 0ah, 0


section .bss
v_result RESD 8
formated_result resq 1
teste resd 1


section .text
global main
main:
    mov ebp, esp; for correct debugging
    
    push v_peso
    push v_altura
    push v_result
    call calculaIMCAVX
    add esp, 12
    
    
    
    mov eax, 0
    mov ecx, 8
    l1:
    pushad
    fld dword [v_result+4*eax]   ;load float
    fstp qword [formated_result]  ;store double (8087 does the conversion internally)
    push DWORD[formated_result+4]
    push DWORD[formated_result]
    push msg
    call printf
    add esp, 12
    popad
    inc eax
    loop l1
    
    fim:
    xor eax, eax
    ret
    
    
    calculaIMCAVX:
    push ebp
    mov ebp,esp
    
    mov edi,[ebp+16]
    mov esi,[ebp+12]
    mov edx,[ebp+8]
    
    vmovups ymm1,[esi]
    vmulps ymm1,ymm1
    vmovups ymm2,[edi]
    vdivps ymm3,ymm2,ymm1
    vmovups [edx],ymm3
    
    mov esp,ebp
    pop ebp
    ret
    
    
   ; Escreva aqui sua função