library('lattice')
library('nutshell')

# STRIPPLOT

stripplot.4.babies <- function() {
  data(births2006.smpl);
  stripplot(~DBWT, data=births2006.smpl,
            subset=(DPLURAL=='5 Quintuplet or higher' |
                    DPLURAL=='4 Quadruplet'), jitter.data=TRUE);
}
