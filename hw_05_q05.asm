.data 
    msg: .asciiz "Please input a max Fibonacci number to calculate: "
    newline: .asciiz "\n"

.text
    main:
        la $a0, msg       
        li $v0, 4            
        syscall  
                 
        li $v0, 5             
        syscall 
        move $t0, $v0

        li $a0, 0
        li $v0, 1              
        syscall                
        li $a0, 32
        li $v0, 11   
        syscall                
        li $a0, 1
        li $v0, 1
        syscall           
        li $a0, 32
        li $v0, 11
        syscall               

        jal printarray_line         

        li $v0, 10              
        syscall 

printarray_line:
    addi $sp, $sp, -4       
    sw $t0, 0($sp)
    
    li $t1, 2
    blt $t1, $t0, iteration
    
    lw $t0, 0($sp)
    addi $sp, $sp, 4
    jr $ra

iteration:
    li $t2, 0
    li $t3, 1

fibonacci_number:
    add $t4, $t3, $t2
    
    move $a0, $t4         
    li $v0, 1
    syscall               
    li $a0, 32         
    li $v0, 11
    syscall               
    
    move $t2, $t3          
    move $t3, $t4
    
    addi $t1, $t1, 1        
    
    blt $t1, $t0, fibonacci_number
    
    lw $t0, 0($sp)
    addi $sp, $sp, 4
    jr $ra
