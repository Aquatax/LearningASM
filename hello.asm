section .data
    msg db "hello there!",3
    num db 3
    char db 2, "this is for the future!", 3
    comma db ","
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    mov r9, 1
    xor rax, rax
    mov r8b, 1
    add r8b, 1
    add r8b, 1
    cmp r8b, [num]
    mov r9, char + 1
    je print
    ret
    
print:
    mov rax, 1	 ;1 = write
    mov rdi, 1	 ;1 = to stdout
    mov rsi, r9 ;string to display in rsi
    mov rdx, 1	 ;length of the string without 0
    syscall
    ;mov rax, 1	 ;1 = write
    ;mov rdi, 1	 ;1 = to stdout
    ;mov rsi, comma ;string to display in rsi
    ;mov rdx, 1	 ;length of the string without 0
    ;syscall
    cmp byte [r9], 32
    je noComma
    cmp byte [r9 + 1], 3
    je noComma
    call addcomma
noComma:
    add r9, 1
    xor r10, r10
    movzx r10, byte [r9]
    cmp r10, 3
    jne print
    ret
    
addcomma:
    mov rax, 1	 ;1 = write
    mov rdi, 1	 ;1 = to stdout
    mov rsi, comma ;string to display in rsi
    mov rdx, 1	 ;length of the string without 0
    syscall
    ret
    