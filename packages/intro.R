# all packages
# getOption("defaultPackages")

# loaded packages
# (.packages())

# remove.packages('tree', .Library)

# installed.packages
# update.packages

# BUILD A CUSTOM PACKAGE

# package.skeleton(name = 'anRpackage',
#	             list,
# 	             environment = .GlobalEnv,
# 	             path = '.',
# 	             force = FALSE,
# 	             namespace = FALSE,
# 	             code_files = character())

# after you've generated the package check into it
# R CMD check package_name

# build the package
# R CMD build package_name

# v good packages
# sqldf (for selecting from data frames using SQL)
# forecast (for easy forecasting of time series)
# plyr (data aggregation)
# stringr (string manipulation)
# Database connection packages RPostgreSQL, RMYSQL, RMongo, RODBC, RSQLite
# lubridate (time and date manipulation)
# ggplot2 (data visulization)
# qcc (statistical quality control and QC charts)
# reshape2 (data restructuring)
# randomForest (random forest predictive models)