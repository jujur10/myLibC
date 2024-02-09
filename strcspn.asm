bits 64
global strcspn

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

        strcspn:
                xor r11, r11
                mov r8, rdi
                mov r9, rsi

                begin:
                cmp byte [r8], 0
                je end
                mov rdi, r8
                mov rsi, r9
                call check
                cmp rax, 0
                je end
                inc r8
                inc r11
                jmp begin

                end:
                mov rax, r11
                ret