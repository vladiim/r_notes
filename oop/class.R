# CREATE A CLASS

setClass("TimeSeries",
  # class of objects required
  representation(
    data="numeric",
    start="POSIXct",
    end="POSIXct"
  )

  # initialize() this function will be called once class is instantiated
)

# INTROSPECTION
# is(C1, C2)      # is C1 member of C2?
# extends(C1, C2) # does C1 extend C2?
# slotNames(o)    # list object's slotnames
# getSlotes(o)    # classes associated w/ slots
# methods(c)
# getS3method(f='histogram', class='formula')  # gets hidden histogram.formula method
# getAnywhere(histogram.formula) # as above

# COERCION
# as(C1, C2)
# setAs() create your own coercion methods

# VALIDATION
# setValidity("TimeSeries",
#   function(object) {
#     object@start <= object@end &&
#     length(object@start) == 1 &&
#     length(object@end) == 1
#   }
# )

# CREATE METHOD
period.TimeSeries <- function(object) {
  if (length(object@data) > 1) {
  	(object@end - object@start) / (length(object@data) - 1)
  } else {
  	Inf
  }
}

# POLYMORPHIC METHOD
# Gets any classes' data
series <- function(object) { object@data }
setGeneric('series')
# usage: series(my.ts)

period <- function(object) { object@period }
setGeneric("period")
setMethod(period, signature=c("TimeSeries"), definition=period.TimeSeries)

# EXTEND EXSISTING FUNCTIONS

setMethod("summary",
	      signature="TimeSeries",
	      definition=function(object) {
            print(paste(object@start,
            	  " to ",
            	  object@end,
            	  sep ="",
            	  collapse=","))
            print(paste(object@data, sep="", collapse=","))
          }
)

# CREATE METHOD FROM OPERATOR

setMethod("[",
  signature=c("TimeSeries"),
  definition=function(x, i, j, ..., drop) {
  	x@data[i]
  }
)

# INSTANTIATE

my.ts <- new("TimeSeries",
              data=c(1:6),
              start=as.POSIXct("07/01/2009 0:00:00", tz="GMT",
              	    format="%m/%d/%Y %H:%M:%S"),
              end=as.POSIXct("0701/2009 0:05:00", tz="GMT",
              	    format="%m/%d/%Y %H:%M:%S")
              )