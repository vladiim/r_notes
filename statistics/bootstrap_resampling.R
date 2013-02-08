# technique to est bias of an estimator (stat calculated from data sample e.g. mean, sd, etc)

# works by repeatedly selecting random obs from a sample & recalculating stat

library(boot)
data(sanfrancisco.home.sales)

sales.price <- function() {
  sanfrancisco.home.sales$price
}

home.boot <- function() {
  june08.sales <- sanfrancisco.home.sales[sanfrancisco.home.sales$date > "2008-06-01",]
  prices <- june08.sales$price;
  boot(data=prices, statistic = function(d, i) {
    median(d[i])
  }, R=1000)
}

# > home.boot()

# ORDINARY NONPARAMETRIC BOOTSTRAP


# Call:
# boot(data = prices, statistic = function(d, i) {
#     median(d[i])
# }, R = 1000)


# Bootstrap Statistics :
#     original  bias    std. error
# t1*   740000  1591.5    8262.446

# this tells us that the median is a very slightly biased estimator