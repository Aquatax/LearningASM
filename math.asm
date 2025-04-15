section .data
    answer_1 dq 0
    answer dq 0
    tally dq 0
    item1 dq 0
    item2 dq 0
    msg db "hello world",0
section .bss
    testString resd 16
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    mov rax, 5
    mov rbx, 21
    mov [item1], rax
    mov [item2], rbx
    call divide ;item2 / item1
    call clearRegisters
    call multiply ;item1 * item2  
    call print     
    ret


print:
    mov rax, 111
    mov [testString], rax
    mov rax, 110
    mov [testString + 1], rax
    mov rax, testString
    mov rax, 1	;1 = write
    mov rdi, 1	;1 = to stdout
    mov rsi, testString	;string to display in rsi
    ;add rsi, 1
    mov rdx, 10	;length of the string without 0
    syscall
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
    ;mov dx, [answer]
    call multiply2
    mov [answer], dx
    ret

    
multiply2:
    add dx, ax
    add cx, 1
    cmp cx, bx
    jne multiply2
    ;sub dx, ax
    ;sub cx, 1
    ret