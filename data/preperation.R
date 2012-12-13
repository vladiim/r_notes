# often you need to combine data from different sources
# the most basic function to do this is paste()
x <- c('a', 'b')
y <- c('x', 'y')
paste(x, y)
paste(x, y, sep='**')
paste(x, y, collapse="#") # 1 value back not vector