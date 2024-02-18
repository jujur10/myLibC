.global strlen_arm

.text
        strlen_arm:
        eor r1, r1

        begin:
        ldrb r2, [r0], #1
        cmp r2, #0
        beq end
        add r1, r1, #1
        b begin

        end:
        mov r0, r1
        bx lr
