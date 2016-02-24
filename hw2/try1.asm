
.data

insert_into:
	.word 4 #make a 4 byte (32 bit) space in memory, ad

	Ask_Input:
		.asciiz "\Please Enter a String to Print\n" #in unused memory store this string with address Ask_Input


.text

main:

la $a0, Ask_Input #load address Ask_Input from memory and store it into arguement register 0
li $v0, 4 #loads the value 4 into register $v0 which is the op code for print string
syscall #reads register $v0 for op code, sees 4 and prints the string located in $a0

la $a0, insert_into #sets $a0 to point to the space allocated for writing a word
la $a1, insert_into #gets the length of the space in $a1 so we can't go over the memory limit
li $v0, 8 #load op code for getting a string from the user into register $v0
syscall #reads register $v0 for op code, sees 8 and asks user to input a string, places string in reference to $a0


	add	$a0, $v0, $zero
	jal	printRes	# Print
	addi	$v0, $zero, 10
	syscall			#





.data
IS_STRING: .asciiz	" is"
NOT_STRING: .asciiz	" NOT"
A_PAL_STRING: .asciiz	" a PALinDROME!"

.text

printRes:
	add	$t4, $a0, $zero	# Stash result
	addi	$v0, $zero, 4
	la	$a0, input
	syscall			# print "<WORD>"
	la	$a0, IS_STRING
	syscall			# print "is"
	bne	$t4, $zero, printResCont
		la $a0, NOT_STRING
		syscall		# print "not"

printResCont:
	la	$a0, A_PAL_STRING
	syscall			# print "a palindrome."
	jr	$ra
