library('lattice')
library('nutshell')

# SCATTER PLOT

scatter.size.price <- function() {
  xyplot(price~squarefeet, data=sanfrancisco.home.sales);
}

# subset (remove neighberhoods)

scatter.size.price.subset <- function() {
  trellis.par.set(fontsize=list(text=7));
  xyplot(price~squarefeet|zip, data=sanfrancisco.home.sales,
    subset=(zip!=94100 & zip!=94104 & zip !=94108 &
            zip!=94111 & zip!=94133 & zip!=94158 &
            price<4000000 &
            ifelse(is.na(squarefeet), FALSE, squarefeet<6000)),
    strip=strip.custom(strip.levels=TRUE));
}

scatter.size.price.subset.readable <- function() {
  trellis.par.set(fontsize=list(text=7));
  dollars.per.squarefoot <- mean(sanfrancisco.home.sales$price / sanfrancisco.home.sales$squarefeet,
                                 na.rm=TRUE);
  xyplot(price~squarefeet|zip, data=sanfrancisco.home.sales,
    pch=19, cex=.2,
    subset=(zip!=94100 & zip!=94104 & zip !=94108 &
            zip!=94111 & zip!=94133 & zip!=94158 &
            price<4000000 &
            ifelse(is.na(squarefeet), FALSE, squarefeet<6000)),
    strip=strip.custom(strip.levels=TRUE,
    horizontal=TRUE, par.strip.text=list(cex=.8)),
    panel=function(...) {
      panel.abline(a=0, b=dollars.per.squarefoot);
      panel.xyplot(...);
    }
  );
}
