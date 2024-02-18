.global arm_memset

.text
        arm_memset:
        mov r3, r0

        begin:
        cmp r2, #0
        beq end
        strb r0, r1
        sub r2, r2, #1
        b begin

        end:
        mov r0, r3
        bx lr