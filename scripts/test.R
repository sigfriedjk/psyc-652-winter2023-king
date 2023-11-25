# Test File
# For experimenting with new functions

library(haven)
library(dplyr)
print("Starting....")
name <- "data_sets/<filename>.sav"
print("Starting Read")
data <- read_sav(name)
data
subset <- select(data, skip, diet )
subset
print("Read Complete")
write_sav(data, name)
print("Ending")
