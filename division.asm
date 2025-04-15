section .data
    answer_1 dq 0
    answer dq 0
    tally dq 0
    item1 dq 10
    item2 dq 5000

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    xor rax, rax
    call divide
    ret
    
divide:
    mov rax, [item1]
    mov rbx, [item2]
    mov rcx, [item2]
    mov rdx, [tally]
    call divide2
    sub rdx, 1
    add rbx, rax
    mov [answer_1], rbx
    mov [answer], rdx
    ret
    
divide2:
    add rdx, 1
    sub rbx, rax
    cmp rbx, 0

    jge divide2
    ret

