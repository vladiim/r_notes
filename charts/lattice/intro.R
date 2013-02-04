# strength of lattice is splitting a chart into different panels
# or grouping via colors or symbols

library('lattice')
library('nutshell')

# functions
# barplot
# dotchart
# hist
# density
# plot.density
# stripchart
# xyplot
# xplot
# pairs
# image
# contour
# persp

# get value of a setting
trellis.par.get('axis.text')

# all settings text
trellis.par.get()

# all settings as graphic
show.settings()

# change a value of a setting
trellis.par.set(list(axis.text=list(cex=0.5)))

simple.data <- function() {
  data.frame(x=c(0:9), y=c(1:10), z=rep(c('a', 'b'), times=5));
}

simple.xy <- function() {
  d = simple.data();
  xyplot(y~x, data=d);
}

simple.xy.xz <- function() {
  d = simple.data();
  xyplot(y~x|z, data=d);
}

simple.superimposed <- function() {
  d = simple.data();
  xyplot(y~x, groups=z, data=d);
}

panel.and.line <- function() {
  d = simple.data();
  xyplot(y~x|z, data= d,
    panel=function(...) {
  	  panel.abline(a=1, b=1);
  	  panel.xyplot(...);
    }
  )
}

bar.births <- function() {
  data(births2006.smpl);
  b <- table(births2006.smpl$DOB_WK);
  barchart(b);
}

delivery.method <- function() {
  data(births2006.smpl);
  transform(births2006.smpl[births2006.smpl$DMETH_REC != 'Unknown',],
                            DMETH_REC=as.factor(as.character(DMETH_REC)));
}

births2006.delivery.method <- function() {
  delivery.method <- delivery.method();
  table(WK=delivery.method$DOB_WK, MM=delivery.method$DMETH_REC);
}

births.dob.m.wk <- function() {
  delivery.method <- delivery.method();
  table(WEEK=delivery.method$DOB_WK, MONTH=delivery.method$DOB_MM, METHOD=delivery.method$DMETH_REC);
}
