
.data
space: .asciiz "\n"
 prompt: .asciiz "Please enter a number: "

.text

main:
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $s2, $v0

addi $s2, $s2, -1


li $s1, 0
li $s3, 10

for:
    bgt $s1,$s2,done
    addi $s3,$s3,1
    jal loop
    j for

loop:

move $a1, $s3

move $t3, $a1
     xor $a2, $a2, $a2
     li $t1, 10
     beqz $a1, end

flip:
     divu $a1, $t1
     mflo $a1
     mfhi $t2
     mul $a2, $a2, $t1
     addu $a2, $a2, $t2
     bgtz $a1, flip


end:
beq $a2, $t3, match

j $ra


match:
move $a0, $t3
li $v0, 1
syscall

li $v0, 4
la $a0, space
syscall

addi $s1, $s1, 1

j $ra

done:

li $v0, 10
syscall
