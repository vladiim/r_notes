# --------------------------------
# MARKET BASKET ANALYSIS
# --------------------------------

library(arules)

# function apriori()
# e.g. below will find 6.45% chance if a person 
# listens to song x then they will listen to song y

# usage:
# result <- data.apriori(data)
# summary(result)
# inspect(result)

data.apriori <- function(data) {
  # support 6.45% because of book
  apriori(
  	data=data,
  	parameter=new('APparameter', support=0.0645)
  )
}

# find frequent item sets with eclat()

# usage:
# result <- data.eclat(data)
# summary(result)
# inspect(result)

data.eclat <- function(data) {
	eclat(
		data=data,
		parameter=new('ECparameter', support=0.129, minlen=2)
	)
}

# --------------------------------
# CLUSTERING
# --------------------------------

# 1st step to clustering is to know the distance between 2 observations
# dist()

library(cluster)
library(nutshell)
data(sanfrancisco.home.sales)

sf.dist <- function() {
	daisy(
		na.omit(sanfrancisco.home.sales[,
			c('price', 'bedrooms', 'squarefeet', 'lotsize', 'year', 'latitude', 'longitude')
		]),
		metric='euclidean',
		stand=TRUE
	)
}

summary.sf.dist <- function() { summary(sf.dist()) }

kmeans.sf.price <- function() {
	kmeans(sf.dist(), centers=6)
}

# clusters
# library(cluster): kmeans(), pam(), agnes(), fanny()
# library(mona): cluster()
# library(class): batchSOM(), SOM()

sanfrancisco.home.sales$cluster <- NA

create.clusters <- function() {
	kmeans <- kmeans.sf.price();
	for (i in names(kmeans)) {
		sanfrancisco.home.sales[i, 'cluster'] <- kmeans$cluster[i]
	}
}

show.clusters <- function() {
	data <- create.clusters();
	by(data[ ,
		c('price', 'bedrooms', 'squarefeet',
		  'lotsize', 'year', 'latitude', 'longitude'
		)
	],
		INDICES=data$cluster,
		FUN=mean
	)
}