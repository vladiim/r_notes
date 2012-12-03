# try to optimise price

sales <- function(price) { 100 - 0.5 * price }

revenue <- function(price) { price * sales(price) }

# plot with curve()

plot.sales <- function(from, to) {
  par(mfrow=c(1,2))
  curve(sales, from=from, to=to, xname="Price", ylab="Sales", main="Sales")
}

plot.revenue <- function(from, to) {
  curve(revenue, from=from, to=to, xname="Price", ylab="Revenue", main="Revenue")
  par(mfrow=c(1,1))
}

optimize.rev <- function(from, to) {
  optimize(revenue, interval=c(from, to), maximum=TRUE)
}