bits 64
global strrchr

section .text
        rindex:
        strrchr:
                mov rax, rdi
                mov rdx, rdi ; TEMP

                begin:
                cmp byte [rax], 0
                je zero_case
                cmp byte [rax], sil
                je save
                inc rax
                jmp begin

                save:
                mov rdx, rax
                inc rax
                jmp begin

                zero_case:
                cmp byte [rax], sil
                je success_zero
                jne success

                success_zero:
                ret

                success:
                cmp rdx, rdi
                je failure
                mov rax, rdx
                ret

                failure:
                xor rax, rax
                ret