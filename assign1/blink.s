.equ DELAY, 0x3F0000

// configure GPIO 20 for output
ldr r0, FSEL2
mov r1, #1
mov r2, r1
add r1, r2, r1, lsl #3
add r1, r2, r1, lsl #3
add r1, r2, r1, lsl #3

str r1, [r0]

// set bit start
newloop:
mov r1, #(1<<20)
mov r3, #3

loop: 

// set GPIO high
ldr r0, SET0
str r1, [r0] 

// delay
mov r2, #DELAY
wait1:
    subs r2, #1
    bne wait1

// set GPIO low
ldr r0, CLR0
str r1, [r0] 

mov r1, r1, lsl #1
subs r3, #1

beq newloop
 
b loop

FSEL0: .word 0x20200000
FSEL1: .word 0x20200004
FSEL2: .word 0x20200008
SET0:  .word 0x2020001C
SET1:  .word 0x20200020
CLR0:  .word 0x20200028
CLR1:  .word 0x2020002C

