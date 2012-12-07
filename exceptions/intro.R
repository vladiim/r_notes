# CREATE EXCEPTION
if ( object == bad ) {
  stop("Error message: ", object);
}

# DON'T STOP THE PROCESS
if ( object == bad ) {
  warining("This is a naughty object: ", object);
}

# TELL THE USER SOMETHING
if ( object == "cloud" ) {
  message("This is a cloudy object");
}

# CATCH ERROR

# try()
res <- try( { x <- 1 }, silent=TRUE ) # silent - should error message be printed?

# tryCatch()
# better - see docs