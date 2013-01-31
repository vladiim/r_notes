x						# object to plot

data					# when x is a formula

allow.multiple			# ~ X | Z (where X is a function of multiple variables and Z may also be a function of mult variables)

outer					# specifies whether to superimpose pots or not when allow.multiple=T

box.ratio				# when plotting data in rectangles (bwplt, barchart, stripplot), plots inner as ratio

horizontal				# for plots that can be laid horizontally or vertically

panel					# used to draw plots

aspect					# aspect ration to use for diff panels default ='xy' to compute, can have ='fill', or ='iso' for isometric scales

groups					# specifies 1 or more variables (groups of data) to pass into panel

auto.key				# draw a key showing the names of groups corresponding to colors or symboles

prepanel				# func that takes same args as panel and returns list containing values xlim, ylim, dx and dy

strip 					# logical - draw strips?

xlab

ylab

scales					# how x & y axis should be drawn

subscripts 				# logical - should subscripts be passed to panel func?

subset 					# specifies subset of data= to pass in

xlim 					# min & max values for x

ylim					# as above for y

drop.unused.levels      # logical - drop unused levels of factors

default.scales 			# value

lattice.options 		# args passed to internal trellis.skeleton


# --------------------------------------------------------- #
# ----------- args to pass into lattice.options ----------- #
# --------------------------------------------------------- #

as.table				# order in which panels are drawn, =FALSE (left to right, bottom to top) =TRUE(left to right, top to bottom)

between					# list w/ x & y specifying space between panels

key						# list of args that define a legend of plot components

legend 					# list specifying set of grid objects to be used as legends

page					# single arg func to be called after drawing each page (page #)

main					# char value for main title of plot

sub 					# char value for sub-title of plot

par.strip.text 			# list of parameters that control strip text (col, cex, lines, abbreviate, minlength, dot)

layout 					# numeric specifying the number of rows, cols, pages c(1, 5) means 1 col, 5 rows

skip					# logical specifying which panels to skip printing

strip.left				# func to draw strips on LHS of ea panel

[x|y]scale.components	# func to determine components

axis					# func draws axsis notation

perm.cond 				# numeric vector specifying permutation of conditioning variables

index.cond 				# list of a func that can subset or reorder array of conditioning vars

# --------------------------------------------------------- #
# ----------- controlling how axes are drawn -------------- #
# --------------------------------------------------------- #

relation 				# how limits are calculated for each panel ='same' ='free' ='sliced'

tick.number 