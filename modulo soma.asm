%include "io.inc"

extern scanf
extern printf
extern "soma.asm"

section .data
fms db "%lu",0



section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    push 20
    push 10
    call soma
    
    
    xor eax, eax
    ret