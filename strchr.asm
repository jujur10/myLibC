bits 64
global strchr

section .text
        strchr:
                mov rax, rdi

                begin:
                cmp byte [rax], 0
                je failure
                cmp byte [rax], sil
                je end
                inc rax
                jmp begin

                failure:
                cmp rsi, 0
                je end
                xor rax, rax
                ret

                end:
                ret