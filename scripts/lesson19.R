library(haven)
library(dplyr)
print("Starting....")
name <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_19_Exercise_File_1.sav"
print("Starting Read")
data <- read_sav(name)
print("Read Complete")
data
#subset <- select(data, ITEM1, ITEM2, ITEM3)
#subset
#df <- data.frame()
summary(data)

max_value = 5

#define columns to reverse code
columns_to_reverse= data(ITEM1)

#reverse code the ITEM1 columns
data[ , columns_to_reverse] = (max_value  +1) - data[ , columns_to_reverse]

data

#with_new_scale <- cbind(data, mathatt = c(1000, 6000, 2000))
new_data <- data %>% mutate(mathatt = ifelse(!is.na(ITEM1),1,NA))
new_data
print("Ending")
