# Date - dates but *not* times
# POSIXct - dates & times as seconds from Jan 1, 1970 12:00AM
# POSIXlt dates & times in separate vectors

# CREATE
start <- as.Date('2/3/2012', "$m/%d/%Y")
today <- Sys.Date()

today - start # time difference of xyz