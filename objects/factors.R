# Categorised vector

# vector
eye.color <- c('brown', 'blue', 'blue', 'green', 'brown')

# factor
eye.color <- factor( c('brown', 'blue', 'blue', 'green', 'brown') )

# LEVELS
levels(eye.color) # Levels: blue brown green

# ORDERED FACTOR LEVELS
survey.results <- factor( c("bad", "bad", "good", "med", "bad"),
	                      levels=c("good", "med", "bad"), ordered=TRUE)
levels(survey.results) # Levels: good < med < bad

# TURN FACTOR INTO INTEGER ARRAY
eye.color <- factor( c('brown', 'blue', 'blue', 'green', 'brown') )
eye.color.int.vector <- uncless( eye.color )
attr(, 'levels') # [1] 'blue' 'brown' 'green'
class(eye.color.int.vector) # 'integer'