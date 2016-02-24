.data
array:  .space 400
prompt: .asciiz "Enter an integer (0 to quit) :"
text:   .asciiz "After sorting, the list of integers is:"
 .text
 .globl main

main:
  la $a1, array

read_numbers:
  li $v0, 4
  la $a0, prompt
  syscall

  li $v0, 5
  syscall

  sw $v0, 0($a1)
  addiu $a1, $a1, 4

  beqz $v0, sort
  j read_numbers

sort:
  la $a1, $array

  li $v0, 4
  la $a0, text
  syscall

loop:
  lw $t0, 0($a1)
  addiu $a1, $a1, 4

  beqz $t0, done

  li $v0, 1
  move $a0, $t0
  syscall

  j loop

done:
