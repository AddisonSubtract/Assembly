#Addison Zheng
#Lab 7

# Lab7-starter.asm
# Starter file for Lab 7
.text
# Write code to load x,y,z, and q 
# into registers $s0-$s3 with lw using labels
#load x into address
la $t0, x
lw $s0, ($t0)

#load y into address
la $t0, y
lw $s1, ($t0)

#load z into address
la $t0, z
lw $s2, ($t0)

#load q into address
la $t0, q
lw $s3, ($t0)

# Write the code to print the value
# in registers $s0-$s3
#moves x into $a1
move $a1, $s0
la $a0, prompt1
jal PrintInt
jal PrintNewLine

#moves y into $a1
move $a1, $s1
la $a0, prompt2
jal PrintInt
jal PrintNewLine

#moves z into $a1
move $a1, $s2
la $a0, prompt3
jal PrintInt
jal PrintNewLine

#moves q into $a1
move $a1, $s3
la $a0, prompt4
jal PrintInt
jal PrintNewLine

# Write code to load the 4 integers starting
# at label a using register indirect access 
# into registers $s0-$s3
# Make sure the memory location is always set 
# to point to the integer you want to load
# Example: 
# After loading the address into $t0
# use lw to load the value from the address
# lw $s0,($t0)
# After loading the value, you need to advance
# the memory pointer to point to the next integer

# Write the code to print the value
# in registers $s0-$s3
la $t0, a

#prints out the value of a
lw $s0, ($t0)
move $a1, $s0
la $a0, prompt1
jal PrintInt
jal PrintNewLine

#prints out the value of a + 4
addi $t0, $t0, 4
lw $s1, ($t0)
move $a1, $s1
la $a0, prompt2
jal PrintInt
jal PrintNewLine

#prints out the value of a + 8
addi $t0, $t0, 4
lw $s2, ($t0)
move $a1, $s2
la $a0, prompt3
jal PrintInt
jal PrintNewLine

#prints out the value of a + 12
addi $t0, $t0, 4
lw $s3, ($t0)
move $a1, $s3
la $a0, prompt4
jal PrintInt
jal PrintNewLine


# Write code to load the 4 integers starting
# at label e using register indirect plus offset access
# into registers $s0-$s3
# Example: 
# After loading the address into $t0
# use lw to load the value from the address
# Use the offset into the memory location to
# get to the correct address
# lw $s0,0($t0)

# Write the code to print the value
# in registers $s0-$s3
la $t0, e

#prints out the value of 0(e) as $s0
lw $s0, 0($t0)
move $a1, $s0
la $a0, prompt1
jal PrintInt
jal PrintNewLine

#prints out the value of 4(e) as $s1
lw $s1, 4($t0)
move $a1, $s1
la $a0, prompt1
jal PrintInt
jal PrintNewLine

#prints out the value of 8(e) as $s2
lw $s2, 8($t0)
move $a1, $s2
la $a0, prompt1
jal PrintInt
jal PrintNewLine

#prints out the value of 12(e) as $s3
lw $s3, 12($t0)
move $a1, $s3
la $a0, prompt1
jal PrintInt
jal PrintNewLine

#Exit the program
jal Exit

.data

x: .word 10
y: .word 15
z: .word 7
q: .word 8
a: .word 2
   .word 4
   .word 6 
   .word 12
e: .word 5
   .word 10
   .word 15
   .word 20
prompt1: .asciiz "The value in $s0 is : "
prompt2: .asciiz "The value in $s1 is : "
prompt3: .asciiz "The value in $s2 is : "
prompt4: .asciiz "The value in $s3 is : "

#########################################
# Function: PrintNewLine
# Parameters:
#   none
# Return Values:
#   none
#########################################
.text
PrintNewLine:
li $v0, 4
la $a0, __PNL_newline
syscall
jr $ra
.data
   __PNL_newline: .asciiz "\n"

#########################################
# Function: PrintInt
# Parameters:
#   $a0 - label for the print
#   $a1 - integer to print
# Return Values:
#   none
#########################################
.text 
PrintInt:   
# Print string. The string address is already in $a0 
li $v0, 4
syscall
# Print integer. The integer value is in $a1, and must # be first moved to $a0.
move $a0, $a1
li $v0, 1
syscall
#return
jr $ra

#########################################
# Function: Exit
# Parameters:
#   none
# Return Values:
#   none
#########################################
.text
Exit:
li $v0, 10
syscall
