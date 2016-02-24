.data

  .text #enables text input / output, kind of like String.h in C++

main:

li $v0, 5
syscall
move $t0, $v0

ori $8, $0, 0x0

jar loop

move $a0, $t0
li $v0, 1 #loads the value 4 into register $v0 which is the op code for print string
syscall #reads register $v0 for op code, sees 4 and prints the string located in $a0


	li $v0, 10 #loads op code into $v0 to exit program
	syscall #reads $v0 and exits program


    loop:
bgt $8,$t0,exit

addi $8,$8,1
addi $9, $8, 9

addi $10,$9,-9

addi $11, $9, -1

ori $12, $0, 0x9

div $11,$12
mfhi $13

mult $10, $13
mfhi $14

j loop




 (n-9*floor((n-1)/9))*(10^floor((n+8)/9)-1)/9))
 n+9;
