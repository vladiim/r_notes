# http://cran.r-project.org/web/packages/plyr/
# http://cran.r-project.org/web/packages/reshape2/

# doing excel stuff in R

# TOTALS
iris.num <- iris[, -5]

iris.sums <- function() { colSums(iris.num) }
iris.means <- function() { colMeans(iris.num) }

# FUNCTIONS

iris.min <- function() { sapply(iris.num, min )}
iris.max <- function() { sapply(iris.num, max )}

# FORMATTING OUTPUT

# trim - logical value that adds spaces to right-justify results
# digits - significant digits
# nsmall - min number of digits after decimal
wierd.dec <- function(num) {
  format(num, digits = 9, decimal.mark=',',
  	          big.mark=' ', small.mark='.', small.interval=3)
}

mtcars.means.2.dec <- function() {
  x <- colMeans(mtcars[, 1:4])
  format(x, digits=2, nsmall=2)
}

num.to.perc <- function(nums) {
  sprintf("%.1f%%", 100*nums)
}

num.to.dollars <- function(nums) {
  sprintf("$%3.2f", nums)
}

stuffs.costs <- function(stuff, cost) {
  sprintf("%s costed $%3.2f", stuff, cost)
}

# SORTING WITH IF
high.cars <- function() {
  mtcars <- within(mtcars, mpgClass <- ifelse(mpg < mean(mpg), "Low", "High"))
  mtcars[mtcars$mpgClass == 'High',]
}

conditionals <- function() {
  print(sprintf("Mean MPG: %s", with(mtcars, mean(mpg))))
  print(sprintf("Mean MPG hp < 150: %s", with(mtcars, mean(mpg[hp < 150]))))
  print(sprintf("Mean MPG hp >= 150: %s", with(mtcars, mean(mpg[hp >= 150]))))
}

# TRANSPOSING COLUMNS OR ROWS

trans <- function(x) {
  # e.g. x <- matrix(1:15, ncol=3)
  t(x)
}

mtcars.rx4 <- function() {
  # t(mtcars[1,])
  t(mtcars['Mazda RX4', ])
}

# UNIQUE DATA
# unique(mtcars$cyl)

# DUPLICATE DATA
iris.duplicates <- function() {
  dupes <- duplicated(iris)
  # head(dupes)
  # which(dupes)
  iris[dupes, ]
}

# LOOKUP VALUE
search.mtcars <- function(term) {
  index <- match(term, rownames(mtcars))
  mtcars[index, ]
}

# PIVOT TABLES
meanHp.gear.cyl <- function() {
  with(mtcars, tapply(hp, list(cyl, gear), mean))
}

# MORE COMPLEX PIVOT TABLES
hp.cyl <- function() {
  aggregate(hp ~ cyl + gear + am, mtcars, mean)
}