.data
    .text
    .align  2
    .globl  Reverse
    .ent    Reverse


Reverse:
    .frame  $fp,16,$31      # vars= 8, regs= 1/0, args= 0, extra= 0
    .mask   0x40000000,-8
    .fmask  0x00000000,0
    subu    $sp,$sp,16
    sw  $fp,8($sp)
    move    $fp,$sp
    sw  $4,16($fp)
    sw  $0,0($fp)
    sw  $0,4($fp)
$L2:
    lw  $2,16($fp)
    bne $2,$0,$L4
    j   $L3
$L4:
    lw  $2,16($fp)
    li  $3,1717960704           # 0x66660000
    ori $3,$3,0x6667
    mult    $2,$3
    mfhi    $6
    sra $3,$6,2
    sra $4,$2,31
    subu    $3,$3,$4
    move    $5,$3
    sll $4,$5,2
    addu    $4,$4,$3
    sll $3,$4,1
    subu    $2,$2,$3
    sw  $2,0($fp)
    lw  $2,16($fp)
    li  $3,1717960704           # 0x66660000
    ori $3,$3,0x6667
    mult    $2,$3
    mfhi    $6
    sra $3,$6,2
    sra $4,$2,31
    subu    $2,$3,$4
    sw  $2,16($fp)
    lw  $2,4($fp)
    move    $4,$2
    sll $3,$4,2
    addu    $3,$3,$2
    sll $2,$3,1
    lw  $3,0($fp)
    addu    $2,$2,$3
    sw  $2,4($fp)
    j   $L2
$L3:
    lw  $3,4($fp)
    move    $2,$3
    j   $L1
$L1:
    move    $sp,$fp         # sp not trusted here
    lw  $fp,8($sp)
    addu    $sp,$sp,16
    j   $31
    .end    Reverse
    .align  2
    .globl  Palindrome
    .ent    Palindrome
Palindrome:
    .frame  $fp,32,$31      # vars= 8, regs= 2/0, args= 16, extra= 0
    .mask   0xc0000000,-4
    .fmask  0x00000000,0
    subu    $sp,$sp,32
    sw  $31,28($sp)
    sw  $fp,24($sp)
    move    $fp,$sp
    sw  $0,16($fp)
    lw  $4,16($fp)
    jal Reverse
    sw  $0,20($fp)
$L6:
    lw  $2,20($fp)
    slt $3,$2,10
    bne $3,$0,$L9
    j   $L7
$L9:
    lw  $4,16($fp)
    jal Reverse
    lw  $3,16($fp)
    beq $3,$2,$L10
    lw  $4,16($fp)
    jal Reverse
    lw  $3,16($fp)
    addu    $2,$3,$2
    sw  $2,16($fp)
$L10:
    lw  $4,16($fp)
    jal Reverse
    lw  $3,16($fp)
    bne $3,$2,$L8
$L11:
$L8:
    lw  $2,20($fp)
    addu    $3,$2,1
    sw  $3,20($fp)
    j   $L6
$L7:
$L5:
    move    $sp,$fp         # sp not trusted here
    lw  $31,28($sp)
    lw  $fp,24($sp)
    addu    $sp,$sp,32
    j   $31
    .end    Palindrome
    .align  2
    .globl  main
    .ent    main

main:
    .frame  $fp,24,$31      # vars= 0, regs= 2/0, args= 16, extra= 0
    .mask   0xc0000000,-4
    .fmask  0x00000000,0
    subu    $sp,$sp,24
    sw  $31,20($sp)
    sw  $fp,16($sp)
    move    $fp,$sp
    sw  $4,24($fp)
    sw  $5,28($fp)
    jal __main
    move    $2,$0
    j   $L12

$L12:
    move    $sp,$fp         # sp not trusted here
    lw  $31,20($sp)
    lw  $fp,16($sp)
    addu    $sp,$sp,24
    j   $31
    .end    main
