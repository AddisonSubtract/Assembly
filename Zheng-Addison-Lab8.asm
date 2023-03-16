#Addison Zheng
#Lab 8

.text
#Print prompt and accept int
la $a0, prompt
jal PromptInt
move $s5, $v0

#load a into $s0
la $t0, a
lw $s0, ($t0)
#load b into $s1
la $t1, b
lw $s1, ($t1)
#load c into $s2
la $t2, c
lw $s2, ($t2)
#load d into $s3
la $t3, d
lw $s3, ($t3)
#load e into $s4
la $t3, e
lw $s4, ($t3)

#elseif (k == 1)
bne $s5, 0, equalsOne

#a = b + c
#if (k == 0)
add $s5, $s1, $s2
b end_if


equalsOne:
	#elseif (k == 2)
	bne $s5, 1, equalsTwo
	#a = d + e;
	add $s5, $s3, $s4
	b end_if

equalsTwo:
	#elseif (k == 3)
	bne $s5, 2, equalsThree
	#a = d + e;
	sub $s5, $s3, $s4
	b end_if
	
equalsThree:
	#else
	bne $s5, 3, else
	#a = d + e;
	sub $s5, $s1, $s2
	b end_if

else:
	#a = 0
	la $a0, output
	jal PrintInt
	jal Exit
	
#Exit program
end_if:
	la $a0, output
	move $a1, $s5
	jal PrintInt
	jal Exit

.data
a: .word 0
b: .word 10
c: .word 5
d: .word 9
e: .word 7

prompt: .asciiz "Please enter a value for k: "
output: .asciiz "The value of a is: "


.include "Zheng-Addison-utils.asm"