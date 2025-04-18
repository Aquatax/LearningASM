section .data
    msg dq 5120000000
    num db 3
    answer_1 dq 0
    answer dq 0
    item1 dq 10
    item2 dq 0
    stringlocation dq 0
    nL dq 13
    numberOfCharacters dq 0
    returned_letter db 0
section .bss
    finalanswer resb 64
section .text
    global main
main:
    mov rbp, rsp; for correct debugging
    ;mov rbp, rsp; for correct debugging
    mov r9, 0       ;r9 is used to keep track of what location im in. eg, if the number is 46 remainder 0, r9 will be 1
    mov byte [finalanswer], 2   ;Finalanswer is the array where the values are stored backwards (eg, four hundred sixty is 064)
    mov rax, [msg]              ;This transfers the integer in msg into the division memory locations
    mov [answer], rax
    xor rdx, rdx
    jmp repeatNumbers
    jmp exit
repeatNumbers:  
    add r9, 1
    mov rdx, [answer]
    mov [item2], rdx
    call preparedivide
    xor rcx, rcx
    mov rcx, [returned_letter]
    mov [finalanswer + r9], rcx
    mov rdx, [answer]
    cmp rdx, 9
    jg repeatNumbers
    ;jmp exit
    cmp byte [answer], 0
    jg finalNumberOutput

finalNumberOutput:
    add r9, 1
    mov rdx, [answer]
    mov [answer_1], rdx
    call compareNumbers
    xor rcx, rcx
    mov rcx, [returned_letter]
    mov [finalanswer + r9], rcx
    add r9, 1
    jmp output


preparedivide:
    mov byte [item1], 10
    mov rax, [item2]
    call divide
    call compareNumbers
    ret

divide:
    mov rax, [item1]
    mov rbx, [item2]
    mov rcx, [item2]
    mov rdx, 0
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

compareNumbers:
        
    ;this expects an item in the answer_1 that is less than 10 (remainder)
        cmp byte [answer_1], 9
        jne not9
        mov byte [returned_letter], 57
    not9:
        cmp byte [answer_1], 8
        jne not8
        mov byte [returned_letter], 56
    not8:
        cmp byte [answer_1], 7
        jne not7
        mov byte [returned_letter], 55
    not7:
        cmp byte [answer_1], 6
        jne not6
        mov byte [returned_letter], 54
    not6:
        cmp byte [answer_1], 5
        jne not5
        mov byte [returned_letter], 53
    not5:
        cmp byte [answer_1], 4
        jne not4
        mov byte [returned_letter], 52
    not4:
        cmp byte [answer_1], 3
        jne not3
        mov byte [returned_letter], 51
    not3:
        cmp byte [answer_1], 2
        jne not2
        mov byte [returned_letter], 50
    not2:
        cmp byte [answer_1], 1
        jne not1
        mov byte [returned_letter], 49
    not1:
        cmp byte [answer_1], 0
        jne return
        mov byte [returned_letter], 48
    return:
        ret
    
output:
    sub r9, 1
    cmp r9, 0
    je exit
    mov rax, 1	                 ;1 = write
    mov rdi, 1	                 ;1 = to stdout
    mov r8, r9
    add r8, finalanswer
    mov rsi, r8	;string to display in rsi
    mov rdx, 1	                ;length of the string without 0
    syscall
    jmp output
    
    
exit:
    mov rax, 60
    ret
    