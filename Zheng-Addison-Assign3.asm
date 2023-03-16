# Addison Zheng
# Assignment #3
.text
main:

# call printMsg
jal printMsg

# call getInt
jal getInt

# call calcMins
jal calcMins

# call calcHours
jal calcHours

# call printInt
jal printInt

# call the Exit function
jal Exit

#########################################
# printMsg: prints welcome message
# Parameters:
#   none
# Return Values:
#   none
#########################################
.text
printMsg:
li $v0,4
la $a0, Msg
syscall
jr $ra

.data
Msg: .asciiz "Welcome to the time converter."

#########################################
# getInt: asks for seconds as ints
# Parameters:
#   $a0 - message to display
# Return Values:
#   $s0 - the seconds entered
#########################################
.text
getInt:
li $v0,4
la $a0, intPrompt
syscall 
#take in seconds and move to $s0
li $v0, 5
syscall
move $s0, $v0

jr $ra

.data
intPrompt: .asciiz "\nEnter the number of seconds: "

#########################################
# calcMins: calculate the minutes using seconds
# Parameters:
#   $s0 - number of seconds
# Return Values:
#   $s1 - number of minutes
#########################################

.text
calcMins:
#divide $s0 by 60 and store at $s1
li $t0, 60
div $s1, $s0, $t0
mflo $s1
jr $ra

#########################################
# calcHours: calculate the hours using minutes
# Parameters:
#   $s1 - number of minutes
# Return Values:
#   $s2 - number of hours
#########################################

.text
calcHours:
#divide $s0 by 60 and store at $s1
div $s2, $s1, $t0
mflo $s2
jr $ra

#########################################
# printInt: prints labels and integers
# Parameters:
#   $a0 - message to display
#   $s1 - number of minutes
#   $s2 - number of hours
# Return Values:
#   none
#########################################

.text

printInt:
#prints minutes
li $v0, 4
la $a0, minOutput
syscall
li $v0, 1
move $a0, $s1
syscall

#prints hours
li $v0,4
la $a0, hourOutput
syscall
li $v0, 1
move $a0, $s2
syscall


.data
minOutput: .asciiz "Number of minutes: "
hourOutput: .asciiz "\nNumber of hours: "

#########################################
# Exit: Exits program
# Parameters:
#   $a0 - message to display
# Return Values:
#   none
#########################################
.text
Exit:
li $v0, 10
syscall
