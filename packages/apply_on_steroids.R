# install.pacakges("plyr")
# When I first started using R, I was using basic control operations for manipulating data (for, if, while, etc.). I quickly learned that this was an amateur move, and that there was a better way to do it.

# In R, the apply family of functions is the preferred way to call a function on each element of a list or vector. While Base R has this out of the box, its usage can be tricky to master. I've found the plyr package to be an easy to use substitute for split, apply, combine functionality in Base R.

# plyr gives you several functions (ddply, daply, dlply, adply, ldply) following a common blueprint: Split a data structure into groups, apply a function on each group, return the results in a data structure.

# ddply splits a data frame and returns a data frame (hence the dd). daply splits a data frame and results an array (hence the da). Hopefully you're getting the idea here.

library(plyr)
 
# split a data frame by Species, summarize it, then convert the results
# into a data frame
ddply(iris, .(Species), summarise,
      mean_petal_length=mean(Petal.Length)
)
#     Species mean_petal_length
#1     setosa             1.462
#2 versicolor             4.260
#3  virginica             5.552
 
# split a data frame by Species, summarize it, then convert the results
# into an array
unlist(daply(iris[,4:5], .(Species), colwise(mean)))
#    setosa.Petal.Width versicolor.Petal.Width  virginica.Petal.Width 
#                 0.246                  1.326                  2.026 