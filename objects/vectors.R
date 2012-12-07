# There are 6 basic vector tyeps

# CREATING
v <- c( 1:4 )

# CREATING VEXTOR OF 4 #'S AND A LIST
v <- c( .102, .200, .303, list( 1, 2, 3, 4 ), recursive = TRUE ) # this is a list

# ADDING STEP IN SEQUENCE
v <- seq( from=5, to=20, by=2 )

# EXPLICITLY MANIPULATE LENGTH
v <- c( 1:20 )
length(v) <- 5    # v == 1:5

length(v) <- 10   # v == 1:5, c(NA*5)