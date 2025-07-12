.section __TEXT,__text,regular,pure_instructions
.globl _ft_write

_ft_write:
    mov $0x2000004, %rax
    syscall
    jc Lerror
    ret

Lerror:
    neg %rax
    mov %rax, %rdi
    call ___error
    mov %edi, (%rax)
    mov $-1, %rax
    ret