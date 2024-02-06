bits 64
global my_strchr

section .text
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
                xor rax, rax
                ret
                end:
                ret