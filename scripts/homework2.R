library(haven)
library(dplyr)
library(ggplot2)
library(tidyr)
library(car)
#library(effsize)


computeCohenD <- function(data, t_test_result){
  return (unname(t_test_result)[[1]] / sqrt(nrow(data)))
}


writeLines("******Starting Homework 2")

data_frame <- data.frame(
   Employee_Type=c(1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),  
   Gender=c(2, 1, 1, 2, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 2, 2, 1, 2, 1, 1, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 2, 1),
   Motivation=c(5, 8, 8, 6, 1, 1, 5, 0, 7, 9, 6, 6, 1, 3, 2, 1, 7, 8, 1, 4, 4, 8, 10, 10, 5, 8, 5, 6, 6, 4, 10, 9),
   Commitment=c(4, 5, 5, 6, 1, 1, 6, 1, 2, 4, 5, 6, 1, 0, 1, 1, 4, 7, 0, 3, 2, 8, 9, 7, 5, 8, 3, 8, 4, 7, 9, 10)
)
data_frame



writeLines("\n\n Generating descriptive statistics")
summary(data_frame %>% select("Motivation", Commitment))
writeLines("\nFrequencies for Employee_Type")
table(data_frame$Employee_Type)
writeLines("\nFrequencies for Gender")
table(data_frame$Gender)

#----------------------------------------------------------------
#----------------------------------------------------------------
#----------------------------------------------------------------

writeLines("\n\n Starting Question 1")
question1 <-t.test(data_frame$Motivation, mu=5)
question1
writeLines("Standard Deviation was")
sd(data_frame$Motivation)
writeLines("Cohen d was")
computeCohenD(data_frame, question1)


jpeg(filename="/tmp/homework2/question1.jpg",width=480,height=480)

hist(data_frame$Motivation,
 main="Motivation",
 xlab="Motivation Rating",
 xlim=c(0,10),
 col="darkmagenta",
 breaks=20
)

dev.off()

#----------------------------------------------------------------
#----------------------------------------------------------------
#----------------------------------------------------------------

writeLines("\n\n Starting Question 2")
t.test(data_frame$Motivation ~ data_frame$Gender, var.equal=TRUE)
t.test(data_frame$Motivation ~ data_frame$Gender, var.equal=FALSE)

writeLines("Coding gender as a categorical variable")

question2 <- data_frame %>% 
   mutate(Gender_Name = ifelse(Gender==1, "FEMALE", "MALE"))

writeLines("Running Levene Test")
result = leveneTest(Motivation ~ Gender_Name, question2)
print(result)

jpeg(filename="/tmp/homework2/question2.jpg",width=480,height=480)

ggplot(question2) +
  aes(x = Gender_Name, y = Motivation) +
  geom_boxplot(outlier.colour="black", outlier.shape=16,
             outlier.size=2, notch=FALSE)
 
  
dev.off()


#----------------------------------------------------------------
#----------------------------------------------------------------
#----------------------------------------------------------------
writeLines("\n\n Starting Question 3")

question3 <- t.test(data_frame$Motivation, data_frame$Commitment, paired=TRUE)
question3

writeLines("Cohen d was")
computeCohenD(data_frame, question3)

writeLines("Standard Deviation for Motivation was")
sd(data_frame$Motivation)

writeLines("Standard Deviation for Commitment was")
sd(data_frame$Commitment)


question3_longer <- data_frame %>%
    pivot_longer(
        cols = c("Motivation", "Commitment"),
        names_to = "Measurement"
    )

question3_longer

jpeg(filename="/tmp/homework2/question3.jpg",width=480,height=480)

ggplot(question3_longer) +
  aes(x = Measurement, y = value) +
  geom_boxplot(outlier.colour="black", outlier.shape=16,
             outlier.size=2, notch=FALSE)
 
  
dev.off()


write_sav(data_frame, "/tmp/homework2/king-homework2.sav")
writeLines("\n\n\n\n******End Homework 2")
#----------------------------------------------------------------
#----------------------------------------------------------------
#----------------------------------------------------------------