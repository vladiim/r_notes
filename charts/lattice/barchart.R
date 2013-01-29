library('lattice')
library('nutshell')

# BARCHART

# the example below works through changing how the barchart graphs to get
# a better understanding of the data from a stright barchart to more refined data display

barchart.dm <- function() {
  dob.dm <- births2006.delivery.method();
  barchart(dob.dm);
}

seperate.barchart.dm <- function() {
  dob.dm <- births2006.delivery.method();
  barchart(dob.dm, stack=FALSE, auto.key=TRUE);
}

no.groups.barchart.dm <- function() {
  dob.dm <- births2006.delivery.method();
  barchart(dob.dm, horizontal=FALSE, groups=FALSE);
}
