# IF ELSE
a.o <- function(apples, oranges) {
  if ( apples > oranges ) "apples" else "oranges"
}

# MORE IF
# if (is(x, 'numeric')) x/2 else print('x isnt numeric')
# ifelse(c( TRUE, FALSE ), a, b)

# LOOPS
i.loop <- function(i) {
  repeat { if ( i > 25 ) break else { print(i); i <- i + 5 } }
}

h.loop <- function(i) {
  while ( i <= 30 ) { print(i); i <- i + 3 }
}

j.loop <- function(j, k) {
  for ( i in seq( from = j, to = k, by = 2.5 )) print(i)
}