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