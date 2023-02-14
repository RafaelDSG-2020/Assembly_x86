
section .text
global soma
soma:

    push ebp
    mov ebp,esp
    mov eax,[ebp+8]
    add eax,[ebp+12]
    leave
    ret 8
    