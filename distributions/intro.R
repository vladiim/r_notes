# great for understanding shape of the data & finding outliers
# histo gram is great to do this

library(nutshell)
data(batting.2008)

# HISTGRAMS

# calc the plate appearance for each player
# AB = at bats, BB = base on balls etc etc
batting.2008 <- transform(batting.2008, PA=AB+BB+HBP+SF+SH)

plate.appearance <- function() {
  hist(batting.2008$PA)
}

plate.appearance.over.25 <- function() {
  hist(batting.2008[batting.2008$PA > 25, 'PA'], breaks=50, cex.main=.8)
}

# DENSITY PLOT

plate.appearance.density.25 <- function() {
  plot(density(batting.2008[batting.2008$PA > 25, 'PA']))
}

# a common addition to density plot is a rug

plate.appearance.rug <- function() {
  rug(batting.2008[batting.2008$PA > 25, 'PA'])
}

# QUANILE QUANILE PLOT

plate.a.quant <- function() {
  qqnorm(batting.2008$AB)
}

# two dists or dist vs theoretical dist qqplot()

plate.a.qqplot <- function() {
	qqplot(batting.2008$AB)
}

# BOX PLOTS

american.over.100 <- function() {
  batting.2008 <- transform(batting.2008, OBP = (H + BB + HBP)/(AB + BB + HBP + SF))
  boxplot(OBP~teamID,
  	      data = batting.2008[batting.2008$AB > 100 & batting.2008$lgID=='AL',],
  	      cex.axis = .7)
}