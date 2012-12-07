# How a variable changes over time

# CREATE
# ts(data = data,
# 	start = 1,
# 	end = numeric(2012),
# 	frequency = 1,
# 	deltat    = 1,
# 	ts.eps    = getOption("ts.eps"),
# 	class     = "bolocks",
# 	names     = "?" )

# TS FOR QUARTERS BETWEEN 2008 & 2010
# ts( 1:8, start=c( 2008, 2 ), frequency=4 )

# EXAMPLE
get.turkey.price <- function() {
  library(nutshell)
  data(turkey.price.ts)
  turkey.price.ts
}

# QUERY EXAMPLE DATA
# start(turkey.price.ts)
# end(turkey.price.ts)
# frequency(turkey.price.ts)
# deltat(turkey.price.ts)