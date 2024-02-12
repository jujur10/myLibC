bits 64
global my_syscall

section .text
        my_syscall:
        mov rax, rdi
        mov rdi, rsi
        mov rsi, rdx
        mov rdx, r10
        mov r10, r8
        mov r8, r9
        xor r9, r9
        syscall
        cmp rax, -1
        jl error
        ret

        error:
        mov rax, -1
        ret