# source('./class.R') # includes the TimeSeries class defined in class.R

setClass("TimeSeries",
  # class of objects required
  representation(
    data="numeric",
    start="POSIXct",
    end="POSIXct"
  )
)

setClass("Person",
  representation(
    height="numeric",
    name="character"
  )
)

setClass("WeightHistory",
  contains=c("Person", "TimeSeries")
)

john <- new("WeightHistory",
  data=c(170 , 169, 171, 168, 170, 169),
  start=as.POSIXct("02/14/2009 0:00:00", tz="GMT",
  	    format="%m/%d/%Y %H:%M:%S"),
  end=as.POSIXct("03/28/2009 0:00:00", tz="GMT",
  	    format="%m/%d/%Y %H:%M:%S"),
  height=72,
  name="John Doe"
)