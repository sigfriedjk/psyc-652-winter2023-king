library(haven)
library(dplyr)
print("Starting....")
name <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_19_Data_File_1.sav"
print("Starting Read")
data <- read_sav(name)
data
subset <- select(data, skip, diet )
subset
print("Read Complete")
#write_sav(mtcars, name)
print("Ending")
