# work out how much data you need

# power .95 = prob of type 2 error = .05

# power.t.test()

test.power.questionnaire <- function() {
  power.t.test(power=.95, sig.level=.05, sd=8.9, n=25);
}

    #       n = 25
    #       delta = 9.26214
    #          sd = 8.9
    #   sig.level = 0.05
    #       power = 0.95
    # alternative = two.sided
# difference between 2 groups would need to be at least 9.2 for the results to be significant

# double

double.test.power.questionnaire <- function() {
  power.t.test(power=.95, sig.level=.05, sd=8.9, n=50);
} # delta = 6.48

# DESIGNING THE EXPERIMENT

# t-test (population & control)
	# power.t.test()

# proportion test
	# power.prop.test()

# e.g. a batter normally bats @ .260 but in x situation bats .300, is this stat sig?
batter.300 <- function() {
  power.prop.test(p1=.260, p2=.300, sig.level=0.05, power=.95, alternative='one.sided');
} # n=27724, when sig.level=NULL n=10

# anova test design
	# power.anova.test()

