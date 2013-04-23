# ------------------------------
# MACHINE LEARNING CLASSIFICATION ALGORITHMS
# ------------------------------

library(nutshell)
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


# ------------------------------
# K NEAREST NEIGHBORS
# ------------------------------

library(class)

compare.actual.and.knn <- function(pred, actual) {
  table(predicted=pred,
  	    actual=actual$is_spam
  )
}

# ------------------------------
# K = 1

spam.knn <- function() {
  train <- spam.train();
  knn(
  	train=train,
  	test=spam.validation(),
  	cl=train$is_spam
  )
}

spam.knn.sum <- function() { summary(spam.knn()) }

compare.actual.and.knn1 <- function() { compare.actual.and.knn(spam.knn(), spam.validation()) }

# ------------------------------
# K = 5

spam.knn5 <- function() {
  train <- spam.train();
  knn(
  	train=train,
  	test=spam.validation(),
  	cl=train$is_spam,
  	k=5
  )
}

spam.knn5.sum <- function() { summary(spam.knn5()) }

compare.actual.and.knn5 <- function() { compare.actual.and.knn(spam.knn5(), spam.validation()) }

# ------------------------------
# CLASSIFICATION TREE MODELS
# ------------------------------

library(rpart)

spam.tree <- function() { rpart(is_spam~., data=spam.train()); }

spam.tree.printcp <- function() { printcp(spam.tree()) }

spam.tree.plot <- function() {
  data <- spam.tree();
  plot(data, uniform=TRUE);
  text(data, all=TRUE, cex=0.75, splits=TRUE, use.n=TRUE, xpd=TRUE);
}

compare.rpart <- function() {
  actual <- spam.validation();

  table(
  	actual=actual,
  	predicted=predict(spam.tree(), newdata=actual, type='class')
  )
}

# ALT PLOTTING

library(maptree)

spam.maptree <- function() {
  data <- spam.tree();
  draw.tree(
  	data, cex=0.5, nodeinfo=TRUE, col=gray(0:8 / 8)
  )
}

# ------------------------------
# BAGGING
# ------------------------------

library(adabag)

spam.bag <- function() {
  bagging(formula=is_spam~., data=spam.train())
}

spam.bag.sum <- function() { summary(spam.bag()); }

spam.compare.bag <- function() {
  train <- spam.train();
  table(
  	actual=train$is_spam,
  	predicted=predict(spam.bag(), newdata=train)$class
  )
}

# ------------------------------
# BOOSTING
# ------------------------------

library(ada)

spam.ada <- function() {
  ada(
  	formula=is_spam~.,
  	data=spam.train(),
  	loss='logistic'
  )
}

# ------------------------------
# NEURAL NETWORKS
# ------------------------------

library(nnet)

spam.nnet <- function() {
  nnet(
  	is_spam~.,
  	data=spam.train(),
  	size=10,
  	decay=0.1
  )
}

# ------------------------------
# SUPPORT VECTOR MACHINES SVNS
# ------------------------------

library(e1071)

spam.svm <- function() {
  svm(
  	is_spam~.,
  	data=spam.train()
  )
}

# ------------------------------
# RANDOM FORESTS
# ------------------------------

library(randomForest)

spam.rf <- function() {
  randomForest(
    is_spam~.,
    data=spam.train()
  )
}