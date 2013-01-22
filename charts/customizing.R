# add plot to existing or clear? add=T/F
# axis - will axis be plotted?
# xlab/ylab/main/sub
# log - axis to be log

# GRAPHICS PARAMETERS
# par is useful for defaults, functions can be set/called to set default parameters
my_params <- function() {
  par(blah blah balh)
}

# to get default par of all values call par(), to get specific value 
# e.g. background call par('bg'), to set the value par(bg='white')

# ANNOTATION
# ann=false, title/axis labels aren't printed

# MARGINS
# margin size is          mai=
# margin lines of text is mex=

# PLOT MULTIPLE CHARTS
# par(mfcol=c(3,2)) # will plot a 3 by 2 series of plots

# TEXT SIZE
# ps = point size of text, cex = scaling factor
# e.g. cex.main=.7
# font specified through       family=
# font style specified through font=

# TEXT ALIGNMENT
# alignment is             adj=
# spacing between lines is lheight=
# rotatate character is    crt=
# rotate strings is        srt=

# LINES
# line end        lend=
# line join style ljoin= and lmiter=
# line type       lty=
# width           lwd=

# BOXES AROUND PLOTS
# bty=

# COLORS
# background     bg=
# foreground     fg=
# plotting color col=
# axis           col.axis=
# title          col.main=

# AXIS
# annotatation with      lab=
# style with             las=
# size of tick marks     tcl= || tck=
# min/max mark locations xaxp= && yaxp=
# interval calc          xaxs= && yaxs=
# remove axis            xaxt='n' && yaxt='n'

# POINTS
# change symbol used  pch=
# list of point types points()
