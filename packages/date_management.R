install.packages("lubridate")
# I've never had great luck with dates in R. I've never fully grasped the idiosyncracies of working with POSIXs vs. R Dates. Enter lubridate.

# lubridate is one of those magical libraries that just seems to do exactly what you expect it to. The functions all have obvious names like year, month, ymd, and ymd_hms. It's similar to Moment.js for those familiar with javascript.

library(lubridate)
 
year("2012-12-12")
#[1] 2012
day("2012-12-12")
#[1] 12
ymd("2012-12-12")
#1 parsed with %Y-%m-%d
#[1] "2012-12-12 UTC"
view rawlubridate_example.RThis Gist brought to you by GitHub.
Here's a really handy reference card that I found in a paper. It covers just about everything you might conveivably want to do to a date. I've also found this Date Cheat Sheet to be a handy reference.