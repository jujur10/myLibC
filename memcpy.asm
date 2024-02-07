bits 64
global my_memcpy

section .text
        my_memcpy:
                mov rax, rdi
                cmp rdi, rsi
                je end

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