library(nutshell)
library(lattice)

data(field.goals)

# COLUMN NAMES
fg.names <- function() { names(field.goals) }

# HISTOGRAM
yards.hist <- function() {
  hist(field.goals$yards, 
  	   breaks = 35,
  	   main = paste("Field Goals Yo!"),
  	   xlab = "X label",
  	   ylab = "Y label")
}

# SHOW TABLE OF SPECIFIC DATA
# Note play.type is a factor
play.type.table <- function() {
  table(field.goals$play.type)
}

# STRIPCHART
fg.attempt <- function() {
  stripchart(field.goals[field.goals$play.type == 'FG blocked', ]$yards,
  	         pch = 19,
  	         method = 'jitter')
}

# PLOT RELATIONSHIP
# In the case below vehicle speed & stopping dist (the only obs in the cars data)
speed.vs.stop <- function() {
  plot(cars, xlab = "Speed (mph)",
  	         ylab = "Stopping dist (ft)",
  	         las = 1,
  	         xlim = c(0, 25))
}

# VAR1 BY VAR2 SPLIT BY FACTOR1
amount.by.year <- function() {
  dotplot( Amount ~ Year | Food, data = consumption,
           aspect = 'xy',
           scales = list(relation = 'sliced'),
           cex = .4 )
}

# PLOT
library(nutshell)
data(toxins.and.cancer)
plot.t.1 <- function() {
  with(toxins.and.cancer, plot(total_toxic_chemicals/Surface_Area, deaths_total/Population));
}

plot.t.2 <- function() {
  with(toxins.and.cancer, plot(air_on_site/Surface_Area, deaths_lung/Population));
}

# To get the coordinates of a particular event
# do func below then click on graph
get.coordinates <- function() {
  locator(1)
}

# IDENTIFY POINTS
# One below you have to click on points to id them
# with(toxins.and.cancer, identify(air_on_site/Surface_Area, deaths_lung/Population, State_Abbrev))

# NAME POINTS
# with(toxins.and.cancer, text(air_on_site/Surface_Area, deaths_lung/Population,
#      labels=State_Abbrev,
#      cex=0.5,
#      adj=c(0,-1)))

# OTHER PLOTINGS FUNCTIONS
# plot()            if you want to plot two columns of data
# matplot() & par() plot multiple sets of columns
# smoothScatter()   if you're plotting big datasets
# pairs(batting.2008[batting.2008$AB>100,c("H", "R,"SO","BB","HR")])

# TIME SERIES
turkey <- function() {
  library(nutshell);
  data(turkey.price.ts);
  plot(turkey.price.ts);
}

# correlogram() shows autocorrection for correlated points by difference in time

turkey.cor <- function() {
  library(nutshell);
  data(turkey.price.ts);
  acf(turkey.price.ts);
}

# BAR CHART
docs <- function() {
  library(nutshell);
  data(doctorates);
  barplot(as.matrix(doctorates[2:7])[1,])
}

docs.all.years <- function() {
  library(nutshell);
  data(doctorates);
  barplot(as.matrix(doctorates[2:7]), beside=TRUE, horiz=TRUE, legend=TRUE, cex.names=0.75)
}

docs.stacked <- function() {
  library(nutshell);
  data(doctorates);
  doc.m <- as.matrix(doctorates[2:7]);
  barplot(t(doc.m), legend=TRUE, ylim=c(0,66000));
}

# PIE CHARTS
# pie()

fish.2006 <- function() {
  catch <- c(7752, 1166, 463, 108);
  names(catch) <- c("Fresh & Frozen", "Reduced to meal", "Canned", "Cured");
  pie(catch, init.angle=100, cex=.6);
}

# CONDITIONAL DENSITY
# cdplot()
bat.cd <- function() {
  library(nutshell);
  data(batting.w.names.2008);
  bat <- transform(batting.w.names.2008,
                   bats=as.factor(bats),
                   throws=as.factor(throws));
  cdplot(bats~AVG, data=bat, subset=(bat$AB>100));
}

# PROPORTION OF OBSERVATIONS FOR CATEGORIES
# mosaicplot()
# spineplot()
# assocplot()
bat.mosaic <- function() {
  library(nutshell);
  data(batting.w.names.2008);
  bat <- transform(batting.w.names.2008,
                   bats=as.factor(bats),
                   throws=as.factor(throws));
  mosaicplot(formula=bats~throws, data=bat, color=TRUE);
}

# 3 DIMENTIONAL DATA

# persp()
yosim.3d <- function() {
  library(nutshell);
  data(yosemite);
  flipped <- yosemite[,seq(from=253, to=1)];
  right   <- yosemite[nrow(yosemite) - ncol(yosemite) + 1,]
  halfdome <- yosemite[(nrow(yosemite) - ncol(yosemite) + 1):562,
                        seq(from=253, to=1)]
  persp(halfdome, col=grey(.25), border=NA, expand=.15,theta=225,phi=20,ltheta=45,lphi=20,shade=.75)
}


# image()
yosim.3d.image <- function() {
  image(yosemite, asp=253/562, ylim=c(1,0), col=sapply((0:32)/32,gray))
}

# multi-dimention - heatmap()
# esp for biology

# also contour()
yosim.3d.contour <- function() {
  contour(yosemite, asp=253/562, ylim=c(1,0))
}