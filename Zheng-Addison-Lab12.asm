#Lab 12
#Addison Zheng

.text

#asks for an integer
la $a0, prompt
jal PromptInt

#moves int into $a0
move $a0, $v0

#run factorial
jal add_r

#output factorial
la $a0, output
move $a1, $v0
jal PrintInt

#Exit Cleanly
jal Exit

.data
prompt: .asciiz "Please enter an integer: "
output: .asciiz "Returned value = "
.include "Zheng-Addison-utils.asm"

#####################################################
# Function: add_r - recursively calculates the value of a factorial
# Parameters:
# $a0 - value to be calculated
# Returns
# $v0 - value of factorial
######################################################
.text
add_r:
	# Push $ra on the stack
	addi $sp, $sp, -4     # adjust stack 
	sw   $ra, 0($sp)      # save return address
	# Push $a0 on the stack    
	addi $sp, $sp, -4     # adjust stack
	sw   $a0, 0($sp)      # save argument
	
	# Procedure logic starts here    
	bne  $a0,0,recur      # if n !-=1, branch to recur 
	addi $v0, $zero, 0    # if not, result is 1in $v0 - exit condition
	    
	# Pop $a0 off the stack    
	lw   $a0,0($sp)       
	addi $sp, $sp, 4        
	# Pop $ra off the stack   
	lw   $ra,0($sp)	     
	addi $sp, $sp, 4

	jr   $ra              # Last return

recur:	
	addi $a0, $a0, -1     # else decrement n ($a0) 
	jal  add_r             # recursive call
	    
	# Pop $a0 off the stack    
	lw   $a0,0($sp)        
	addi $sp, $sp, 4        
	# Pop $ra off the stack   
	lw   $ra,0($sp)	
	addi $sp, $sp, 4
	
	add  $v0, $a0, $v0    # multiply to get result    
	jr   $ra              # and return

 #exit
exit:

   li $v0, 10
   syscall