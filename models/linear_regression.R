# EST REL BETWEEN DIST & SPEED

dist.speed <- function() {
  lm(dist ~ speed, data = cars)
}

dist.speed.summary <- function() {
  summary(dist.speed())
}