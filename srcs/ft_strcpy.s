.section __TEXT,__text,regular,pure_instructions
.globl _ft_strcpy
.p2align 2

_ft_strcpy:
    mov x2, #0
    mov x3, x0
    cbz x0, Ldone
    cbz x1, Ldone

Lloop:
    ldrb w4, [x1, x2]
    strb w4, [x0, x2]
    cbz w4, Ldone
    add x2, x2, #1
    b Lloop

Ldone:
    mov x0, x3
    ret