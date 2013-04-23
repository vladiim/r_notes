library(survival)

cal.surv <- function() {
	transform(GSE2034,
	  surv = Surv(
	    time = GSE2034$months.to.relapse.or.last.followup,
	    event = GSE2034$relapse,
	    type = 'right'
	  )
	)
}

# CREATE SURVIVAL MODEL

surv.model <- function() {
  survfit(
  	formula = surv ~ ER.Status,
  	data = cal.surv()
  )
}

# PLOT MODEL

plot.surv <- function() {
  plot(surv.model, lty=1:2, log=TRUE);
}