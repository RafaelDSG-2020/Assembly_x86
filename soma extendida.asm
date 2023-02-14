%include "io.inc"


section .data
num1 dd 456123h
num2 dd 10h
num3 dq 1234561111h


section .bss
result RESQ 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov eax,[num1]    ;vai guardar os valores mais significativos em EBX e os menos em EAX
    mov ebx,[num2]
    mul ebx
    add eax,[num3]
    adc edx,[num3+4]
    mov [result],eax
    mov [result+4],edx
    
    
    
    ;write your code here
    xor eax, eax
    ret