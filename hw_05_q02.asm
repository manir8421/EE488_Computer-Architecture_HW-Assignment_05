.data
   user_input: .asciiz "Input your number : "
   addition: .asciiz "Square the user input value : "

.text


   li $v0,4
   la $a0,user_input
   syscall

   li $v0,5
    syscall
   move $s0,$v0 
    move $t0,$v0 
   li $s1,0 

iteration:
    blez $t0,exit 
    add $s1,$s1,$s0 
    addi $t0,$t0,-1 
    j iteration

exit:
   li $v0,4 
   la $a0,addition
   syscall

  li $v0,1 
  move $a0,$s1
  syscall

  li $v0,10 
  syscall
