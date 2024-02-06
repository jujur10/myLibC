bits 64
global my_strrchr
extern my_strlen

section .text
        my_strrchr:
                mov rdx, rdi
                call my_strlen
                mov rcx, rax
                mov rax, rdx
                add rax, rcx
                sub rax, 1

                begin:
                cmp byte [rax], 0
                je failure
                cmp byte [rax], sil
                je success
                dec rax
                jmp begin

                failure:
                xor rax, rax
                ret

                success:
                ret