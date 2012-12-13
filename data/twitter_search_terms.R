doInstall <- TRUE
toInstall <- c("twitteR", "lubridate")
if(doInstall){install.packages(toInstall, repos = "http://cran.us.r-project.org")}
lapply(toInstall, library, character.only = TRUE)

searchTerms <- c("New York", "Los Angeles", "Chicago", "Houston", "Philadelphia",
                 "Phoenix", "San Antonio", "San Diego", "Dallas", "San Jose",
                 "Jacksonville", "Indianapolis", "Austin", "San Francisco", 
                 "Columbus", "Fort Worth", "Charlotte", "Detroit", "El Paso",
                 "Memphis")

names(searchTerms) <- searchTerms

searchResults <- lapply(searchTerms, function(tt){
  print(tt)
  searchTwitter(searchString = tt, n = 1000)  # Get all Tweets with each search term
  })

tweetFrames <- lapply(searchResults, twListToDF)  # Convert to Tweet DFs.
tweetFrames <- lapply(tweetFrames, function(df){
  df$timeStamp <- ymd_hms(as.character(df$created))  # lubridate the timestamps
  return(df)
  })

timeElapsed <- unlist(lapply(tweetFrames, function(df){
  as.numeric(diff(range(df$timeStamp)), units = "secs")
  }))

nTweets <- unlist(lapply(tweetFrames, function(df){
  nrow(df)  # Sometimes this is less than the n requested with searchTwitter()
  }))

tweetsPerSec <- nTweets / timeElapsed

# Population counts, from: http://en.wikipedia.org/wiki/List_of_United_States_cities_by_population
populationCounts <- c(8175133, 3792621, 2695598, 2099451, 1526006, 1445632,
                      1327407, 1307402, 1197816, 945942, 821784, 820445, 790390, 
                      805235, 787033, 741206, 731424, 719777, 649121, 646889)

comparisonFrame <- data.frame(TPS = tweetsPerSec)
comparisonFrame$Population <- populationCounts

with(comparisonFrame, plot(log(Population), TPS, type = "n"))
with(comparisonFrame, text(log(Population), TPS, rownames(comparisonFrame)))