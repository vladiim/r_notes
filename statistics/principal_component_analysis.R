# breaks a set of (possibly correlated) vars into set of uncorrelated vars

# prcomp() in stats() package

db.con <- function() {
  library(RSQLite);
  drv <- dbDriver("SQLite");
  dbConnect(drv, dbname=paste(.Library, '/nutshell.bbdb/extdata/bb.db', sep=''));
}

batting.data <- function() {
  con <- db.con();
  data <- dbGetQuery(con, paste(
  	' SELECT teamID, yearID, R as runs, ',
  	' H-"2B"-"3B"-HR as singles, ',
  	' "2B" as doubles, "3B" as triples, HR as homeruns, ',
    ' BB as walks, SB as stolenbases, CS as caughtstealing, ',
    ' HBP as hitbypitch, SF as sacrificeflies, ',
    ' AB as atbats ',
    ' FROM Teams ',
    ' WHERE yearID between 2000 and 2008'
  ))
}

batting.pca <- function() {
  data <- batting.data();
  princomp(~singles+doubles+triples+homeruns+walks+
  	        hitbypitch+sacrificeflies+stolenbases+
  	        caughtstealing, data=data)
}

# plot(batting.pca())
# biplot(batting.pca(), cex=0.5,col=c('gray50', 'black'))

# > batting.pca()
# princomp(formula = ~singles + doubles + triples + homeruns + 
#     walks + hitbypitch + sacrificeflies + stolenbases + caughtstealing, 
#     data = data)

# Standard deviations:
#    Comp.1    Comp.2    Comp.3    Comp.4    Comp.5    Comp.6    Comp.7    Comp.8 
# 74.900981 61.871086 31.811398 27.988190 23.788859 12.884291  9.150840  8.283972 
#    Comp.9 
#  7.060503 

#  9  variables and  270 observations.

# > summary(batting.pca())
# Importance of components:
#                            Comp.1     Comp.2     Comp.3      Comp.4      Comp.5
# Standard deviation     74.9009809 61.8710858 31.8113983 27.98819003 23.78885885
# Proportion of Variance  0.4610727  0.3146081  0.0831687  0.06437897  0.04650949
# Cumulative Proportion   0.4610727  0.7756807  0.8588494  0.92322841  0.96973790
#                             Comp.6      Comp.7      Comp.8      Comp.9
# Standard deviation     12.88429066 9.150840397 8.283972499 7.060503344
# Proportion of Variance  0.01364317 0.006882026 0.005639904 0.004096998
# Cumulative Proportion   0.98338107 0.990263099 0.995903002 1.000000000

# show contribution of each variable to the components
# > loadings(batting.pca())

# Loadings:
#                Comp.1 Comp.2 Comp.3 Comp.4 Comp.5 Comp.6 Comp.7 Comp.8 Comp.9
# singles         0.313  0.929 -0.136         0.136                            
# doubles                      -0.437  0.121 -0.877               -0.100       
# triples                                                   0.424  0.775 -0.449
# homeruns       -0.235        -0.383  0.825  0.324                            
# walks          -0.914  0.328  0.150 -0.182                                   
# hitbypitch                                        -0.989                     
# sacrificeflies                                            0.321  0.330  0.882
# stolenbases            0.131  0.758  0.502 -0.307        -0.232              
# caughtstealing                0.208  0.104                0.813 -0.521 -0.105

#                Comp.1 Comp.2 Comp.3 Comp.4 Comp.5 Comp.6 Comp.7 Comp.8 Comp.9
# SS loadings     1.000  1.000  1.000  1.000  1.000  1.000  1.000  1.000  1.000
# Proportion Var  0.111  0.111  0.111  0.111  0.111  0.111  0.111  0.111  0.111
# Cumulative Var  0.111  0.222  0.333  0.444  0.556  0.667  0.778  0.889  1.000
