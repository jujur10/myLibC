bits 64
global strpbrk

section .text
        check:
                mov r10b, byte [rsi]
                cmp r10b, 0
                je check_failure
                cmp byte [rdi], r10b
                je check_success
                inc rsi
                jmp check

                check_success:
                mov rax, 0
                ret

                check_failure:
                mov rax, 1
                ret

        strpbrk:
                cmp byte [rsi], 0
                je failure
                cmp byte [rdi], 0
                je failure
                mov r8, rdi     ; Save source
                mov r9, rsi     ; Save accept ptr

                begin:
                cmp byte [r8], 0
                je failure
                mov rdi, r8
                mov rsi, r9
                call check
                cmp rax, 0
                je success
                inc r8
                jmp begin

                failure:
                xor rax, rax
                ret

                success:
                mov rax, r8
                ret