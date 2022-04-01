##  

        .text
        .globl  main

main:   
        lui   $10,0x1000     #  Init base register
        lw    $11,0($10)     #  Load x

        ori   $12,$0, 12     #  Initialize the accumulator		"Negative 12 would not work"
        					 #  during the "load delay slot"

        ori   $13,$0,5       #  evaluate second term
        mult  $11,$13        #  5x
        mflo  $13            #  assume 32 bit result
        subu  $12,$13,$12    #  accumulator = 5x-12   "I had to change to subu for negative 12"

                             #  evaluate third term
        mult  $11,$11        #  x^2
        mflo  $11            #  assume 32 bit result
        ori   $13,$0,3       #  3
        mult  $11,$13        #  3x^2
        mflo  $13            #
        addu  $12,$12,$13    #  accumulator = 3x^2+5x-12

        sw    $12,4($10)     #  Store result in poly

        .data
x:      .word   10           #  Edit this line to change the value of x
poly:   .word   0            #  Result is placed here.
	
## end of file
