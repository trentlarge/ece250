.data
  prompt: .asciiz "Please enter a number"

  .text
  .globl main

  main:
      li $v0, 4
      la $a0, prompt
      syscall
      li $v0, 5
      syscall
      move $a0, $v0
      jal factfunc
      move $a0, $v0
      li $v0, 1
      syscall
      li $v0, 10
      syscall

 factfunc:
      addiu $sp, $sp, -8
      sw $ra, 4($sp)
      sw $s0, 0($sp)
      move $s0, $a0
      blez $s0, endCondition
      addi $a0, $a0, -1
      jal factfunc
      li $s1, 0
      li $s2, 0
      addi $s1, $s0, -1
      move $s2, $s1
      addu $s2, $s2, $s2
      addu $s1, $s2, $s1
      addu $v0, $v0, $s1
      addi $v0, $v0, 1

cleanUp:
     lw $s0, 0($sp)
     lw $ra, 4($sp)
     jr $ra

endCondition:
     li $v0, 2
     b cleanUp
