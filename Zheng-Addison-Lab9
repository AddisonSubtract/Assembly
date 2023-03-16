#Addison Zheng
#Lab 9

#int a = 0;
#int b = 10;
#int c = 5;
#int d = 9;
#int e = 7;
#int k = input(“Please enter a value for k:”);
#while (k >= 0) {
#if (k == 0) {
#a = b + c;
#elseif (k == 1) {
#a = d + e;
#elseif (k == 2) {
#a = d – e;
#elseif (k == 3) {
#a = b – c;
#else {
#a = 0;
#}
#print(“The value for a is:” + a);
#k = input(“Please enter a value for k:”);
#}
#print(“Goodbye”);

.text
#Print prompt and accept int
la $a0, prompt
jal PromptInt
move $s5, $v0

#load a into $s0
lw $s0, a
#load b into $s1
lw $s1, b
#load c into $s2
lw $s2, c
#load d into $s3
lw $s3, d
#load e into $s4
lw $s4, e
	
#create label for start of the loop
start_loop:
	# code check for the sentinal
	#(k >= 0)
  	sge  $t1,$s5, $zero
  	beqz  $t1, end_loop
  	
equalsZero:
	# if (k == 0)
        seq $t1, $s5, 0
        #elseif (k == 1)
        beqz  $t1, equalsOne
        # a = b + c
        add $s5, $s1, $s2
        b end_if

equalsOne:
	# if (k == 1)
        seq $t1, $s5, 1
        # else if (k == 2)
        beqz $t1, equalsTwo
	#a = d + e;
	add $s5, $s3, $s4
	b end_if

equalsTwo:
	# if (k == 2)
        seq $t1, $s5, 2
        # else if (k == 3)
        beqz $t1, equalsThree
	#a = d + e;
	sub $s5, $s3, $s4
	b end_if
	
equalsThree:
	# if (k == 3)
        seq $t1, $s5, 3
        # else
        beqz $t1, else
	#a = d + e;
	sub $s5, $s1, $s2
	b end_if

else:
	#a = 0
	#set k ($s5) to zero
	la $s5, 0
	b end_if

end_if:
	#outputing the value of a
	la $a0, output
	move $a1, $s5
	jal PrintInt

	#checking the sentinel before the end of the loop
	la $a0, prompt
	jal PromptInt
	move $s5, $v0
	b start_loop
	
#Exit program
end_loop:
la $a0, goodbye
jal PrintString
jal Exit

.data
a: .word 0
b: .word 10
c: .word 5
d: .word 9
e: .word 7

prompt: .asciiz "\nPlease enter a value for k: "
output: .asciiz "The value of a is: "
goodbye: .asciiz "Goodbye"


.include "Zheng-Addison-utils.asm"
