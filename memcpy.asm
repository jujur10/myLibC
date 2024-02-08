bits 64
global memcpy

section .text
        memcpy:
                mov rax, rdi

                begin:
                cmp rdx, 0
                je end
                mov ch, byte [rsi]
                mov byte [rdi], ch
                dec rdx
                inc rdi
                inc rsi
                jmp begin

                end:
                ret