## Program to bitwise OR, AND, and XOR two patterns  , 
.text
.globl main
main:
		ori 	$6, $0,0x2372 #put bit pattern 0x2372 into register $6
		ori 	$7, $6,0x1234 # OR operation, saved to register  $7 
		andi 	$8, $6,0x1234 # AND operation, saved to register $8 
		xori 	$9, $6,0x1234 # XOR operation, saved to register $9

## End of file
