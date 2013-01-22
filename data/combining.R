# use rbind() and cbind()

# more.cols <- data.frame(col1, col2)
# cbind(original.df, more.cols)

# COMBINE OBJECTS WITH GROUPING VARIABLE
library(lattice)
# make.groups()

# e.g.
hat.sizes   <- seq(from=6.25, to=7.75, by=.25)
pants.sizes <- c(30, 31, 32, 33, 34, 36, 38, 40)
shoe.sizes  <- seq(from=7, to=12)
make.groups(hat.sizes, pants.sizes, shoe.sizes)

# add a new column based on other column calculations
# transform()
# batting.2008 <- transform(batting.2008, OBP = (H + BB + HBP)/(AB + BB + HBP + SF))