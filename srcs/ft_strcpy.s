.section __TEXT,__text,regular,pure_instructions
.globl _ft_strcpy

_ft_strcpy:
    mov %rdi, %rax
    test %rdi, %rdi
    jz Ldone
    test %rsi, %rsi
    jz Ldone

Lloop:
    movb (%rsi), %cl
    movb %cl, (%rdi)
    test %cl, %cl
    jz Ldone
    inc %rdi
    inc %rsi
    jmp Lloop

Ldone:
    ret