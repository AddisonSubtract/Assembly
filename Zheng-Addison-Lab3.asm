#Addison Zheng
# Lab3
.text
main:
li $v0, 4			# Load 4 into $v0 to indicate a print string.
la $a0, greeting		# Load the address of the greeting into $a0.
syscall				# Print greeting. The print is dindicated by

li $v0, 4			# Load 4 into $v0 to indicate a print string.
la $a0, line			# Load the address of the line into $a0.
syscall	

li $v0, 4			# Load 4 into $v0 to indicate a print string.
la $a0, goodbye			# Load the address of the goodbye into $a0.
syscall	

li $v0, 10
syscall

.data
.asciiz
greeting:"Hello World" 		#hello world
line:"\n"			#new line
goodbye:"Goodbye Cruel WOrld!"	#goodbye message
