
.data
 prompt: .asciiz "Please enter a number"
  true: .asciiz "they match"

.text

main:
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $s1, $v0
li $8, 11 #starting place
move $9, $zero # number found
jal runner

li $v0, 10
syscall

  runner:

  jal getter
  beq	$9,$s1,done

j runner

getter:
xor $a2, $a2, $a2  # $a2 will hold reverse integer

li $t1, 10
beqz $a1, end


flipLoop:
   divu $a1, $t1      # Divide number by 10
   mflo $a1           # $a1 = quotient
   mfhi $t2           # $t2 = reminder
   mul $a2, $a2, $t1  # reverse=reverse*10
   addu $a2, $a2, $t2 #         + reminder
   bgtz $a1, flipLoop


end:
beq $a2, $s1, matched
addi $8, $8, 1
j $ra

matched:
move $a0, $a2
li $v0, 1
syscall

addi $9, $9, 1
addi $8, $8, 1

j $ra

done:
j $ra
