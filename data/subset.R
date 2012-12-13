# BRACKET NOTATION
# subset.result <- original[original$column == value, ]
# subset.result.shorter <- original[original$column == value, c('rowName', 'rowName2')]

# SUBSET FUN
# subset()
# subset.result <- subset(original, column == value)
# subset.result.shorter <- subset(original, column == value,
	                              # c('rowName', 'rowName2'))


# RANDOM SAMPLE
# sample()
# doesn't work well w/ data.frames() need to use it to create index
# original[sample(1:nrow(original), 5), ]

# RANDOM SAMPLE 3 COLUMNS
# sample(levels(original$column), 3)

