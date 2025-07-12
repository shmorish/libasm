.section .text
.globl ft_read

ft_read:
    mov $0, %rax
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