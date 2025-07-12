.section .text
.globl ft_strcmp

ft_strcmp:
    test %rdi, %rdi
    jz Lnull_check
    test %rsi, %rsi
    jz Lnull_check

Lloop:
    movb (%rdi), %al
    movb (%rsi), %cl
    cmp %al, %cl
    jne Ldifferent
    test %al, %al
    jz Lequal
    inc %rdi
    inc %rsi
    jmp Lloop

Ldifferent:
    movzbl %al, %eax
    movzbl %cl, %ecx
    sub %ecx, %eax
    ret

Lequal:
    xor %eax, %eax
    ret

Lnull_check:
    cmp %rdi, %rsi
    je Lequal
    test %rdi, %rdi
    jz Ls1_null
    mov $1, %eax
    ret
Ls1_null:
    mov $-1, %eax
    ret