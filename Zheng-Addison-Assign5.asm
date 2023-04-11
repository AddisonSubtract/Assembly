# Addison Zheng
# Assignment 5

.text
#Initialize array information
la $a0, A	# load location of A into $s0
lw $a1, size	# size of array

#calls Min procedure and saves return value
jal Min
sw $v0, min

#prints minLabel and min value
la $a0, minLabel
lw $a1, min
jal PrintInt
jal PrintNewLine

#Initialize array information
la $a0, A	# load location of A into $s0
lw $a1, size	# size of array

#calls Max procedure and saves return value
jal Max
sw $v0, max

#prints maxLabel and max value
la $a0, maxLabel
lw $a1, max
jal PrintInt
jal PrintNewLine

#Initialize array information
la $a0, A	# load location of A into $s0
lw $a1, size	# size of array

#calls Sum procedure and saves return value
jal Sum
sw $v0, sum

#prints sumLabel and sum value
la $a0, sumLabel
lw $a1, sum
jal PrintInt
jal PrintNewLine

#Initialize array information
lw $a0, sum	# sum of array 
lw $a1, size	# size of array

#calls Avg procedure and saves return value
jal Avg
sw $v0, avg

#prints avgLabel and avg value
la $a0, avgLabel
lw $a1, avg
jal PrintInt

.data
A: .word 11, 250, 20, 70, 60, 140,150, 80, 90,100, 1, 30, 40,
120,130, 5
size: .word 16 # length of array A
min: .word 0
max: .word 0
sum: .word 0
avg: .word 0
largestInt: .word 2147483647 # You may want to use this for min procedure

minLabel: .asciiz "The minimum is "
maxLabel: .asciiz "The maximum is "
sumLabel: .asciiz "The sum is "
avgLabel: .asciiz "The average is "
.include "Zheng-Addison-utils.asm"

#####################################################
# Function: Min - return the minimum value in the array
# Parameters:
# $a0 - memory location of array
# $a1 - size of array
# Returns
# $v0 - calculated value
######################################################
.text
Min:
	li $t0, 0		# index of array
	lw $t3, largestInt 	#load largest int into register
	
	minArray:
		bge $t0, $a1, minReturn

    		li $t2, 0               # initialize postion in the array
        	mul $t2, $t0, 4          # calculate the how far into array to go (index*4)
        	add $t2, $t2, $a0       # set memory location of element in the array
 
    		lw $s3, ($t2)           # load the value in myArray[index] into $s3

    		#swaps
    		la $t4, ($s3)
    		blt $t4, $t3, swapMin

    		#increment index
    		addi $t0, $t0, 1
    		j minArray
	swapMin:
		move $t3, $t4
    		addi $t0, $t0, 1
		j minArray
		
	minReturn:
		move $v0, $t3
		jr $ra

#####################################################
# Function: Max – return the maximum value in the array
# Parameters:
# $a0 - memory location of array
# $a1 - size of array
# Returns
# $v0 - calculated value
######################################################
.text
Max:
	li $t0, 0		# index of array
	li $t3, 0 		#load smallest int into register
	
	maxArray:
		bge $t0, $a1, maxReturn

    		li $t2, 0               # initialize postion in the array
        	mul $t2, $t0, 4          # calculate the how far into array to go (index*4)
        	add $t2, $t2, $a0       # set memory location of element in the array
 
    		lw $s3,($t2)           # load the value in myArray[index] into $s3

    		#swaps
    		la $t4, ($s3)
    		bgt $t4, $t3, swapMax

    		#increment index
    		addi $t0, $t0,1
    		j maxArray
	swapMax:
		move $t3, $t4
    		addi $t0, $t0,1
		j maxArray
		
	maxReturn:
		move $v0, $t3
		jr $ra

#####################################################
# Function: Sum – return the sum of the values in the array
# Parameters:
# $a0 - memory location of array
# $a1 - size of array
# Returns
# $v0 - calculated value
######################################################
.text
Sum:
	li $t0, 0		# index of array
	li $t3, 0 		#sum of values
	
	sumArray:
		bge $t0, $a1, sumReturn

    		li $t2, 0               # initialize postion in the array
        	mul $t2, $t0, 4          # calculate the how far into array to go (index*4)
        	add $t2, $t2, $a0       # set memory location of element in the array
 
    		lw $s3, ($t2)           # load the value in myArray[index] into $s3
    		
    		la $t4, ($s3)
    		add $t3, $t3, $t4
    		
    		addi $t0, $t0, 1
		j sumArray
		
	sumReturn:
		move $v0, $t3
		jr $ra
#####################################################
# Function: Avg – return the average value of the array
# Parameters:
# $a0 - sum of array
# $a1 - size of array
# Returns
# $v0 - calculated value
######################################################
.text
Avg:
	div $v0, $a0, $a1
	jr $ra
