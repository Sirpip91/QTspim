## Bradley Allen COSC 2372

        .text
        .globl  main

main:   
	lui $8, 0x1000     # the address of pairs (SPIM:0x1000; Mars:0x1001)
	lw  $9, 0($8)    # get the number of pairs (5) and store in $9
	ori $10, $0, 0      # use $10 to store the height sum
	ori $11, $0, 0      # use $11 to store the weight sum
	ori $12, $0, 0      # use $12 to count
	ori $13, $0, 0      # use $13 to store temp values;
           	addiu   $8, $8, 4   # increase the address to get the first pair;
loop:      	beq $9, $12, ave   # jump to compute the average if count==number of pairs
	lw      $13, 0($8)   # get height and store in $13
	add     $10,$10,$13   # update the height sum using $10
	addiu   $8, $8, 4   # increase the address
	lw      $13, 0($8)   # get weight and store in $13
	add     $11,$11,$13   # update the weight sum using $11
	addiu   $8, $8, 4   # increase the address
	add     $12,$12,1   # increase count
	j loop
         
ave:   	div $10,$12      # compute the average of height
	mflo $10            # store the height average in $10
	div $11,$12       # compute the average of weight
	mflo $11            # store the weight average in $11
		
            .data
pairs:      .word 5      # number of pairs
	.word 60, 90 # first pair: height, weight
	.word 65, 105
	.word 72, 256
	.word 68, 270
	.word 62, 115

## End of file
