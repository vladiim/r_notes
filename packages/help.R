get.help <- function(package) {
  library(help = package)
}

get.vignette <- function(package) {
  vignette(package)
  # needs to be string e.g. vignette('fortunes')
}