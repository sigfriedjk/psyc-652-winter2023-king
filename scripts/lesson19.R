library(haven)
library(dplyr)
print("Starting....")
name <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_19_Exercise_File_1.sav"
print("Starting Read")
data <- read_sav(name)
print("Read Complete")
data
subset <- select(data, ITEM1, ITEM2, ITEM3)
subset
print("Ending")
