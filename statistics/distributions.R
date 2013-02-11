# many stat tests work by calculating a test stat and comparing
# it to a value from a theoretical distribution

# generate values by:
	# prob d functions (PDFs) begin with d
	# dist functions begin with p
	# quantile funcs begin with q
	# random funcs begin with r

# PROBABILITY DENSITY
# to find probability density at given value use dnorm()

prob.density.dist <- function() {
  plot(dnorm, -3, 3, main='WH00T');
}

# NORMAL DISTRIBUTION
# pnorm() - will tell you the probability that a randomly selected val from the dist is <= q or p = Pr(x<= q)
# qnorm = opposite val is >= q

# mean = 0, normal dist = standard - pnorm(0) = 0.5
# what is the prob that the value is within 1.96 sd's of the mean?
# > pnorm(-1.96, lower.tail=TRUE) + pnorm(1.96, lower.tail=FALSE)
# [1] 0.04999579
# > plot(pnorm,-3,3,main='blah')

# get a random sample from a distribution, good for sampling & testing stats
# rnorm()
get.random <- function() {
  hist(rnorm(10000), breaks=50);
}

# DIST FUNCTION FAMILIES

# family			       | func

# beta			       | dbeta, qbeta, pbeta, rbeta
# binomial		       | dbinorm, pbinorm, qbinorm, rbinorm
# birthday	 	       | pbirthday, qbirthday
# cauchy			       | dcauchy, pcauchy, qcauchy, rcauchy
# chi-squared		       | dchisq, pchisq, qchisq, rchisq
# exponential		       | dexp, pexp, qexp, rexp
# f-distribution         | df, pf, qf, rf
# gamma			       | dgamma, pgamma, qgamma, rgamma
# geometric		       | dgeom, pgeom, qgeom, rgeom
# hypergeometric         | dhyper, phyper, qhyper, rhyper
# log-normal             | dlnorm, plnorm, qlnorm, rlnorm
# logistic 		       | dlogis, plogis, qlogis, rlogis
# multinominal dist      | dmultinom, rmultinom
# negative binom         | dnbinom, pnbinom, qnbinom, rnbinom
# normal 			       | dnorm, pnorm, qnorm, rnorm
# poison  		       | dpois, ppois, qpois, rpois
# students t-dist        | dt, pt, qt, rt
# studentized range dist | ptukey, qtukey
# uniform dist 		   | dunif, punif, qunif, runif
# weibull 			   | dweibull, pweibull, qweibull, rweibull
# wilcoxon rank sum      | dwilcox, pwilcox, qwilcox, rwilcox
# wilcoxon signed rank   | dsignrank, psignrank, qsignrank, rsignrank