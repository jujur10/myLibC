bits 64
global strcmp

section .text
        strcmp:
                begin:
                mov cl, byte [rdi]
                mov dl, byte [rsi]
                cmp byte [rdi], 0
                je failure
                cmp byte [rsi], 0
                je failure
                cmp cl, dl
                jne failure
                inc rdi
                inc rsi
                jmp begin

                failure:
                movzx rax, cl
                movzx r8, dl
                sub rax, r8
                ret