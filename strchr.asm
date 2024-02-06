bits 64
global my_strchr

section .text
        my_strchr:
                mov rax, rdi
                begin:
                cmp byte [rax], 0
                je end
                inc rax
                end:
                ret