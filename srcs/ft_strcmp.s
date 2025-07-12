.section __TEXT,__text,regular,pure_instructions
.globl _ft_strcmp
.p2align 2

_ft_strcmp:
    mov x2, #0
    cbz x0, Lnull_check
    cbz x1, Lnull_check

Lloop:
    ldrb w3, [x0, x2]
    ldrb w4, [x1, x2]
    cmp w3, w4
    bne Ldifferent
    cbz w3, Lequal
    add x2, x2, #1
    b Lloop

Ldifferent:
    sub w0, w3, w4
    sxtw x0, w0
    ret

Lequal:
    mov x0, #0
    ret

Lnull_check:
    cmp x0, x1
    beq Lequal
    cbz x0, Ls1_null
    mov x0, #1
    ret
Ls1_null:
    mov x0, #-1
    ret