bits 64
global my_strlen

section .text
        my_strlen:
                mov rax, rdi
                xor rcx, rcx

                loop_begin:
                cmp byte [rax], 0
                je loop_end
                inc rcx
                inc rax
                jmp loop_begin

                loop_end:
                mov rax, rcx
                ret