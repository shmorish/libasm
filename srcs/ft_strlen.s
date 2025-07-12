.section __TEXT,__text,regular,pure_instructions
.globl _ft_strlen
.p2align 2

_ft_strlen:
    mov x1, #0
    cbz x0, Ldone

Lloop:
    ldrb w2, [x0, x1]
    cbz w2, Ldone
    add x1, x1, #1
    b Lloop

Ldone:
    mov x0, x1
    ret