.section .text
.globl ft_write

ft_write:
    mov $1, %rax
    syscall
    jc Lerror
    ret

Lerror:
    neg %rax
    mov %rax, %rdi
    call __errno_location@PLT
    mov %edi, (%rax)
    mov $-1, %rax
    ret