# ...
# Takes any arguments/functions

f <- function( x, ... ) {
  print(x);
  summary(...);
}

f("summary for object", object, digits=2)

# PROPERTIES
args()
formals()
body()
