.data
prompt: .asciiz "Enter a number: "
result_msg: .asciiz "The factorial of the number is: "

.text
.globl factorial_program

factorial_program:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    jal factorial
    move $t0, $v0

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall

factorial:
    li $t1, 1
    beq $a0, $t1, base_case
    li $t1, 0
    beq $a0, $t1, base_case

    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    addi $a0, $a0, -1
    jal factorial

    lw $a0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8

    mul $v0, $v0, $a0
    jr $ra

base_case:
    li $v0, 1
    jr $ra