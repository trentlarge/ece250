


.text
main:
li $v0, 5 # code to read an integer
syscall # do the read (invokes the OS)
move $a0, $v0 # copy result from $v0 to $a0
li $v0, 1 # code to print an integer
syscall # print the integer
li $v0, 4 # code to print string
la $a0, nln # address of string (newline)
syscall
li $v0, 8 # code to read a string
la $a0, name # address of buffer (name)
li $a1, 8 # size of buffer (8 bytes)
syscall
la $a0, name # address of string to print
li $v0, 4 # code to print a string
syscall
jr $31 # return
.data
.align 2

name: .word 0,0
nln: .asciiz "\n"
