.section __TEXT,__text,regular,pure_instructions
.globl _ft_strlen

_ft_strlen:
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