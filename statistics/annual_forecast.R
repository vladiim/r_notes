library(forecast)
y <- filter(x,rep(1,12), sides=1) # Total of last 12 months

# forecasts of the annual totals:
fit <- auto.arima(y)
forecast(fit,h=12)


# Note that diff(y,lag=1) is the same as diff(x,lag=12). 
# So, provided , if an ARIMA(p,d,q)(P,D,Q)12 is appropriate for the x series, 
# then an ARIMA(p,d+1,q)(P,D-1,Q)12 is appropriate for the y series. 
# However, auto.arima may not choose the equivalent models because the 
# filtering and differencing will lead to different numbers of observations. 
# To take advantage of this result, and use all the available data as efficiently 
# as possible, the following code is better, assuming  is appropriate for x:
fit <- auto.arima(x,d=1,D=1)
fit$arma[c(6,7)] <- c(2,0)
fit <- Arima(y,model=fit)
forecast(fit,h=12)