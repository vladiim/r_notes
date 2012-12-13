# ...
# Takes any arguments/functions

f <- function( x, ... ) {
  print(x);
  summary(...);
}

f("summary for object", object, digits=2)

# PROPERTIES
args()
formals()
body()

# APPLY FUNCTION TO ARRAY
# apply()
# > x<-1:27
# > dim(x)<-c(3,3,3)
# > apply(X=x, MARGIN=1, FUN=paste,collapse=",")
# > apply(X=x, MARGIN=2, FUN=paste,collapse=",")
# > apply(X=x, MARGIN=3, FUN=paste,collapse=",")
# > apply(X=x, MARGIN=c(2,3), FUN=paste,collapse=",")
#      [,1]    [,2]       [,3]      
# [1,] "1,2,3" "10,11,12" "19,20,21"
# [2,] "4,5,6" "13,14,15" "22,23,24"
# [3,] "7,8,9" "16,17,18" "25,26,27"

# APPLY FUN TO LIST OR VECTOR
# lapply()
# > x<-as.list(1:5)
# > lapply(x, function(x) 2^x)
# > d<-data.frame(x=1:5, y=6:10)
# > lapply(d, function(x) x ^2)

# APPLY FUN AND GET VECTOR MATRIX BACK
# sapply()

# MULTIVARIATE SAPPLY()
# mapply()

# SUMMARY
# tapply()
# e.g. sum the number of homeruns
library(nutshell)
data(batting.2008)
tapply(X=batting.2008$HR, INDEX=list(batting.2008$teamID), FUN=sum)

# return multiple items - fivenum() returns vector of min - max range
tapply(X=batting.2008$H/batting.2008$AB, INDEX=list(batting.2008$lgID), FUN=fivenum)

# MEAN HOME RUNS PER PLAYER BY LEAGUE
tapply(X=(batting.2008$HR),
	   INDEX=(batting.w.names.2008$lgID,
	   	      batting.w.names.2008$bats),
	   FUN=mean)

# CLOSE RELATION TO TAPPLY() = BY()
# Works the same way as tapply() but on data frames
by(batting.2008[,c('H', '2B', '3B', 'HR')],
	            INDICES=list(batting.w.names.2008$lgID,
	                         batting.w.names.2008$bats),
	            FUN=mean)

# ANOTHER OPTION
# aggregate()

# COUNT THE NUMBER OF OBSERVATIONS THAT TAKE ON A VALUE
# tabulate()
# table()    # only works on factors
# table(batting.2008[, c('bats', 'throws', 'lgID')])

# CREATE CONTINGENCY TABLES FROM FACTORS
# Same as table but allows you to group certain data
# xtabs()
# xtabs(~bats+lgID, batting.2008)

# TABULATE ON NUMERIC VALUES
batting.2008 <- transform(batting.2008, AVG = H/AB)
over100      <- subset(batting.2008, subset=(AB > 100))
bins         <- cut(over100$AVG, breaks=10)
table(bins)