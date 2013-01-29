library('lattice')
library('nutshell')

# HISTOGRAM

birth.weight.by.number <- function(...) {
  data(births2006.smpl);
  histogram(~DBWT|DPLURAL, data=births2006.smpl, ...);
}

stack.birth.weight.by.number <- function() {
  birth.weight.by.number(layout=c(1, 5));
}
