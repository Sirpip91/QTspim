##  Bradley Allen
## 
                .text
                .globl main
                
main:
                ori  $6, $0, 1              ## index
                ori  $7, $0, 1              ## flag (1: odd, 0: even)
                ori  $8, $0, 0              ## sum of evens;
                ori  $9, $0, 0              ## sum of odds;
                ori  $10, $0, 0             ## sum of all; 
loop:          	bgt  $6, 100, end         ## terminate when $6>100
               	beq  $7, $0, even         ## if flag==0, jump to even
                add $9, $9, $6            ## update odd sum using index
                ori  $7, $0, 0              ## set flag to 0
                j    all                
even:           add $8, $8, $6           ## update even sum using index
                ori $7, $0, 1           ## set flag to 1
all:            add $10,$10,$6           ## update all sum using index
                add  $6, $6, 1              ## increase index
                j    loop           ## next iteration if $6<=100    
end:            sll  $0, $0, 0        

## End of File
