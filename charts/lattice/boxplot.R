library('lattice')
library('nutshell')
data(sanfrancisco.home.sales)

# sales.by.month <- function() {
#   table(cut(sanfrancisco.home.sales$salesdate, 'month'));
# }

sales.by.month <- function() {
  bwplot(price~cut(saledate, 'month'), data=sanfrancisco.home.sales);
}

log.sales.by.month <- function() {
  bwplot(log(price)~cut(saledate, 'month'),
  	     data=sanfrancisco.home.sales,
  	     scales=list(x=list(rot=90)));
}