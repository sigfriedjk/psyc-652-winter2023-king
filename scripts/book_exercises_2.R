library(haven)
library(dplyr)
library(ggplot2)
writeLines("\n\nStarting Book Exercises 2")

lesson19e1 <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_16_Data_File_1.sav"
writeLines("Starting Read")
data <- read_sav(lesson19e1)
writeLines("Read Complete")

data

writeLines("Creating Line Graph")
jpeg(filename="/tmp/book_exercises_2/lesson-16A-line.jpg")
plot(data,type = "o", main ="Score by Grade")
dev.off()

