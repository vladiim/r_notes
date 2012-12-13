# TRANSPOSE MATRICES & DATA.FRAMES
# t()
# m <- matrix(1:10, nrow=5)
# t(m)

source('data/yahoo_finance_eg.R')

quotes <- function() {
  my.tickers <- c("GE", "GOOG", "AAPL", "AXP", "GS")
  my.quotes  <- get.multiple.quotes(my.tickers,
  	                from=as.Date("2009-01-01"),
	                to=as.Date("2009-03-31"),
	                interval="m")
}

narrow <- function(quotes) {
  quotes[, c('symbol', 'Date', 'Close')]
}

# CHANGE THE DATA FROM STACKED TO UNSTACKED FORM
# unstack(narrow, form=Close~symbol)

# FROM UNSTACKED TO STACKED
# stack()

# RESHAPE
# reshape()