library('lattice')
library('nutshell')

# QUANTILE-QUANTILE
# compares the distribution of actual data values to a theoretical distribution

qq.birth.weight <- function() {
  data(births2006.smpl);
  qqmath(~DBWT|DPLURAL, data=births2006.smpl[sample(1:nrow(births2006.smpl), 50000), ],
         pch=19, cex=0.25, subset=(DPLURAL != '5 Quintuplet or higher'));
}

qq.sf.houseprice <- function() {
  data(sanfrancisco.home.sales);
  qqmath(~price, data=sanfrancisco.home.sales);
}

log.qq.sf.houseprice <- function() {
  data(sanfrancisco.home.sales);
  qqmath(~log(price), group=bedrooms, data=subset(sanfrancisco.home.sales,
         !is.na(bedrooms)&bedrooms>0&bedrooms<7),
         auto.key=TRUE, drop.unused.levels=TRUE, type='smooth');
}

# cut2() in Hmisc is used to divide square footages into siz even quantiles
qq.sf.houseprice.by.squarefoot <- function() {
  library(Hmisc);
  data(sanfrancisco.home.sales);
  qqmath(~log(price), groups=cut2(squarefeet, g=6),
                      data=subset(sanfrancisco.home.sales, !is.na(squarefeet)),
                      auto.key=TRUE, drop.unused.levels=TRUE, type='smooth');
}
