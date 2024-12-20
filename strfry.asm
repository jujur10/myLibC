bits 64
global strfry

section .text
        get_length:
        cmp byte [rdi + rax], 0
        je end_len
        inc rax
        jmp get_length

        end_len:
        ret

        strfry:
        xor rax, rax
        xor r10, r10
        xor r8, r8      ; Index
        xor rcx, rcx
        call get_length
        mov r9, rax     ; Length
        cmp r9, 0
        je end
        dec r9
        jmp begin

        swap:
        mov sil, byte [rdi + rdx]       ; Value at the randomized index
        mov cl, byte [rdi + r8] ; Current value
        mov byte [rdi + rdx], cl
        mov byte [rdi + r8], sil
        inc r8

        begin:
        rdtsc           ; Get clock (source of random)
        xor rdx, rdx    ; Clean RDX register for the remainder
        xor rax, 0x98452; Random number
        cmp r9, r8
        je end
        mov r10, r9
        inc r10
        div r10
        jmp swap

        end:
        mov rax, rdi
        ret
