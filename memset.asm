bits 64
global memset

section .text
        memset:
                mov r8, rdi

                begin:
                cmp rdx, 0
                je end
                mov byte [rdi], sil
                dec rdx
                inc rdi
                jmp begin

                end:
                mov rax, r8
                ret