bits 64
global memmove

section .text
        memmove:
        mov rax, rdi
        cmp rdi, rsi
        je end
        cmp rdi, rsi
        jb forward
        jmp set_addr_backward

        forward:
        cmp rdx, 0
        je end
        mov ch, byte [rsi]
        mov byte [rdi], ch
        dec rdx
        inc rdi
        inc rsi
        jmp forward

        set_addr_backward:
        add rdi, rdx
        add rsi, rdx
        dec rdi
        dec rsi
        jmp backward

        backward:
        cmp rdx, 0
        je end
        mov ch, byte [rsi]
        mov byte [rdi], ch
        dec rdx
        dec rdi
        dec rsi
        jmp backward

        end:
        ret