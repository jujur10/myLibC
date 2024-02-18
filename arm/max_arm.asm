global max_arm

section .text
        max_arm:
        eor r2, r2

        begin:
        cmp r0, #0
        beq end
        ldrb r3, [r1], #1
        cmp r3, r2
        bgt new_max
        sub r0, r0, #1
        b begin

        new_max:
        mov r2, r3
        b begin

        end:
        mov r0, r2
        bx lr
