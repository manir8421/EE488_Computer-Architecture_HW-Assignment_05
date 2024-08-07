.data
prompt: .asciiz "Enter a number from 0 to 15: "
result: .asciiz "Your number is: "
newline: .asciiz "\n"

# Array of pointers to hexadecimal
array: .word a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15

a0: .asciiz "0x0"
a1: .asciiz "0x1"
a2: .asciiz "0x2"
a3: .asciiz "0x3"
a4: .asciiz "0x4"
a5: .asciiz "0x5"
a6: .asciiz "0x6"
a7: .asciiz "0x7"
a8: .asciiz "0x8"
a9: .asciiz "0x9"
a10: .asciiz "0xa"
a11: .asciiz "0xb"
a12: .asciiz "0xc"
a13: .asciiz "0xd"
a14: .asciiz "0xe"
a15: .asciiz "0xf"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 0
    li $t2, 15
    blt $t0, $t1, invalid_input
    bgt $t0, $t2, invalid_input

    la $t3, array
    sll $t5, $t0, 2
    add $t3, $t3, $t5
    lw $a1, 0($t3)

    li $v0, 4
    la $a0, result
    syscall

    li $v0, 4
    move $a0, $a1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

invalid_input:
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 10
    syscall
