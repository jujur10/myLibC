bits 64
global strstr

section .text
        is_word:
                begin:
                mov cl, byte [rdi]
                mov dl, byte [rsi]
                cmp dl, 0
                je success
                cmp cl, 0
                je failure
                cmp cl, dl
                je incr
                jmp failure

                incr:
                inc rdi
                inc rsi
                jmp begin

                success:
                mov rax, 0
                ret

                failure:
                mov rax, 1
                ret

        strstr:
                mov r8, rdi     ; Save src
                mov r9, rsi     ; Save to_find
                cmp rdi, rsi
                je success_str
                cmp rsi, 0
                je success_str

                begin_str:
                cmp byte [r8], 0
                je failure_str
                mov rdi, r8
                mov rsi, r9
                call is_word
                cmp rax, 0
                je success_str
                inc r8
                jmp begin_str

                success_str:
                mov rax, r8
                ret

                failure_str:
                xor rax, rax
                ret