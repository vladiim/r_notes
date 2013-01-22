# load R file into env
# source('dir/to/file.R')

# GLOBAL ENV
# assign()
# get()
# exists()
# objects()
# remove()
# search()
# searchpaths()
# attach()
# detach()
# emptyenv()
# parent.env()
# baseenv()
# globalenv()
# environment()
# new.env()

# CALL STACK
# sys.call()
# sys.frame()
# sys.nframe()
# sys.function()
# sys.parent()
# sys.calls()
# sys.frames()
# sys.parents()
# sys.on.exit()
# sys.status()
# parent.frame()

# WHERE ARE LIBRARIES STORED
# .libPaths()

# USEFUL SHORTHAND
# evalq()       -> eval(quate(expr), ...)
# eval.parent() -> eval(expr, parent.frame(n))
# local()       -> eval(quote(expr), envir=new.env())

# TREAT DATA AS ENV
# with(data, expr, ...)      # eval & return result
# within(data, expr, ...)    # change the data then return

# ATTACH OBJECTS TO CURRENT ENV
# attach()

# TIME THE EXECUTION OF A FUNCTION
timethis <- function(...) {
  start.time <- Sys.time();
  eval(..., sys.frame(sys.parent(sys.parent())));
  end.time <- Sys.time();
  print( end.time - start.time );
}

vector.of.ones.a <- function(n) {
  return.vector <- NA;
  for ( i in 1:n ) { return.vector[i] <- i; }
  return.vector;
}

vector.of.ones.b <- function(n) {
  return.vector <- NA;
  length(return.vector) <- n;
  for ( i in 1:n ) { return.vector[i] <- i; }
  return.vector;
}

test.timethis <- function(func) {
  timethis(func)
}