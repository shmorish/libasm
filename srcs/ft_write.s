.section __TEXT,__text,regular,pure_instructions
.globl _ft_write

_ft_write:
    mov x16, #4
    svc #0x80
    bcs Lerror
    ret

Lerror:
    neg x0, x0
    mov x1, x0
    bl ___error
    str w1, [x0]
    mov x0, #-1
    ret