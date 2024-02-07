bits 64

section .text
        global my_strchr
        my_strchr:
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