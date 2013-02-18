install.packages("qcc")
# qcc is a library for statistical quality control. Back in the 1950s, the now defunct Western Electric Company was looking for a better way to detect problems with telephone and eletrical lines. They came up with a set of rules to help them identify problematic lines. The rules look at the historical mean of a series of datapoints and based on the standard deviation, the rules help judge whether a new set of points is experiencing a mean shift.

# The classic example is monitoring a machine that produces lug nuts. Let's say the machine is supposed to produce 2.5 inch long lug nuts. We measure a series of lug nuts: 2.48, 2.47, 2.51, 2.52, 2.54, 2.42, 2.52, 2.58, 2.51. Is the machine broken? Well it's hard to tell, but the Western Electric Rules can help.

library(qcc)
 
# series of value w/ mean of 10 with a little random noise added in
x <- rep(10, 100) + rnorm(100)
# a test series w/ a mean of 11
new.x <- rep(11, 15) + rnorm(15)
# qcc will flag the new points
qcc(x, newdata=new.x, type="xbar.one")
# view rawqcc_example.RThis Gist brought to you by GitHub.
# While you might not be monitoring telephone lines, qcc can help you monitor transaction volumes, visitors or logins on your website, database operations, and lots of other processes.