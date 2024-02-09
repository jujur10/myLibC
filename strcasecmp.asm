bits 64
global strcasecmp

section .text

; To lower case function

        to_lower_case:
        xor rax, rax
        cmp dil, 'A'
        jge verify
        jmp return_succ

        verify:
        cmp dil, 'Z'
        jle return_modified
        jmp return_succ

        return_modified:
        mov al, dil
        add al, 32
        ret

        return_succ:
        mov al, dil
        ret

; To lower case function

; Strcasecmp function
        strcasecmp:
                ; Temporary registers
                mov r10b, 0 ; S1 value
                mov r11b, 0 ; S2 value
                ; Saved registers
                mov r9, rdi ; S1 saved

                begin:
                ; Get uncased S1 value
                mov dil, byte [r9]
                call to_lower_case
                mov r10b, al

                ; Get uncased S2 value
                mov dil, byte [rsi]
                call to_lower_case
                mov r11b, al

                ; Compare
                cmp r10b, 0
                je failure
                cmp r11b, 0
                je failure
                cmp r10b, r11b
                jne failure
                inc r9
                inc rsi
                jmp begin

                failure:
                xor rax, rax
                xor r8, r8
                movzx rax, r10b
                movzx r8, r11b
                sub rax, r8
                ret

; Strcasecmp function