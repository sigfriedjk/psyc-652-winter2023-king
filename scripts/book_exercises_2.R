library(haven)
library(dplyr)
library(ggplot2)
writeLines("\n\nStarting Book Exercises 2")

lesson16df1 <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_16_Data_File_1.sav"
writeLines("Starting Read")
data <- read_sav(lesson16df1)
writeLines("Read Complete")

data

writeLines("Creating Line Graph")
jpeg(filename="/tmp/book_exercises_2/lesson-16A-line.jpg")
plot(data,type = "o", main ="Score by Grade")
dev.off()

writeLines("Creating Line Graph with title, custom scales, and line type")
jpeg(filename="/tmp/book_exercises_2/lesson-16A-line-enhanced.jpg")
plot(data,type = "o", main ="Score by Grade", xlim=c(0,10), ylim=c(0,100), lty=3)
dev.off()


writeLines("Started Lesson 17A Exercise 1 and 2")

# x-axis values
x <- c("1st Grade", "2nd Grade", "3rd Grade", "4th Grade")
# y-axis values
y <- c(4, 5, 1, 8)

jpeg(filename="/tmp/book_exercises_2/lesson-17A-bar-chart.jpg")
barplot(y, names.arg = x)
dev.off()

jpeg(filename="/tmp/book_exercises_2/lesson-17A-barchart-enhanced.jpg")
barplot(y, names.arg = x, xlab = "Grade", 
           ylab="Number of Gifted Children", 
           main= "Gifted Children by Grade ", 
           col=c("red","yellow","green","blue")
        )
dev.off()

writeLines("Starting Lesson 20")
lesson20df1 <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_20_Data_File_1.sav"
data20 <- read_sav(lesson20df1)

data20
summary(data20)

jpeg(filename="/tmp/book_exercises_2/lesson20-bar-jobs.jpg")
hist(data20, names.arg = data20$job, xlab = "Job", 
           ylab="Frequency", 
           main= "Job Frequency", 
           col="red"
           )
dev.off()

writeLines("Starting Lesson 21")
lesson21df1 <- "data_sets/Green_Salkind_SPSS_Data_Sets/Lesson_21_Data_File_1.sav"
data21 <- read_sav(lesson21df1)