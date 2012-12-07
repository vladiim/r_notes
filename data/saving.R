# SAVE
save(top.5, file="~/top.5.RData")

# EXPORTING
# write.table()
# write.csv()
# write.csv2

# DATABASES
library(RODBC)
sqlSave() # save to db
sqlUpdate() # update
odbcClose(dbName) # close channel