library(rpart)
require(nutshell)
data(sanfrancisco.home.sales)

# for a simple approach start by estimating the root mean square (RMS) error
# for the training and validation data set

calc.rms.error <- function(mdl, train, test, yval) {
  train.yhat <- predict(object=mdl, newdata=train);
  test.yhat  <- predict(object=mdl, newdata=test);
  train.y    <- with(train, get(yval));
  test.y     <- with(test, get(yval));
  train.err  <- sqrt(mean((train.yhat - train.y)^2));
  test.err   <- sqrt(mean((test.yhat - test.y)^2));
  c(train.err = train.err, test.err=test.err);
}

percent.70.number <- function() { nrow(sanfrancisco.home.sales) * .7 }

san.fran.home.sales.training.indicies <- sample(1:nrow(sanfrancisco.home.sales), percent.70.number())
san.fran.home.sales.testing.indicies  <- setdiff(rownames(sanfrancisco.home.sales), san.fran.home.sales.training.indicies)

san.fran.home.sales.training <- sanfrancisco.home.sales[san.fran.home.sales.training.indicies,]
san.fran.home.sales.testing  <- sanfrancisco.home.sales[san.fran.home.sales.testing.indicies,]

# ------------------------------
# REGRESSION TREE MODELS
# ------------------------------

# CART - Classified and regression trees

sf.price.model.rpart <- rpart(price~bedrooms+squarefeet+lotsize+latitude+longitude+neighborhood+month,
	                          data=san.fran.home.sales.training)

plot.sf.price.rpart <- function() {
  plot(sf.price.model.rpart, uniform=TRUE, compress=TRUE, lty=3, branch=0.7);
  text(sf.price.model.rpart, all=TRUE, digits=7, use.n=TRUE, cex=0.4, xpd=TRUE)
}

graphical.output.rpart <- function() {
  rsq.rpart(sf.price.model.rpart)
  prune(sf.price.model.rpart, cp=0.11)
}

# ------------------------------
# CALCULATE THE ERROR IN OUR MODEL
# ------------------------------

cal.rpart.error <- function() {
  calc.rms.error(sf.price.model.rpart,
  	                  san.fran.home.sales.training,
  	                  san.fran.home.sales.testing,
  	                  'price')
}

# ------------------------------
# BAGGING MODELS
# ------------------------------

library(ipred)

sf.price.bagging <- function() {
  summary(bagging(
    price~bedrooms+squarefeet+lotsize+latitude+longitude+neighborhood+month,
    data=san.fran.home.sales.training, nbagg=100
  ))
}

calc.bagging.error <- function() {
  calc.rms.error(sf.price.bagging(),
                 san.fran.home.sales.training,
                 san.fran.home.sales.testing,
                 'price')
}

# ------------------------------
# BOOSTING MODELS
# ------------------------------

# like bagging but gives more weight to better models - bagging doesn't

library(mboost)

sf.price.blackboost <- function() {
  summary(blackboost(
    price~bedrooms+squarefeet+lotsize+latitude+longitude+neighborhood+month,
    data=san.fran.home.sales.training
  ))
}

# ------------------------------
# RANDOM FOREST MODELS
# ------------------------------

library(randomForest)

sf.price.randomforest <- randomForest(
  formula=price~bedrooms+squarefeet+lotsize+longitude+month,
  data=san.fran.home.sales.training,
  na.action=na.omit
)

# ------------------------------
# MARS
# ------------------------------

# multivariate adaptive regression splines

library(earth)

sf.price.earth <- function() {
  earth(
    price~bedrooms+squarefeet+latitude+longitude+neighborhood+month,
    data=na.omit(san.fran.home.sales.training),
    trace=1 #this shows some trace details on the model
  )
}

sum.sf.price.earth <- function() {
  summary(sf.price.earth());
}

synopsis.variable.importance.earth <- function() {
  evimp(sf.price.earth())
}

plot.sf.earth <- function() {
  plot(sf.price.earth());
}

plotmo.earth <- function() {
  plotmo(sf.price.earth());
}

earth.errors <- function() {
  calc.rms.error(
    sf.price.earth(),
    na.omit(san.fran.home.sales.training),
    na.omit(san.fran.home.sales.testing),
    'price'
  )
}

# ------------------------------
# NEURAL NETWORKS
# ------------------------------

library(nnet)

sf.price.nnet <- function() {
  nnet(
    price~bedrooms+squarefeet+latitude+longitude+neighborhood+month,
    data=san.fran.home.sales.training,
    size=12, skip=TRUE, linout=TRUE, decay=0.025, na.action=na.omit
  )
}

# ------------------------------
# SUPPORT VECTOR MACHINES SVNS
# ------------------------------

library(e1071)

sf.price.svm <- function() {
  svm(
    price~bedrooms+squarefeet+latitude+longitude+neighborhood+month,
    data=san.fran.home.sales.training
  )
}