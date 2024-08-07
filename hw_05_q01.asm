.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
prompt3: .asciiz "Enter the third number: "
median_msg: .asciiz "\nThe median number is: "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    jal find_median
    move $t3, $v0

    li $v0, 4
    la $a0, median_msg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall

find_median:
    ble $t0, $t1, check_t0_t2
    move $a0, $t0
    move $t0, $t1
    move $t1, $a0

check_t0_t2:
    ble $t0, $t2, check_t1_t2
    move $a0, $t0
    move $t0, $t2
    move $t2, $a0

check_t1_t2:
    ble $t1, $t2, return_t1
    move $a0, $t1
    move $t1, $t2
    move $t2, $a0

return_t1:
    move $v0, $t1
    jr $ra
