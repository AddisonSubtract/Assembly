#Addison Zheng
#Lab 11

.text
lw $a0, g
lw $a1, h
lw $a2, i
lw $a3, x

lw $s0, test
lw $s1, test2
lw $s2, test3

#calls sum_proc
jal sum_proc

#move $v0 into $a1
move $a1, $v0

#load prompt into $a0
la $a0, prompt

#print prompt and int
jal PrintInt

#print value of $s0
jal PrintNewLine
la $a0, prompt0
move $a1, $s0
jal PrintInt

#print value of $s0
jal PrintNewLine
la $a0, prompt1
move $a1, $s1
jal PrintInt

#print value of $s0
jal PrintNewLine
la $a0, prompt2
move $a1, $s2
jal PrintInt

jal Exit

.data
g: .word 10
h: .word 15
i: .word 3
x: .word 2
test: .word 56
test2: .word 78
test3: .word 91

prompt: .asciiz "Returned Value: "
prompt0: .asciiz "s0 = "
prompt1: .asciiz "s1 - "
prompt2: .asciiz "s2 = "

.include "Zheng-Addison-utils.asm"

#####################################################
# Function: sum_proc - Adds different values 
# Parameters:
# $a0 - vlaue of g
# $a1 - value of h
# $a2 - value of i
# $a0 - value of x
# Returns
# $v0 - sum of values
######################################################
.text
sum_proc:
    #push $s0 into stack
    addi $sp, $sp, -4
    sw $s0, 0($sp)
    
    #push $s1 into stack
    addi $sp, $sp, -4
    sw $s1, 0($sp)
    
    #push $s2 into stack
    addi $sp, $sp, -4
    sw $s2, 0($sp)
    
    #f = (g + h)
    add $s0, $a0, $a1
    
    #k = (i + x) * 2
    add $s1, $a2, $a3
    sll $s1, $s1, 1
    
    #sum = f + k
    add $s2, $s0, $s1
    
    #move $s2 into $v0
    move $v0, $s2
    
    #restore using stack
    #restore $s2
    lw $s2, 0($sp)
    addi $sp, $sp, 4
    
    #restore $s1
    lw $s1, 0($sp)
    addi $sp, $sp, 4
    
    #restore $s0
    lw $s0, 0($sp)
    addi $sp, $sp, 4
    
    jr $ra