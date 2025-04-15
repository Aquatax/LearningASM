;jump.asm
extern printf
section .data
    number1 dq 42
    number2 dq 41
    fmt1 db "NUMBER1 > = NUMBER2",10,0
    fmt2 db "NUMBER1 < NUMBER2",10,0
    myword db "12"

section .bss
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    mov rax, [number1]  ;move the numbers into registers
    mov rbx, [number2]
    cmp rax,rbx         ;compare rax and rbx
    jge greater         ;rax greater or equal go to greater
mov rdi,fmt2            ;rax is smaller, continue here
mov rax,0               ;no xmm involved
    call printf         ;display whats in rdi
    jmp exit
greater:
    mov rdi,fmt1        ;put fmt1 into rdi
    mov rax,0               ;no xmm involved
    call printf
    mov rdi, fmt1
    mov rax,0
    call printf
    jmp exit
exit:
    mov rsp,rbp
    pop rbp
    ret
    