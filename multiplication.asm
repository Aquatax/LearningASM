section .data
    item1 dw 12
    item2 dw 16
    tally dw 0
    answer dw 0
    

section .text

    global main
main:
    mov rbp, rsp; for correct debugging
    mov bp, sp; for correct debugging
    call clearRegisters
    call multiply
    ret
    
clearRegisters:
    mov rax, 0
    mov rbx, 0
    mov rcx, 0
    mov rdx, 0
    ret
    
multiply:
    ;call clearRegisters
    mov ax, [item1]
    mov bx, [item2]
    mov cx, [tally]
    mov dx, [answer]
    call multiply2
    mov [answer], dx
    ret

    
multiply2:
    add dx, ax
    add cx, 1
    cmp cx, bx
    jne multiply2
    ret

    
    
    