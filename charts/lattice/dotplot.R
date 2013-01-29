library('lattice')
library('nutshell')

# DOT PLOT

dob.by.day.and.month <- function() {
  dob.m.wk <- births.dob.m.wk();
  dotplot(dob.m.wk, stack=FALSE, auto.key=TRUE, groups=TRUE);
}

tires.time.to.fail.by.speed <- function() {
  data(tires.sus);
  dotplot(as.factor(Speed_At_Failure_km_h)~Time_To_Failure|Tire_Type, data=tires.sus);
}
