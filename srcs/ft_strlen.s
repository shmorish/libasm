.section .text
.globl ft_strlen

ft_strlen:
    xor %rax, %rax
    test %rdi, %rdi
    jz Ldone

Lloop:
    cmpb $0, (%rdi,%rax)
    je Ldone
    inc %rax
    jmp Lloop

Ldone:
    ret