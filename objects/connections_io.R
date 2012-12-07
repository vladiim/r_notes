# FILES, URLS, ZIP, GZIP, UNIX PIPES, SOCKETS, FIFO (first in, first out)

# LOAD DATA FILE
c.c <- gzfile( description="consumption.RData", open="r" )
load(c.c)
close(c.c)

# file(description = "", open = "", blocking = TRUE,
#      encoding = getOption("encoding"), raw = FALSE)

# url(description, open = "", blocking = TRUE,
#     encoding = getOption("encoding"))

# gzfile(description, open = "", encoding = getOption("encoding"),
#        compression = 6)

# bzfile(description, open = "", encoding = getOption("encoding"),
#        compression = 9)

# xzfile(description, open = "", encoding = getOption("encoding"),
#        compression = 6)

# unz(description, filename, open = "",
#     encoding = getOption("encoding"))

# pipe(description, open = "", encoding = getOption("encoding"))

# fifo(description, open = "", blocking = FALSE,
#      encoding = getOption("encoding"))

# socketConnection(host = "localhost", port, server = FALSE,
#                  blocking = FALSE, open = "a+",
#                  encoding = getOption("encoding"),
#                  timeout = getOption("timeout"))