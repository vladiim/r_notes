install.pacakges("stringr")
# I find base R's string functionality to be extremely difficult and cumbersome to use. Another package written by Hadley Whickham, stringr, provides some much needed string operators in R. Many of the functions use data strcutures that aren't commonly used when doing basic analysis.


# stringr is remarkably easy to use. Nearly all of the functions (and all of the important ones) are prefixed with "str" so they're very easy to remember.

library(stringr)
 
names(iris)
#[1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
names(iris) <- str_replace_all(names(iris), "[.]", "_")
names(iris)
#[1] "Sepal_Length" "Sepal_Width"  "Petal_Length" "Petal_Width"  "Species"
 
s <- c("Go to Heaven for the climate, Hell for the company.")
str_extract_all(s, "[H][a-z]+ ")
#[[1]]
#[1] "Heaven " "Hell "  