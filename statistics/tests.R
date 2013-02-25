# NORMAL DIST-BASED TESTS	
# a good way to start is to assume the data will be normally distributed

# see if the mean is close to expectation - null hypothesis

# test if mean is different from  null hypothesis mean
# t.test()

library(nutshell)
data(tires.sus)

times.to.failure.h <- subset(tires.sus, Tire_Type=="H" & Speed_At_Failure_km_h==160)$Time_To_Failure

test.times <- function() {
  t.test(times.to.failure.h);
}

# > t.test(subset(tires.sus, Tire_Type=="H" & Speed_At_Failure_km_h==160)$Time_To_Failure)

# 	One Sample t-test

# data:  subset(tires.sus, Tire_Type == "H" & Speed_At_Failure_km_h ==      160)$Time_To_Failure 
# t = 6.5205
# df = 9                     		degrees of freedom
# p-value = 0.0001088
# alternative hypothesis: 
#true mean is not equal to 0 
# 95 percent confidence interval:
#   6.649536 13.714464 
# sample estimates:
# mean of x 
#    10.182 

# TWO GROUPS OF VARS
# is there significant difference between the two?
speed.at180 <- function(type) {
  subset(tires.sus, Tire_Type=type & Speed_At_Failure_km_h==180)$Time_To_Failure;
}

t.to.fail.e <- speed.at180("E")
t.to.fail.d <- speed.at180("D")
t.to.fail.b <- speed.at180("B")

test.d.e <- function() {
  t.test(t.to.fail.d, t.to.fail.e);
}

# Test difference in outdoor/indoor field goals

load.f.goals <- function() {
  library(nutshell);
  data(field.goals);
}

find.by.type <- function(type) {
  transform(field.goals[field.goals$play.type==type, c('yards', 'stadium.type')], outside=(stadium.type=='Out'))
}

good <- function() {
  load.f.goals();
  find.by.type('FG good');
}

bad <- function() {
  load.f.goals();
  find.by.type('FG no');
}

test.good.and.bad <- function() {
  t.test(yards~outside,data=good())
}
#   Welch Two Sample t-test

# data:  yards by outside 
# t = 1.1259, df = 319.428, p-value = 0.261
# alternative hypothesis: true difference in means is not equal to 0 
# 95 percent confidence interval:
#  -0.6851121  2.5185711 
# sample estimates:
# mean in group FALSE  mean in group TRUE 
#            35.31707            34.40034 

load.inout <- function() {
  load.f.goals();
  inout <- transform(field.goals, outside=(stadium.type=='Out'));
}

test.in.out <- function() {
  inout <- load.inout()
  t.test(yards~outside, data=inout);
}
#   Welch Two Sample t-test

# data:  yards by outside 
# t = 1.5473, df = 401.509, p-value = 0.1226
# alternative hypothesis: true difference in means is not equal to 0 
# 95 percent confidence interval:
#  -0.3152552  2.6461541 
# sample estimates:
# mean in group FALSE  mean in group TRUE 
#            37.14625            35.98080 

# COMPAIRING PAIED DATA
# e.g. before and after

# t.test(paried=TRUE)

load.spec <- function() {
  library(nutshell);
  data(SPECint2006);
  SPECint2006;
}

test.spec <- function() {
  load.spec();
  spec <- SPECint2006;
  t.test(subset(spec, Num.Chips==1&Num.Cores==2)$Baseline,
         subset(spec, Num.Chips==1&Num.Cores==2)$Result,
         paired=TRUE);
}

# COMPARE VARIANCE OF 2 POPULATIONS

# var.test

var.test.field.goals <- function() {
  inout <- load.inout();
  var.test(yards~outside, data=inout);
}

# TEST VARIANCE BETWEEN 2 SAMPLES

# bartlett.test

b.test.f.goals <- function() {
  inout <- load.inout();
  bartlett.test(yards~outside, data=inout);
}

# COMPARE THE MEAN ACROSS MORE THAN 2 GROUPS
# analysis of vaiance ANOVA

# aov()

load.mort06 <- function() {
  data(mort06.smpl);
  mort06.smpl;
}

summary.of.age.by.cause <- function() {
  mort <- load.mort06();
   tapply(mort$age, INDEX=list(mort$Cause), FUN=summary);
}

aov.mort06 <- function() {
  mort <- load.mort06();
  aov(age~Cause, data=mort);
}

# use model.tables() to get more data from aov

model.mort <- function() {
  model.tables(aov.mort06());
}

# MORE AOV

load.births <- function() {
  data(births2006.smpl);
  births2006.smpl;
}

under.99kg <- function() {
  data <- load.births();
  data[data$WTGAIN<99 & !is.na(data$WTGAIN),];
}

mean.wt.gain <- function() {
  data <- under.99kg();
  tapply(X=data$WTGAIN, INDEX=data$DOB_MM, FUN=mean);
}

# mean.wt.gain() shows weight gain is higher in winter, but is it statistically significant?
wt.gain.sig <- function() {
  aov(WTGAIN~DOB_MM, data=under.99kg());
}

# a better approach to the above
lm.wt.gain.sig <- function() {
  lin_model <- lm(WTGAIN~DOB_MM, data=under.99kg());
  anova(lin_model);
}

# GET DETAILS OF DIFFERENCES BETWEEN GROUPS
# pairwise.t.test()

load.tires <- function() {
  data(tires.sus);
  tires.sus;
}

difference.tires <- function() {
  tires <- load.tires();
  pairwise.t.test(tires$Time_To_Failure, tires$Tire_Type);
}

# IS DISTRIBUTION NORMALLY DISTRIBUTED
# shapiro.test()

load.goals <- function() {
  data(field.goals)
  field.goals;
}

plot.goal.dist <- function() {
  goals <- load.goals();
  yards <- goals[!is.na(goals$yards),]
  par(mfcol=c(1,2), ps=6.5);
  hist(yards, breaks=25);
  qqnorm(yards, pch='.');
}

shapiro.goals.yards <- function() {
  goals <- load.goals();
  shapiro.test(goals$YARDS);
}

# TEST IF DATA CAME FROM RANDOM DIST

random.goals <- function() {
  data <- load.goals();
  ks.test(data$yards, pnorm);
}

# TEST IF DATA CAME FROM SAME DISTRIBUTION

same.dist.specint <- function() {
  spec = load.spec();
  ks.test(jitter(subset(SPECint2006, Num.Chips == 1 & Num.Cores == 2)$Baseline),
          jitter(subset(SPECint2006, Num.Chips == 1 && Num.Cores ==2)))
}

# SIGNIFICANT CORRELATION BETWEEN VECTORS
# cor.test(c(1,2,3,4,5,6), c(0,2,4,5,6,7))
# wilcox.test()

cor.e.d.tires <- function() {
  wilcox.test(t.to.fail.e, t.to.fail.d);
}
# > wilcox.test(t.to.fail.e, t.to.fail.d)

#   Wilcoxon rank sum test with continuity correction

# data:  t.to.fail.e and t.to.fail.d 
# W = 2178, p-value = 1
# alternative hypothesis: true location shift is not equal to 0 
# W = test statistic

# also can use 
# kruskal.test()
# fligner.test()

# DIFFERENCE BWEEN GROUPS STAT SIG?
# prop.test()
# is the prob of success the same indoors and outdoors?

load.good.bad.fg <- function() {
  data(field.goals);
  field.goals[field.goals$play.type=='FG good' | field.goals$play.type=='FG no',];
}

succ.fail.by.stadium <- function() {
  goals <- load.good.bad.fg();
  full_table <- table(goals$play.type, goals$stadium.type);
  good_bad_table <- t(full_table[3:4,]);
  prop.test(good_bad_table);
}

# COMPARE 2 TABLES OF DATA 

# fisher
# for small sets the best tool is fisher.test()
# high p-value implies the variables are likely to be independent
# low p-value implies not independent

# chi-squared
# different to fisher in that you need to state a hypothesis then compare sample to hypothesis

load.births <- function() {
  data(births2006.smpl);
  births2006.smpl;
}

july.births <- function() {
  data <- load.births();
  data[data$DMETH_REC!='Unknown' & data$DOB_MM==7, ];
}

twin.births <- function() {
  data <- load.births();
  data[data$DPLURAL=='2 Twin' & data$DMETH_REC != 'Unknown',];
}

method.and.sex.data <- function(data) {
  table(data$SEX, as.factor(as.character(data$DMETH_REC)));
}

fisher.delivery.v.sex <- function(data) {
  method.and.sex <- method.and.sex.data(data);
  fisher.test(method.and.sex);  
}

fisher.delivery.v.sex.july <- function() {
  data <- july.births();
  fisher.delivery.v.sex(data)
} # p-value = v low, therefore variables are not independent

fisher.delivery.v.sex.twins <- function() {
  data <- twin.births();
  fisher.delivery.v.sex(data)
}

chi.delivery.v.sex.twins <- function() {
  data <- twin.births();
  method.and.sex <- method.and.sex.data(data);
  chisq.test(method.and.sex);
}

# HOW MANY BABIES BORN ON W'ENDS VS W'DAYS?

births.by.day <- function() {
  data <- load.births();
  table(data$DOB_WK);
}

births.by.day.and.month <- function() {
  data <- load.births();
  table(data$DOB_WK, data$DOB_MM);
}

chi.births.by.day <- function() {
  chisq.test(births.by.day());
}

chi.births.by.day.and.month <- function() {
  chisq.test(births.by.day.and.month());
}

# 3D TEST
# mantelhaen.test()
# mcnemar.test()

# NON-PARAMETIC TABULAR DATA TEST
# friedman.test