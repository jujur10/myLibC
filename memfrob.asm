bits 64
global memfrob

section .text
        memfrob:
        mov rax, rdi

        begin:
        cmp rsi, 0
        je end
        mov dl, byte [rdi]
        xor dl, 42
        mov byte [rdi], dl
        inc rdi
        dec rsi
        jmp begin

        end:
        ret