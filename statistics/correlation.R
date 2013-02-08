# cor(x, y, use='everything', method=c('pearson', 'kendall', 'spearman'))
# where x & y can be vectors
# or x == matrix && y = NULL
# use= how to treat NA values, ='all.obs', ='complete.obs', 
# ='na.or.complete' (where values are NA but return NA if all values are NA)
# ='pairwise.complete.obs' (omit pairs where at least one value is NA)

# Does a mother's weight gain correlate with the baby's weight?
library(nutshell)
data(births2006.smpl)

clean.births <- function() {
  births2006 = births2006.smpl;
  births2006[
    !is.na(births2006$WTGAIN)      &
    !is.na(births2006$DBWT)        &
    births2006$DPLURAL=='1 Single' &
    births2006$ESTGEST>35,
  ];
}

mom.and.baby <- function() {
  clean.births <- clean.births();
  smoothScatter(clean.births$WTGAIN, clean.births$DBWT);
}

person.cor.mom.and.baby <- function() {
  clean.births <- clean.births();
  cor(clean.births$WTGAIN, clean.births$DBWT);
}

spearman.cor.mom.and.baby <- function() {
  clean.births <- clean.births();
  cor(clean.births$WTGAIN, clean.births$DBWT, method='spearman');
}

# slight correlation but not massive



# COVARIANCE

# cov(x, y, use='everything', method=c('pearson', 'kendall', 'spearman'))
# cov2cor() with computed covariance matrix 
# cov.wt() compute weighted covariance