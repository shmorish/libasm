.section __TEXT,__text,regular,pure_instructions
.globl _ft_strdup

_ft_strdup:
    test %rdi, %rdi
    jz Lnull_return
    
    push %rbp
    mov %rsp, %rbp
    push %rdi
    
    call _ft_strlen
    inc %rax
    mov %rax, %rdi
    
    call _malloc
    test %rax, %rax
    jz Lmalloc_failed
    
    mov %rax, %rdi
    pop %rsi
    push %rdi
    
    call _ft_strcpy
    pop %rax
    
    leave
    ret

Lnull_return:
    xor %rax, %rax
    ret

Lmalloc_failed:
    add $8, %rsp
    leave
    xor %rax, %rax
    ret