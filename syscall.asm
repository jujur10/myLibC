bits 64
global syscall

section .text
        syscall:
        mov rax, rdi
        mov rdi, rsi
        mov rsi, rdx
        mov rdx, r10
        mov r10, r8
        mov r8, r9
        mov r9, [rsp + 8]
        syscall
        cmp rax, -1
        jle error
        ret

        error:
        mov rax, -1
        ret