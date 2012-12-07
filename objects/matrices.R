# Vector in 2D

# CREATE
m <- matrix( data=1:12,
	         nrow=4,
	         ncol=3,
	         dimnames=list(c( 'r1', 'r2', 'r3', 'r4' ),
	         	           c( 'c1', 'c2', 'c3' )))

# TRANSFORM
l <- list( 1:20 )
ml <- as.matrix( l )