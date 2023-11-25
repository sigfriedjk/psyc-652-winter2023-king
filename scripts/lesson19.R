library(haven)
library(dplyr)
print("Starting Lesson 19")
print("Starting Excercises 1 and 2")

lesson19e1 <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_19_Exercise_File_1.sav"
print("Starting Read")
data <- read_sav(lesson19e1)
print("Read Complete")

print("Original Data")
data

max_value = 5

#define columns to reverse code
columns_to_reverse= c("ITEM1")

#reverse code the ITEM1 columns
data[ , columns_to_reverse] = (max_value  +1) - data[ , columns_to_reverse]

print("Data with reversed ITEM1")
data

#with_new_scale <- cbind(data, mathatt = c(1000, 6000, 2000))
new_data <- data %>% mutate(
 mathatt = ifelse((!is.na(ITEM1)) & (!is.na(ITEM2)) & !is.na(ITEM3),ITEM1+ITEM2+ITEM3,NA)
 )

print("Data new scale: mathatt")
new_data


print("Starting Excercises 3,4, and 5")
lesson19e2 <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_19_Exercise_File_2.sav"
print("Starting Read")
data2 <- read_sav(lesson19e2)
print("Read Complete")

data2
age_group <- c("20-29", "30-39", "40 and beyond")
factor_age_group <- factor(age_group)

job_stress <- c(1,2)
factor_job_stress <- factor(job_stress)

print("Ending")
