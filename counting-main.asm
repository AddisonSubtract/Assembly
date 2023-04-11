# Addison Zheng
# Lab - Partner Work
# Alvin Zheng

.text
# Prompt for the string to enter
li $v0, 4
la $a0, promptString
syscall

# Read the string. 
li $v0, 8
la $a0, string
lw $a1, stringSize
syscall

# Prompt for the char to enter
li $v0, 4
la $a0, promptChar
syscall

# Read the char. 
li $v0, 8
la $a0, char
la $a1, charSize
syscall

#print search prompt
la $v0, 4
la $a0, search
syscall

# Output the string
li $v0, 4
la $a0, string
syscall

#initilize variables
li $t0, 0              	# index of array
li $t1, 30             	# size of the arrays
li $t3, 0		# counter
la $a0, string   	# load location of string into $a0

#load char for procedure
la $s0, char 
lb $a1 ($s0)

#call CountOccur
jal CountOccur
move $s0, $v0

# Output prompt 1
li $v0, 4
la $a0, output
syscall

# Output the char count
la $a0, ($s0)
li $v0, 1
syscall

# Output prompt 2
li $v0, 4
la $a0, output2
syscall

.data
promptString: .asciiz "Please enter a string: "
promptChar: .asciiz "Please enter a character to search for: "
search: .asciiz "Search string = "
output: .asciiz "We found the character "
output2: .asciiz " times"

string: .space 100
stringSize: .word 100
char: .space 1
charSize: .word 1

.include "Zheng-Addison-utils.asm"
.include "count-occur.asm"
