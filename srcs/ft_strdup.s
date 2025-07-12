.section __TEXT,__text,regular,pure_instructions
.globl _ft_strdup

_ft_strdup:
    cbz x0, Lnull_return
    
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    str x0, [sp, #-16]!
    
    bl _ft_strlen
    add x0, x0, #1
    
    bl _malloc
    cbz x0, Lmalloc_failed
    
    mov x1, x0
    ldr x0, [sp], #16
    str x1, [sp, #-16]!
    mov x1, x0
    ldr x0, [sp], #16
    
    bl _ft_strcpy
    
    ldp x29, x30, [sp], #16
    ret

Lnull_return:
    mov x0, #0
    ret

Lmalloc_failed:
    add sp, sp, #16
    ldp x29, x30, [sp], #16
    mov x0, #0
    ret