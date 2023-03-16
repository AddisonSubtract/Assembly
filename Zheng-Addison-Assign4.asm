#Addison Zheng
#Assignment 4

#int rows;
#    cout << "Enter number of rows: ";
#    cin >> rows;
#    for(int i = 0; i <= row; i++) {
#        for(int j = 1; j <= i; j++) {
#            cout << "* ";
#        }
#        cout << "\n";
#    }

.text

#create label for start of the loop
start_loop:

	#prompt for length of the base of the triangle
	jal PrintNewLine
	la $a0, prompt
	jal PromptInt
	#$s0 = edge length of base
	move $a1, $v0
	
	#initalize row
	li $t0, 0
	
	# code check for the sentinal
	#if($a0 == 0)
  	seq $t1, $a1, 0
  	beq $t1, 1, end_loop
  	
  	move $a0, $a1
  	jal printTriangle
  	
  	b start_loop
 
#Exit program
end_loop:
	jal PrintNewLine
	la $a0, goodbye
	jal PrintString
	jal Exit


.data
prompt: .asciiz "Please enter the edge length of the base of right triangle: "
hashtag: .asciiz "#"
newLine: .asciiz "\n"
goodbye: .asciiz "Exiting the program"

#####################################################
# Function: printTriangle - prints triganle based on length
# Parameters:
# $a0 - the length of triangle's base
# Returns
# None
######################################################
.text
printTriangle:
move $s1, $a0
	row:
  		#(for i=0;i<=row;i++)
  		beq $t0, $s1, exit_procedure
  	
  		#increment i
  		addi $t0, $t0, 1
  	
  		#sets value of column
  		li $t1, 1
  	
  		#prints new line
  		li $v0, 4
        	la $a0, newLine
        	syscall
        
        	column:
        		bgt $t1, $t0, row  #(for j=1;j<=i;j++)
        		# if t1=t0 return to start

			# print hashtag
        		li $v0, 4
        		la $a0, hashtag
        		syscall 
    		
    			# increment j
        		addi $t1, $t1, 1
		
			# jump back to column
        		j column
        	
        exit_procedure:
        	jr $ra

.include "Zheng-Addison-utils.asm"
