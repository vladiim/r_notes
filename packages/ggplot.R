# http://ggplot2.org/
# https://github.com/hadley/ggplot2/wiki

# Useful stats & default geoms
# stat            | desc             | geom
# stat_bin()      | # obs in bin     | geom_bar()
# stat_smooth()   | smooth line      | geom_line()
# stat_sum()      | adds values      | geom_point()
# stat_identity() | plots data as is | geom_point()
# stat_boxplot()  | box & whisker    | geom_boxplot()

# BAR CHART
# geom_bar() returns a hist by default
# need to set up aggregate 1st & use stat = 'identity' to return a bar chart

set.agg <- function() {
  quakes.agg <- aggregate(mag ~ round(depth, -1), data = quakes, FUN  = length)

  names(quakes.agg) <- c('depth', 'mag')

  quakes.agg
}

barchart.quakes <- function() {
  aggr <- set.agg()

  ggplot(aggr, aes( x = depth, y = mag )) +
    geom_bar( stat = 'identity' )
}

# SCATTER PLOT
scatter.quakes <- function() {
  ggplot(quakes, aes( x = long, y = lat)) + geom_point()
}

# LINE CHART
# good for time series data
line.longley <- function() {
  ggplot(longley, aes( x = Year, y = Unemployed )) + geom_line() # geom_line orders by x-val
  #ggplot(longley, aes( x = Year, y = Unemployed )) + geom_path()   # geom_path orders by obs order in data
}

# BINNING DATA
bin.quake.1 <- function() {
  ggplot(quakes, aes( x = depth )) + geom_bar( binwidth = 50 )
}

bin.quake.2 <- function() {
  ggplot(quakes, aes( x = depth )) + stat_bin( binwidth = 50 )
}

# LOGICAL REGRESSION
regres.longley <- function() {
  ggplot(longley, aes( x = Year, y = Employed )) + 
                  geom_point() + 
                  stat_smooth(method = 'lm')   # linear regression model
                  # stat_smooth(method = 'loess') # default logical regression
}

# FACETS
# facet_grid() allows you to create 2-dim grid
# the tide ~ separates row variable from coloumn variable
# facet_wrap() is similar
facet.1 <- function() {
  ggplot(mtcars, aes( x = hp, y = mpg )) +
                 geom_point() +
                 stat_smooth( method = "lm" ) +
                 facet_grid( ~cyl )
}

# TITLES LABELS ETC
titles.labels <- function() {
  ggplot(mtcars, aes( x = hp, y = mpg )) +
                 geom_point( color = 'red' ) +
                 xlab("X LABEL") +
                 ylab("Y LABEL YO!") +
                 labs(title = "TITLE SUCKA!")
}

# WORKING W/ SCALES
scale.by.factor <- function() {
  ggplot(mtcars, aes( x = hp, y = mpg )) +
                 geom_point( aes( shape = factor(cyl), colour = factor(cyl))) +
                 scale_shape_discrete( name = "Cylinders") +
                 scale_colour_discrete( name = "Cylinders")
                 # scale_x_continuous()  # change x-axis scale
}