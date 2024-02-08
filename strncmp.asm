bits 64
global strncmp

section .text
    strncmp:
        xor rax, rax

        begin:
        cmp rdx, 0
        je success
        mov cl, byte [rdi]
        mov dl, byte [rsi]
        cmp cl, dl
        jne failure
        inc rdi
        inc rsi
        dec rdx
        jmp begin

        success:
        ret

        failure:
        movzx rax, cl
        movzx r8, dl
        sub rax, r8
        ret