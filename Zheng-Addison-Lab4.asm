# Addison Zheng
# Lab 4

.text
#Prompt for the first value
#Print the label
li $v0, 4
la $a0, firstValue
syscall

#Read the first value from the user
li $v0, 5
syscall

#move first value
move $s1, $v0

#Prompt for the second value
#Print the label
li $v0, 4
la $a0, secondValue
syscall

#Read the second value from the user
li $v0, 5
syscall

#move second value
move $s2, $v0

#Prompt for the third value
#Print the label
li $v0, 4
la $a0, thirdValue
syscall

#Read the third value from the user
li $v0, 5
syscall

#move third value
move $s3, $v0

#add first and second value
add $s4, $s1, $s2
#subtract result by third value
sub $s0, $s4, $s3

#print result
li, $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $s0
syscall

#exit the program
li $v0, 10
syscall

.data
firstValue: .asciiz "Please enter the first value to add: "
secondValue: .asciiz "Please enter the second value to add: "
thirdValue: .asciiz "Please enter the third value to subtract: "
result: .asciiz "The result is "