library(haven)
library(dplyr)
library(ggplot2)
writeLines("Starting Homework 1")

data_frame <- data.frame(
   Manager_ID=c(1:20),  
   Gender=c(rep("M",10),rep("F",10)),
   Motivation=c(7,8,5,1,4,
                5,5,8,8,6,
                4,5,8,10,10,
                1,1,3,5,0),
   Commitment=c(8,14,7,0,5,
                7,6,10,11,12,
                4,8,15,18,14,
                2,1,4,12,2)
)

writeLines("\nOriginal Data")
data_frame

writeLines("\n\nQuestion 1")
writeLines("Adding Personality")
new_data <- data_frame %>% mutate(
 Personality = ((Motivation+Commitment)/2)
)

writeLines("Recoding Gender") 
new_data$Gender_numeric <- as.factor(ifelse(new_data$Gender == "M",1,2)) 

writeLines("New Data set with recoded Gender") 
new_data
write_sav(new_data, "/tmp/homework1-king.sav")


writeLines("\nSelecting only Gender_numeric 2")
females_only <- new_data %>% filter(Gender_numeric == 2)
females_only


writeLines("\n\nGraphs")
gender_frequency <- as.data.frame(table(data_frame$Gender))
piepercent <- round(100 * gender_frequency$Freq / sum(gender_frequency$Freq), 1)


print(gender_frequency)
jpeg(filename="/tmp/gender.jpg",width=480,height=480)

pie(gender_frequency$Freq, labels = piepercent, main="Gender", col = c("red", "green"))
legend("topright", 
       legend = gender_frequency$Var1, 
       cex = 0.8, 
       fill = c("red", "green"))
dev.off()

jpeg(filename="/tmp/commitment.jpg",width=480,height=480)

hist(data_frame$Commitment,
 main="Commitment",
 xlab="Commitment Level",
 xlim=c(0,19),
 col="darkmagenta",
 breaks=20
)

dev.off()

jpeg(filename="/tmp/motivation.jpg",width=480,height=480)

hist(data_frame$Motivation,
 main="Motivation",
 xlab="Motivation Level",
 xlim=c(0,10),
 col="darkmagenta",
 breaks=20
)

dev.off()

jpeg(filename="/tmp/motivation_vs_commitment.jpg",width=480,height=480)
ggplot(data = data_frame, aes(x = Motivation, y = Commitment)) +  geom_point()
dev.off()


jpeg(filename="/tmp/motivation_vs_commitment_by_gender.jpg",width=480,height=480)
ggplot(data = data_frame, aes(x = Motivation, y = Commitment, col=Gender)) +  geom_point()
dev.off()

writeLines("\n\nDescriptive Statistics for the entire data set")
summary(data_frame)

males_only <- new_data %>% filter(Gender_numeric == 1)
#males_only

writeLines("\n\nDescriptive Statistics for Males")
summary(females_only)

writeLines("\n\nDescriptive Statistics for Females")
summary(males_only)