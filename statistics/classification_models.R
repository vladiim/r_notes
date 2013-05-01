# ------------------------------
# LINEAR CLASSIFICATION MODELS
# ------------------------------

# ------------------------------
# LOGISTIC REGRESSION
# ------------------------------

# model the relationship between a goal kicker's likelihood to succeed based
# on how far they are from the goal

library(nutshell)
data(field.goals)

data <- transform(field.goals, good=as.factor(ifelse(play.type=='FG good', 'good', 'bad')))

field.goals.table <- function() {
  table(data$good, data$yards);
}

field.goals.plot <- function() {
  data <- field.goals.table();
  plot(colnames(data),
  	data['good',]/(data['bad',]+data['good',]),
  	xlab='Distance (Yards)', ylab='% Good'
  )
}

field.goals.plot.success.prob <- function() {
  field.goals.plot();
  lines(15:65, fg.prob(15:65), new=TRUE)
}

fg.prob <- function(y) {
  eta <- 5.178856 + -0.097261 * y;
  1/(1+exp(-eta));
}

field.goals.glm <- function() {
  glm(formula=good~yards,
  	  data=data,
  	  family='binomial'
  )
}

sum.field.goals.glm <- function() {
  summary(field.goals.glm());
}

# ------------------------------
# LINEAR/QUADRATIC DISCRIMINANT ANALYSIS
# ------------------------------

# find the combination of features that best separate observations into classes
# the lda(), qda() & fda() functions are interchangeable (data passed in the same)

library(MASS)
library(sampling)
data(spambase)

is.spam <- function() {
  table(spambase$is_spam);
}

spam.strata <- function() {
  strata(spambase, stratanames=c('is_spam'), size=c(1269, 1951), method='srswor');
}

spam.train <- function() {
  strata <- spam.strata();
  spambase[rownames(spambase) %in% strata$ID_unit,]
}

spam.validation <- function() {
  strata <- spam.strata();
  spambase[!(rownames(spambase) %in% strata$ID_unit),]
}

spam.qda <- function() {
  data <- spam.train();
  qda(formula=is_spam-.,
  	  data=data);
}

spam.qda.sum <- function() {
  summary(spam.qda());
}

spam.qda.check.w.training <- function() {
  train <- spam.train();
  validation <- spam.validation();

  table(actual=train$is_spam, predicted=predict(spam.qda(), newdata=validation$is_spam)$class);
}

# ------------------------------
# LOG-LINEAR MODELS
# ------------------------------

# loglin uses iterative proportional fitting (IPF)

# ------------------------------
# BINNING
# ------------------------------

library(data.table)
data(movies, package='ggplot2')
library(lattice)
 
movies <- data.table(movies)
 
nBins <- 500
 
## 2D Binning
movies[, c('ratBin', 'votesBin'):=list(floor(rating/nBins), floor(votes/nBins))]
setkey(movies, ratBin, votesBin)
## Cross Join (as expand.grid) ...
bins <- CJ(0:nBins, 0:nBins)
## ... used to extract records from movies corresponding to each 2D bin
movies2 <- movies[bins, list(.N, rating, votes), nomatch=0]
## Finally aggregate with mean
movies3 <- movies2[,lapply(.SD, mean),
                   by=list(ratBin, votesBin)]
 
xyplot(votes ~ rating, data=movies3, cex=asinh(movies3$N)/5,
       alpha=0.6, pch=21, fill='blue', col='black')