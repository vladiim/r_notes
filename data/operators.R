# VECTOR/LISTS
x[i]
x[[i]]   # returns single elements

# LISTS
x$n
x[c('a', 'b', 'c')]  # index by name

# INDEX ITEMS
x[y:z]   # inclusion of range y:z
x[-y:-z] # exclusion of range y:z

# INDEX BY LOGICAL VECTOR
index <- rep(c(TRUE, FALSE), 10)
v[index, ]

# calculate the logical vector from the vector itself
index <- v$value[value < 30]

