##
## Program to calculate (x-1)*3/(y+2)
##
## Register use:
##  $8    x
##  $9    y
##  $11   quotient
##  $12   remainder

        .text
        .globl  main

main:   
	ori $8, $0, 100        # put x into $8  (x=100)
	ori $9, $0, 20     	   # put y into $9  (y=20)  
	ori $10, $0, 3     	   # put 3 into $10
	addiu $11, $8, -1      # compute (x-1) and put the result into $11 
	mult $11, $10      	   # compute (x-1)*3
	mflo  $11     	       # put the product into $11
	addu  $12, $9, 2       # compute (y+2) and put the result into $12
	div  $11, $12          # compute (x-1)*3/(y+2)
	mflo  $11              # put the quotient into $11 
	mfhi  $12              # put the remainder into $12
	
## end of file
