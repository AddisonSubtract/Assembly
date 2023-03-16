# Addison Zheng
# Assignment #1

.text
#Prompt for the favorite food
#Print the label
li $v0, 4
la $a0, promptFood
syscall

#Read the string from the user
li $v0, 8
la $a0, inputFood
lw $a1, inputSize
syscall

#Prompt for the weeks
#Print the label
li $v0, 4
la $a0, promptWeek
syscall

#Read the string from the user
li $v0, 8
la $a0, inputWeek
lw $a1, inputSize
syscall

#Print the food to console
#Print the label
li $v0, 4
la $a0, outputFood
syscall
li $v0, 4
la $a0, inputFood
syscall

#Print the week to console
#Print the label
li $v0, 4
la $a0, outputWeek1
syscall
li $v0, 4
la $a0, inputWeek
syscall
li $v0, 4
la $a0, outputWeek2
syscall

#Exit program
li $v0, 10

.data
inputFood: .space 81
inputWeek: .space 10
inputSize: .word 90
promptFood: .asciiz "Welcome\nWhat is your favorite food? "
promptWeek: .asciiz "How many times a week do you eat your favorite food? "
outputFood: .asciiz "\nYour favorite food is "
outputWeek1: .asciiz "and you eat it "
outputWeek2: .asciiz " times a week."