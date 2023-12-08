library(haven)
library(dplyr)
writeLines("*********Starting Lesson 19")
writeLines("\n\n\nStarting Exercises 1 and 2")

lesson19e1 <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_19_Exercise_File_1.sav"
writeLines("Starting Read")
data <- read_sav(lesson19e1)
writeLines("Read Complete")

writeLines("Original Data")
data

max_value = 5

#define columns to reverse code
columns_to_reverse= c("ITEM1")

#reverse code the ITEM1 columns
data[ , columns_to_reverse] = (max_value  +1) - data[ , columns_to_reverse]

writeLines("Data with reversed ITEM1")
data
new_data <- data %>% mutate(
 mathatt = ifelse((!is.na(ITEM1)) & (!is.na(ITEM2)) & !is.na(ITEM3),ITEM1+ITEM2+ITEM3,NA)
 )

writeLines("Data new scale: mathatt")
new_data

write_sav(new_data, "/tmp/lesson19-1-king.sav")

writeLines("\n\n\nStarting Exercises 3,4, and 5")
lesson19e2 <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_19_Exercise_File_2.sav"
writeLines("Starting Read")
data2 <- read_sav(lesson19e2)
writeLines("Read Complete")

writeLines("Original Data")
data2

writeLines("Creating Age group variable")
age_group_vector <- c("20-29", "30-39", "40 and beyond")
age_group_factor <- factor(age_group_vector)

data2$age_group <- as.factor(ifelse(data2$AGE < 30, '20-29', 
                             ifelse(data2$AGE < 40, '30-39',
                             "40 and beyond"
                             )))

data2

writeLines("Creating Job Stress Variable")
job_stress_vector <- c("1", "2")
job_stress_factor <- factor(job_stress_vector)

data2$job_stress_group <- as.factor(ifelse(data2$JOBSTRES > 21, 'low', 'high')) 

data2
write_sav(data2, "/tmp/lesson19-2-king.sav")

writeLines("\n\n\nStarting Exercises 6,7, and 8")
lesson19e3 <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_19_Exercise_File_3.sav"
writeLines("Starting Read")
data3 <- read_sav(lesson19e3)
writeLines("Read Complete")

writeLines("Original Data")
data3

writeLines("Computing z scores")
data3_vector <- sapply(data3, function(data) (data-mean(data))/sd(data))
new_data3 <- as.data.frame(data3_vector)

writeLines("Z scores")
new_data3


writeLines("Reversing Rating Variable")
#define columns to reverse code
columns_to_reverse3= c("RATING")

#reverse code the ITEM1 columns
new_data3[ , columns_to_reverse3] = -1 * new_data3[ , columns_to_reverse3]
new_data3

writeLines("Creating new variable for overall negative peer interaction")
new_data3 <- new_data3 %>% mutate(
 NEG_PEER = (RATING +BEHAVE+ PEER_REP) /3
)

new_data3
write_sav(new_data3, "/tmp/lesson19-3-king.sav")

writeLines("Ending")
