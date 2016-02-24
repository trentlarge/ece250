.data
   prompt: .asciiz "What is your desired N value: "

   .text

   main:
       li $v0, 4
       la $a0, prompt
       syscall

       li $v0, 5
       syscall
       move $a0, $v0

       jal recurse
       move $a0, $v0

       li $v0, 1
       syscall

       li $v0, 10
       syscall

  recurse:
       addi $sp, $sp, -8
       sw $ra, 4($sp)
       sw $s0, 0($sp)

       move $s0, $a0

       blez $s0, end
       addi $a0, $a0, -1

       jal recurse

       li $s1, 0
       li $s2, 0
       addi $s1, $s0, 1
       move $s2, $s1
       add $s2, $s2, $s2
       add $s1, $s2, $s1
       add $v0, $v0, $s1
       addi $v0, $v0, -1

 shift:
      lw $s0, 0($sp)
      lw $ra, 4($sp)
      addi $sp $sp 8
      jr $ra

 end:
      li $v0, 1
j shift
