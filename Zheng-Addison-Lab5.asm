#Addison Zheng
#Lab 5

.text
#prompt to divide by 8
li $v0, 4
la $a0, divideBy8
syscall

#take in dividend
li $v0, 5
syscall
move $s0, $v0

#divide by 8
li $t0, 8
div $t0, $s0, $t0
mflo $s1

#prompt for answer
li $v0, 4
la $a0, divide8Answer
syscall

#print result for divideBy8
li $v0, 1
move $a0, $s1
syscall

#newline
li $v0, 4
la $a0, newline
syscall

#prompt to multiply by 4
li $v0, 4
la $a0, multiplyBy4
syscall

#take in multiplier
li $v0, 5
syscall
move $s0, $v0

#multiply by 4
li $t0, 4
mult $t0, $s0
mflo $s1

#prompt for answer
li $v0, 4
la $a0, multiply4Answer
syscall

#print result for multiplyBy4
li $v0, 1
move $a0, $s1
syscall

#exit program
li $v0, 10
syscall

.data
divideBy8: .asciiz "Please enter the number to divide by 8: "
divide8Answer: .asciiz "That number divided by 8 is "
multiplyBy4: .asciiz "Please enter the number to multiply by 4: "
multiply4Answer: .asciiz "That number multiplied by 4 is "
newline: .asciiz "\n"