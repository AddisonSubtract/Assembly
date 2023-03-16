#Addison Zheng
#Assignment 2

.text
#prompt for x value
li $v0, 4
la $a0, xInput
syscall

#take in x value
li $v0, 5
syscall
move $s1, $v0

#prompt for y value
li $v0, 4
la $a0, yInput
syscall

#take in y value
li $v0, 5
syscall
move $s2, $v0

#prompt for z value
li $v0, 4
la $a0, zInput
syscall

#take in z value
li $v0, 5
syscall
move $s3, $v0

#expression 1:((5x + 3y + x) / 2) + 3
#multiply x by 5
mul $t0, $s1, 5

#multiply y by 3
mul $t1, $s2, 3

#add 5x + 3y
add $s0, $t0, $t1

#add z
add $s0, $s0, $s3

#divide by 2
div $s0, $s0, 2

#mult by 3
mul $s0, $s0, 3

#print ex1Result
li $v0, 4
la $a0, ex1Result
syscall

#print result for expression 1
li $v0, 1
move $a0, $s0
syscall

#expression 2: x^3 + 2x^2 + 3x + 4
#x^2
mul $t0, $s1, $s1
#x^3
mul $t0, $t0, $s1

#2x^2
#x^2
mul $t1, $s1, $s1
#2x^2
mul $t1, $t1, 2

#3x
mul $t2, $s1, 3

#add values
add $s5, $t0, $t1
add $s5, $s5, $t2
add $s5, $s5, 4

#print ex2Result
li $v0, 4
la $a0, ex2Result
syscall

#print result for expression 2
li $v0, 1
move $a0, $s5
syscall

#print Goodbye
li $v0, 4
la $a0, goodbye
syscall

#exit program
li $v0, 10
syscall

.data
xInput: .asciiz "Enter a value for x: "
yInput: .asciiz "Enter a value for y: "
zInput: .asciiz "Enter a value for z: "
ex1Result: .asciiz "\nThe result for expression 1 is: "
ex2Result: .asciiz "\nThe result for expression 2 is: "
goodbye: .asciiz "\nGoodbye!"
