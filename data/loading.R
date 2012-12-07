# MANUAL
salary     <- c(1870000, 14626720, 14137500, 13980000, 12916666)
position   <- c("QB", "QB", "DE", "QB", "QB")
team       <- c("Colts", "Patriots", "Panthers", "Bengals", "Giants")
name.last  <- c("Manning", "Brady", "Pepper", "Palmer", "Manning")
name.first <- c("Peyton", "Tom", "Julius", "Carson", "Eli")
top.5      <- data.frame(name.last, name.first, team, position, salary)

# RDATA
# load("~/top.5")
# load("~/top.5.RData")

# FROM TXT FILES
# data <- read.table("data.csv", header=TRUE, sep=',', quote="\"")

# also
# read.csv()
# read.delim()

# READ FROM URL
sp500 <- read.csv(paste("http://ichart.finance.yahoo.com/table.csv?",
                  "s=%5EGSPC&a=03&b=1&c=1999&d=03&e=1&f=2009&g=m&ignore=.csv",
                  sep="")
)

# READ FROM PACKAGES
# system.file("data", "bb.db", package="nutshell")

# READ FROM DB
# Note: setting up a db is fucked read through R In A Nutshell 23% 5830 of 25488 on kindle for instructions

	# PACKAGES
	# RODBC
	# DBI

library(RODBC)
db <- odbcConnect('bbdb')
sqlTables(dbName) # tells you your table's names
sqlColumns(dbName, "colNames")
sqlFetch() # query db
sqlQuery()
sqlGetResults()

# DBI IS MADE UP OF SEPERATE PACKAGES
library(RSQLite)
dbConnect()
drv <- dbDriver("SQLite")
con <- dbConnect(drv, dbname=system.file("data", "bb.db", package="nutshell"))
dbListConnections(drv)
dbGetInfo(con)
dbListTables(con)
dbListTables(con, "Allstar")

# DB INTERFACE SPECIFICALLY FOR TIME SERIES DATA
library(TSDBI)
library(TSMySQL)
# TSSQLite etc etc


# READ CHUNKS - TO CONFIRM DATA IN BIG FILE IS OK
# read.table(blah, nrows=20)  # 1st 20 rows only

# READ 1 LINE AT A TIME
# readlines()

# COMPLEX FILE FORMATS
# scan()

# READ FIXED-WIDTH TEXT FILE
# read.fwf()

# USE RUBY SCRIPT TO PARSE DATA INTO CSV FORMAT