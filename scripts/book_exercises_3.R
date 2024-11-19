

library(haven)
library(dplyr)
library(ggplot2)
library(tidyr)


computeCohenD <- function(data, t_test_result){
  return (unname(t_test_result)[[1]] / sqrt(nrow(data)))
}

writeLines("\n\n\n\n******Starting Book Exercises 3")

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

#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
writeLines("\n\n\n\n******Starting Section 22.4")
lesson22_data

summary(lesson22_data)

writeLines("\n\nRunning one sample t-test with test value 50")
t.test(lesson22_data, mu = 50)
write_sav(lesson22_data, "/tmp/book_exercises_3/king-lesson22d1.sav")

writeLines("\n\n\n\n******Lesson 22 Exercises 1-4")
lesson22_exercise1_data


lesson22_exercise1_data <- lesson22_exercise1_data %>%
   mutate(total_score = ITEM1+ITEM2+ITEM3+ITEM4+ITEM5+ITEM6+ITEM7+ITEM8)
   
lesson22_exercise1_data
t.test(lesson22_exercise1_data$total_score, mu = 2)
write_sav(lesson22_exercise1_data, "/tmp/book_exercises_3/king-lesson22e1.sav")

writeLines("\n\n\n\n******Lesson 22 Exercises 5-6")
lesson22_exercise2_data

t.test(lesson22_exercise2_data, mu = 5)

write_sav(lesson22_exercise2_data, "/tmp/book_exercises_3/king-lesson22e2.sav")
jpeg(filename="/tmp/book_exercises_3/lesson22exercise6.jpg",width=480,height=480)

hist(lesson22_exercise2_data$HAP_SAD,
 main="Happiness/Sadness Level",
 xlab="Happiness Scores",
 xlim=c(0,20),
 col="darkmagenta",
 breaks=20
)

dev.off()

writeLines("\n\n\n\n******Ending Lesson 22")
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------

writeLines("\n\n\n\n******Starting Section 23.1")
lesson23_data

summary(lesson23_data)

t.test(lesson23_data$PAY, lesson23_data$SECURITY, paired = TRUE)

writeLines("Saving SPSS File")
write_sav(lesson23_data, "/tmp/book_exercises_3/king-lesson23d1.sav")


writeLines("\n\n\n\n******Lesson 23 Exercises 1-5")
lesson23_exercise1_data

lesson23_exercise1_data <- lesson23_exercise1_data %>%
    mutate(ILS_40 = INTER_40 + OCCUP_40, ILS_60 = INTER_60 + OCCUP_60)
    
lesson23_exercise1_data

t.test(lesson23_exercise1_data$ILS_40, lesson23_exercise1_data$ILS_60, paired=TRUE)

lesson23_exercise1_data <- lesson23_exercise1_data %>%
    mutate(difference = ILS_40 - ILS_60)

lesson23_exercise1_data

jpeg(filename="/tmp/book_exercises_3/lesson23exercise3.jpg",width=480,height=480)

hist(lesson23_exercise1_data$difference,
 main="ILS",
 xlab="ILS Difference between Age 40 and 60",
 xlim=c(-40,40),
 col="darkmagenta",
 breaks=20
)

dev.off()


lesson23_exercise1_data <- lesson23_exercise1_data %>%
    mutate(difference_inter = INTER_40 - INTER_60, difference_occup= OCCUP_40- OCCUP_60)

lesson23_exercise1_data

t.test(lesson23_exercise1_data$INTER_40, lesson23_exercise1_data$INTER_60, paired=TRUE)

t.test(lesson23_exercise1_data$OCCUP_40, lesson23_exercise1_data$OCCUP_60, paired=TRUE)

jpeg(filename="/tmp/book_exercises_3/lesson23exercise5-1.jpg",width=480,height=480)

hist(lesson23_exercise1_data$difference_inter,
 main="Interpersonal Stress",
 xlab="Difference between Age 40 and 60",
 xlim=c(-40,40),
 col="darkmagenta",
 breaks=20
)

dev.off()

jpeg(filename="/tmp/book_exercises_3/lesson23exercise5-2.jpg",width=480,height=480)

hist(lesson23_exercise1_data$difference_occup,
 main="Occupational Stress",
 xlab="Difference between Age 40 and 60",
 xlim=c(-40,40),
 col="darkmagenta",
 breaks=20
)

dev.off()

write_sav(lesson23_exercise1_data, "/tmp/book_exercises_3/king-lesson23e1.sav")

summary(lesson23_exercise1_data)

writeLines("\n\n\n\n*******************************************************")
writeLines("\n\n\n\n******Lesson 23 Exercises 6-8")
lesson23_exercise2_data

summary(lesson23_exercise2_data)

t.test(lesson23_exercise2_data$HUSBAND, lesson23_exercise2_data$WIFE, paired=TRUE)

lesson23_longer <- lesson23_exercise2_data %>%
    pivot_longer(
        cols = c("HUSBAND", "WIFE"),
        names_to = "role"
    )
lesson23_longer

jpeg(filename="/tmp/book_exercises_3/lesson23exercise8.jpg",width=480,height=480)

ggplot(lesson23_longer) +
  aes(x = role, y = value) +
  geom_boxplot()
  
  
dev.off()

write_sav(lesson23_exercise2_data, "/tmp/book_exercises_3/king-lesson23e2.sav")

summary(lesson23_exercise2_data)

writeLines("\n\n\n\n******Ending Lesson 23")
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------


writeLines("\n\n\n\n******Lesson 24")
lesson24_data
summary(lesson24_data)

t.test(lesson24_data$TALK, lesson24_data$STRESS, data = lesson24_data, var.equal=TRUE)

t.test(lesson24_data$TALK, lesson24_data$STRESS, data = lesson24_data, var.equal=FALSE)

writeLines("\n\n\n\n******Lesson 24 Exercises 1-5")

lesson24_exercise1_data
summary(lesson24_exercise1_data)
table(lesson24_exercise1_data)
glimpse(lesson24_exercise1_data)


lesson24_exercise1_data <- lesson24_exercise1_data %>%
    mutate(weight_name= ifelse(WEIGHT == 1,"Overweight","Normal"))


t.test(lesson24_exercise1_data$TIME,lesson24_exercise1_data$WEIGHT, data = lesson24_exercise1_data, var.equal=TRUE)
t.test(lesson24_exercise1_data$TIME,lesson24_exercise1_data$WEIGHT, data = lesson24_exercise1_data, var.equal=FALSE)

overweight_only <- lesson24_exercise1_data %>% filter(WEIGHT == 1)
length(overweight_only$TIME)
normalweight_only <- lesson24_exercise1_data %>% filter(WEIGHT == 2)
length(normalweight_only$TIME)

mean(overweight_only$TIME)
sd(normalweight_only$TIME)

jpeg(filename="/tmp/book_exercises_3/lesson24exercise5.jpg",width=480,height=480)

ggplot(lesson24_exercise1_data) +
  aes(x = weight_name, y = TIME) +
  geom_boxplot(outlier.colour="black", outlier.shape=16,
             outlier.size=2, notch=FALSE)
 
  
dev.off()
write_sav(lesson24_exercise1_data, "/tmp/book_exercises_3/king-lesson24e1.sav")
writeLines("\n\n\n\n******Lesson 24 Exercises 6-10")
lesson24_exercise2_data
summary(lesson24_exercise2_data)

writeLines("Adding a new variable for the difference in test scores")
lesson24_exercise2_data <- lesson24_exercise2_data %>%
    mutate(difference = POSTTEST-PRETEST, inclusion = ifelse(INTEGRAT==1,1,2))
    
lesson24_exercise2_data

t.test(lesson24_exercise2_data$difference ~ lesson24_exercise2_data$inclusion, var.equal=FALSE)
t.test(lesson24_exercise2_data$difference ~ lesson24_exercise2_data$inclusion, var.equal=TRUE)



write_sav(lesson24_exercise2_data, "/tmp/book_exercises_3/king-lesson24e2.sav")
writeLines("\n\n\n\n******End Lesson 24")