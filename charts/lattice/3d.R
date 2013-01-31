library('lattice')
library('nutshell')

data(sanfrancisco.home.sales)

# to represent flat 3d data

home.sales.map <- function() {
  attach(sanfrancisco.home.sales)
  levelplot(table(cut(longitude, breaks=40),
  	              cut(latitude, breaks=40),
  	        scales=list(y=list(cex=.5),
  	        	        x=list(rot=90, cex=.5))));
}

average.home.sales.map <- function() {
  attach(sanfrancisco.home.sales)
  levelplot(tapply(price, INDEX=list(cut(longitude, breaks=40),
  	                                 cut(latitude, breaks=40)),
                          FUN=mean),
                   scales=list(draw=FALSE))
}

# to represent contour plots/topographic maps
contourplot()

# points in 3d space
cloud()

# 3d surface
wireframe()

# fitted model to a data set
rfs() # plots residual & fit-spread plots