# Addison Zheng
# Lab 6
.text
main:

# call PrintHello
jal PrintHello

# call PrintNewLine
jal PrintNewLine

# call PrintGoodbye
jal PrintGoodbye

# call the Exit function
jal Exit

#########################################
# PrintHello: Says Hello World
# Parameters:
#   none
# Return Values:
#   none
#########################################
.text
PrintHello:
li $v0,4
la $a0, Hello
syscall
jr $ra

.data
Hello: .asciiz "Hello World"
#########################################
# PrintNewLine: prints newline
# Parameters:
#   none
# Return Values:
#   none
#########################################
.text
PrintNewLine:
li $v0,4
la $a0, newLine
syscall 
jr $ra

.data
newLine: .asciiz "\n"

#########################################
# PrintGoodbye: Says Goodbye!
# Parameters:
#   none
# Return Values:
#   none
#########################################
.text
PrintGoodbye:
li $v0,4
la $a0, goodbye
syscall 
jr $ra

.data
goodbye: .asciiz "Goodbye!"

#########################################
# Exit: Exits program
# Parameters:
#   none
# Return Values:
#   none
#########################################
.text
Exit:
li $v0, 10
syscall