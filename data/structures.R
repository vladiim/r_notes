# ARRAY
a <- function() {
  array(c(1:12), dim=c(3,4))
}

# VECTOR
v <- function() {
  c(1:12)
}

# MATRIX - 2D ARRAY
m <- function() {
  matrix(data=c(1:12), nrow=3, ncol=4)
}

# 3D ARRAY
a.3d <- function() {
  array(c(1:18), dim=c(3,3,2))
}

# LIST
l <- function() {
  list(thing="hat", size=8.25)
}

list.in.list <- function() {
  list("list in list", l())
}

# DATA FRAME
df <- function() {
  t <- c('PHI', 'NYM', 'FLA', 'ATL', 'WSN')
  w <- c(92, 89, 94, 72, 59)
  l <- c(70, 73, 77, 90, 102)
  data.frame(t, w, l)
}

# REFERENCE

# first column
# a[1, ]

# range of rows
# a[1:4, ]

# noncontinuous rows
# a[c(1,5),]

# all but 5th row
# a[-5, ]