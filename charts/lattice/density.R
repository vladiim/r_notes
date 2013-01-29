library('lattice')
library('nutshell')

# DENSITY PLOTS
# single line showing dist instead of cols

# redo stack.birth.weight.by.number() as density
density.birth.weight.by.number <- function() {
  data(births2006.smpl);
  densityplot(~DBWT|DPLURAL, data=births2006.smpl, layout=c(1,5), plot.points=FALSE);
}

stacked.density.birth.weight.by.number <- function() {
  data(births2006.smpl);
  densityplot(~DBWT, groups=DPLURAL, data=births2006.smpl, plot.points=FALSE, auto.key=TRUE);
}
