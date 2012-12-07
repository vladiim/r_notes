# Useful for tabular data

# CREATE
# Each col may be different type but each row must have same length

data.frame( a=c(1:5), b=c(1:4) ) # Error in data.frame(a = c(1:5), b = c(1:4)) : 

bacon.cities <- data.frame(
	                 city=c( "Seatle", "Chicago" ),
	                 rank=c( 1, 2 ))