.data
	prompt: .asciiz "Welcome to HoopStats! You'll enter the name of a player, followed by his jersey number, and then his points per game. We will then calculate each player's JPG. Please enter DONE when finished. \n"
	space: .asciiz " "
	done: .asciiz "DONE\n"
	linebreak: .asciiz "\n"
	stringspace: .word 8
	nodespace: .word 9

.text

main:
li $v0, 4
la $a0, prompt
syscall
j nodeMaker

nodeMaker:
li $s1, 0
li $s2, 0
li $t0, 0
li $t1, 0

	li $v0, 9
	li $a0, 64
	syscall
	move $a0, $v0

	li $v0, 8
	li $a1, 64
	syscall

	move $t0, $a0
	move $s1, $t0
	la $t1, done
	move $s2, $t1

	jal checkDone

	beqz $v0, startOut

	li $v0, 9
	li $a0, 72
	syscall

	move $s0, $v0
	sw $t0, 0($s0)

	jal jpggen

	sw $s3, 64($s0)
	move $s3, $s0
	j nodeMaker

checkDone:
	lb $t6, 0($s1)
	lb $t7, 0($s2)
	bne $t6, $t7, notEqual
	beq $t6, $0, equal
	j iter

	iter:
		addu $s1, $s1, 1
		addu $s2, $s2, 1
		j checkDone

notEqual:
	li $v0, 1
	j toEnd

equal:
	li $v0, 0
	jr $ra


toEnd:
lbu $t5, 0($s1)
addu $s1, $s1, 1
bnez $t5, toEnd
addu $s1, $s1, -2
	sb $0, 0($s1)
	jr $ra

	jpggen:
		li $v0, 5
		syscall
		move $a1, $v0

		li $v0, 5
		syscall
		move $a2, $v0

		subu $a3, $a1, $a2

		sw $a3, 68($s0)
		jr $ra

startOut:
la $s4, 0($s0)

out:
	beqz $s3, print

sort:
	lw $t5, 68($s4)
	lw $t6, 68($s3)
	blt $t6,$t5, shiftMin
	lw $s3, 64($s3)
	j out

	shiftMin:
		la $s4, 0($s3)
		lw $s3, 64($s3)
		j out

	print:
		lw $t7, 68($s4)
		li $t6, 999999999


		beq $t7, $t6, end

		li $v0, 4
		lw $a0, 0($s4)
		la $a1, 0($a0)

		syscall

		li $v0, 4
		la $a0, space
		syscall

		li $v0, 1
		lw $a0, 68($s4)
		syscall

		li $v0, 4
		la $a0, linebreak
		syscall


		li $t0, 999999999


		sw $t0, 68($s4)

		la $s3, 0($s0)
		j startOut


end:
	li $v0, 10
	syscall
