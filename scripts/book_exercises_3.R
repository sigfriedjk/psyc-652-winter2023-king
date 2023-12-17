library(haven)
library(dplyr)
writeLines("\n\nStarting Book Exercises 3")

directory <- "data_sets/Green_Salkind_SPSS_Data_Sets/"

lesson22_datafilename <- paste(directory,"Lesson_22_Data_File_1.sav", sep="")
lesson22_exercisefilename1 <- paste(directory,"Lesson_22_Exercise_File_1.sav", sep="")
lesson22_exercisefilename2 <- paste(directory,"Lesson_22_Exercise_File_2.sav", sep="")

lesson23_datafilename <- paste(directory,"Lesson_23_Data_File_1.sav", sep="")
lesson23_exercisefilename1 <- paste(directory,"Lesson_23_Exercise_File_1.sav", sep="")
lesson23_exercisefilename2 <- paste(directory,"Lesson_23_Exercise_File_2.sav", sep="")

lesson24_datafilename <- paste(directory,"Lesson_24_Data_File_1.sav", sep="")
lesson24_exercisefilename1 <- paste(directory,"Lesson_24_Exercise_File_1.sav", sep="")
lesson24_exercisefilename2 <- paste(directory,"Lesson_24_Exercise_File_2.sav", sep="")

writeLines("Starting Read: Lesson 22-24 Data Files")
lesson22_data <- read_sav(lesson22_datafilename)
lesson22_exercise1_data <- read_sav(lesson22_exercisefilename1)
lesson22_exercise2_data <- read_sav(lesson22_exercisefilename2)

lesson23_data <- read_sav(lesson23_datafilename)
lesson23_exercise1_data <- read_sav(lesson23_exercisefilename1)
lesson23_exercise2_data <- read_sav(lesson23_exercisefilename2)

lesson24_data <- read_sav(lesson24_datafilename)
lesson24_exercise1_data <- read_sav(lesson24_exercisefilename1)
lesson24_exercise2_data <- read_sav(lesson24_exercisefilename2)

writeLines("Read Complete")



lesson22_data
