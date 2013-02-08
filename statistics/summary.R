library(nutshell)
data(dow30)

# BASIC

mean(dow30$Open)

max/min(dow30$Open)

range(dow30$Open)

quantile(dow30$Open, probs=c(0,0.25,0.5,0.75,1.0)) # probs= controls percentile breakpoints

fivenum() # quantile + 1

IQR()     # difference between 25th and 75th

# REMOVE NA

mean(dow30$Open, na.rm=TRUE)


# REMOVE OUTLIERS

mean(c(-1, 0:100, 2000), trim=0.1)

# LOOK AT SUMMARY INFORMATION

summary()

# text based tool to look at the dist of numeric vector
stem()
stem(subset(field.goals, PLTYPE=="FG no")$YARDS)

