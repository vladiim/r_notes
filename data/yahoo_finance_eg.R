get.quotes <- function(ticker,
	                   from=(Sys.Date()-365),
	                   to=(Sys.Date()),
	                   interval="d") {

  base      <- "http://ichart.finance.yahoo.com/table.csv?";
  symbol    <- paste("s=", ticker, sep="");

  # months numbered from 00 to 11
  from.month <- paste("&a=", formatC(as.integer(format(from, "%m"))-1, width=2, flag="0"), sep="");
  from.day   <- paste("&b=", format(from, "%d"), sep="");
  from.year  <- paste("&c=", format(from, "%Y"), sep="");

  to.month   <- paste("&a=", formatC(as.integer(format(to, "%m"))-1, width=2, flag="0"), sep="");
  to.day     <- paste("&e=", format(from, "%d"), sep="");
  to.year    <- paste("&f=", format(from, "%Y"), sep="");
  inter      <- paste("&g=", interval, sep="");
  last       <- "%ignore=.csv";

  url <- paste(base, symbol, from.month, from.day, from.year,
  	           to.month, to.day, to.year, inter, last, sep="");

  tmp <- read.csv(url);
  cbind(symbol=ticker, tmp);
}

get.multiple.quotes <- function(tickers,
	                            from=(Sys.Date()-365),
	                            to=(Sys.Date()),
	                            interval="d") {

  tmp <- NULL;

  for (ticker in tickers) {
    if (is.null(tmp))
         tmp <- get.quotes(ticker, from, to, interval)
    else tmp <- rbind(tmp, get.quotes(ticker, from, to, interval))
  }

  tmp$Date <- as.Date(tmp$Date); # auto stores Date as factor
  # transform(tmp, Date=as.Date(Date),
  # 	             mid=(High + Low) / 2)

  tmp
}

find.mid <- function(data) {
  data$mid <- (data$High + data$Low) / 2
}

dow30.tickers <- c("MMM", "AA", "AXP", "T", "BAC", "BA", "CAT", "CVX",
	               "CSCO", "KO", "DD", "XOM", "GE", "HPQ", "HD", "INTC",
	               "IBM", "JNJ", "JPM", "KFT", "MCD", "MRK", "MSFT", "AAPL",
	               "PFE", "PG", "UTX", "VZ", "WMT", "DIS")