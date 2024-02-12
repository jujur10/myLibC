bits 64
global ffs

section .text
        ffs:
        xor rax, rax

        begin:
        cmp rax, 64
        je failure
        bt rdi, rax
        jc end
        inc rax
        jmp begin

        failure:
        xor rax, rax
        ret

        end:
        inc rax
        ret