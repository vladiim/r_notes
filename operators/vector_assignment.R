# ASSIGN ROW & COLS TO A VECTOR
# must match, doesn't recycle
v.names <- function() {
  v <- c( 1:21 )
  dim(v) <- c( 3, 7 )
  v
}

# CHANGE ONE VALUE
c.v <- function() {
  v <- v.names
  v[2, 3] <- 2000
  v
}

# FIND/CHANGE FUNCTION VARIABLES
vars <- function() {
  z<- function(a,b,c) { a ^ b /c }
  formals(z)                         # find
  formals(z) <- alist(a=1, b=2, c=3) #change
}