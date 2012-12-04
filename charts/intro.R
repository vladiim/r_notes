library(nutshell)
library(lattice)

data(field.goals)

# COLUMN NAMES
fg.names <- function() { names(field.goals) }

# HISTOGRAM
yards.hist <- function() {
  hist(field.goals$yards, 
  	   breaks = 35,
  	   main = paste("Field Goals Yo!"),
  	   xlab = "X label",
  	   ylab = "Y label")
}

# SHOW TABLE OF SPECIFIC DATA
# Note play.type is a factor
play.type.table <- function() {
  table(field.goals$play.type)
}

# STRIPCHART
fg.attempt <- function() {
  stripchart(field.goals[field.goals$play.type == 'FG blocked', ]$yards,
  	         pch = 19,
  	         method = 'jitter')
}

# PLOT RELATIONSHIP
# In the case below vehicle speed & stopping dist (the only obs in the cars data)
speed.vs.stop <- function() {
  plot(cars, xlab = "Speed (mph)",
  	         ylab = "Stopping dist (ft)",
  	         las = 1,
  	         xlim = c(0, 25))
}

# VAR1 BY VAR2 SPLIT BY FACTOR1
amount.by.year <- function() {
  dotplot( Amount ~ Year | Food, data = consumption,
           aspect = 'xy',
           scales = list(relation = 'sliced'),
           cex = .4 )
}