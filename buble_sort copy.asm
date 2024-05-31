# Initialize loop iterators in the register bank
addi 0, rs0, rs31  # Set rs31 to 0, loop iterator for the outer loop
addi 1, rs0, rs30  # Set rs30 to 1, loop iterator for the inner loop
addi 8, rs0, rs29  # rs29 is set to 8, max index
addi 8, rs0, rs28  # rs28 is set to 8, max index
addi 8, rs0, rs27  # rs27 is set to 8, max index
addi 8, rs0, rs26  # is set to 8, max index
addi 8, rs0, rs25  # rs25 is set to 8, max index
addi 8, rs0, rs24  # rs24 is set to 8, max index
addi 1, rs0, rs23  # rs23 is set to 1, used for incrementing

# Load the first two digits to be sorted from RAM
lw 0, rs31, rs22  # Load word from memory at address in rs31 into rs22
lw 0, rs30, rs21  # Load word from memory at address in rs30 into rs21

# Compare and potentially branch to swap
bgt (4), rs21, rs22  # If rs21 > rs22, branch to PC+4 (skip swap)

# Increment loop iterators if no swap is needed
addi 1, rs31, rs31  # Increment rs31 by 1
addi 1, rs30, rs30  # Increment rs30 by 1

# Branch to outer loop start if needed
bgt -(5), rs29, rs28  # Branch to PC-5 if rs29 > rs28,  loop condition

# Operations if branching did not occur
addi 0, rs31, rs31  # Reset rs31 to 0
sw rs21             # Store rs21 to the address pointed by 
addi 0, rs30, rs30  # Reset rs30 to 0
sw rs22             # Store rs22 to the address pointed by 


bgt (2), rs31, rs25  # Branch forward by 2 if rs31 > rs25
bgt -(11), rs29, rs28 # Branch backward by 11 if rs29 > rs28, likely to handle another loop iteration

# Resetting registers to initial values or constants
addi 0, rs0, rs31   # Set rs31 to 0
addi 1, rs0, rs30   # Set rs30 to 1
addi 1, rs15, rs15  # Set rs15 to 1

# Branching based on comparisons for sorting continuation
bgt (2), rs31, rs15  # If rs31 > rs15, branch forward by 2
bgt -(16), rs29, rs28 # Branch backward by 16 if rs29 > rs28, to restart 

# Load sorted array to view order
lw 0, rs0, rs22   # Load word from address in rs0 into rs22
lw 1, rs0, rs21   # Load word from address in rs0+1 into rs21
lw 2, rs0, rs22   # Load word from address in rs0+2 into rs22
lw 3, rs0, rs21   # Load word from address in rs0+3 into rs21
lw 4, rs0, rs22   # Load word from address in rs0+4 into rs22
lw 5, rs0, rs21   # Load word from address in rs0+5 into rs21
lw 6, rs0, rs22   # Load word from address in rs0+6 into rs22
lw 7, rs0, rs21   # Load word from address in rs0+7 into rs21