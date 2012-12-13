# Bins = show set of observations into bins based on specific variable
# Good for time series data
# Shingles = good way to represent intervals in R, used extensively by lattice()

# CREATE SHINGLE
# shingle(x, intervals)

# SHINGLS WHERE # OBSERVATIONS IS THE SAME IN EACH BIN
# equal.count()

# TAKE CONTINUOUS VARIABLE AND SPLIT IN DISCRETE PIECES
# cut()   # takes numeric vector & returns char

# EXAMPLE
library(nutshell)
data(batting.2008)
batting.2008.AB <- transform(batting.2008, AVG=H/AB)
batting.2008.over100AB <- subset(batting.2008.AB, subset=(AB > 100))
battingavg.2008.bins <- cut(batting.2008.over100AB$AVG, breaks=10)
table(battingavg.2008.bins)