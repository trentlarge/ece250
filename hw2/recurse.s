.data
   prompt: .asciiz "What is your desired N value: "

   .text

  recurse:
       	subu $sp, $sp, 32 #for allocating memory
       sw $ra, 8($sp)
       sw $s0, 0($sp)

       move $s0, $a0

       beqz $s0, base
       addu $a0, $a0, -1

       jal recurse

       li $a1, 0
       li $a2, 0
       addu $a1, $s0, 1
       move $a2, $a1
       add $a2, $a2, $a2
       add $a1, $a2, $a1
       add $v0, $v0, $a1
       addu $v0, $v0, -1

 pop:
      lw $s0, 0($sp)
      lw $ra, 8($sp)
      addu $sp $sp 32 # to deallocate and pop from stack
      jr $ra

      base:
           li $v0, 1
           j pop

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
