bits 64
global strncmp

section .text
        strncmp:
        cmp rdx, 0
        je zero
        dec rdx

        begin:
        mov cl, byte [rdi]
        mov r9b, byte [rsi]
        cmp cl, 0
        je end
        cmp r9b, 0
        je end
        cmp cl, r9b
        jne end
        inc rdi
        inc rsi
        cmp rdx, 0
        jle end
        dec rdx
        jmp begin

        zero:
        xor rax, rax
        ret

        end:
        xor rax, rax
        xor r8, r8
        mov al, cl
        mov r8b, r9b
        sub rax, r8
        ret
