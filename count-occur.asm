#Alvin Zheng
#Lab – Partner Work
#Partner: Addison Zheng
#####################################################
# Function: CountOccur - Count number of time characer occurs
# Parameters:
# $a0 - array
# $a1 - character to search for
# Returns
# $v0 - count for number occurance
######################################################
.text
CountOccur:
	bge $t0 $t1 Counter_loop #branch if couinter is less than index
      	move $v0 $a3 #moves character count to $v0
     	jr $ra
       
Counter_loop:
	# Contents of for loop here
        li $t2,0 # initialize postion in the array
        mul $t2,$t0,1 # calculate the how far into array to go (index*1)       
        add $t2,$t2,$a0 # set memory location of element in the array
 
	lb $s3,($t2) # load the value in myArray[index] into $s3
	
	#Load Charater address
	la $a2,($s3)
	beq $a1 $a2 Counter_loop #branches if character is same
	
	#End of for loop here
    	addi $t0,$t0,1
    	j CountOccur
Count_Char:
	addi $a3 $a3 1 #add one to count the character
	addi $t0,$t0,1 #add one to index
    	j CountOccur
.data
