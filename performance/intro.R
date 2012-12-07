# PRE ALLOCATE MEMORY

# wrong:
v <- c()
for (i in 1:1000) { v[i] <- i; }

# right:
v2 <- c(NA)
length(v2) <- 1000
for (i in 1:1000) { v2[i] <- i; }

# MONITOR MEMORY
gc() # global memory
object.size(o)
memory.profile() # info on memory usage by object.type()

# REMOVE BIG OBJECTS TO FREE SPACE
rm(big_object)

# WORKING WITH BIG DATASETS
library(biglm)
library(bigglm) # datasets inside database

# PARRELLEL COMPUTING
library(doMC)
registerDoMC()
# allows the %dopar% operator
# more packages for PARRELLEL
# doMPI
# doSNOW
# doNWS

# use revolution R - improved math binaries