library(haven)
library(dplyr)
library(ggplot2)

computeCohenD <- function(data, t_test_result){
  return (unname(t_test_result)[[1]] / sqrt(nrow(data)))
}

writeLines("\n\n\n\n******Starting Class 2023-12-18")

writeLines("Starting Read: Class Data Files")
data <- read_sav("data_sets/class/Three-T-tests.sav")
writeLines("Read Complete")

data
glimpse(data)

jpeg(filename="/tmp/class-2023-12-18/graph1.jpg",width=480,height=480)

hist(data$OverallScore,
 main="Overall Leadership Score",
 xlab="OverallScore",
 xlim=c(45,80),
 col="darkmagenta",
 breaks=20
)

dev.off()

result <- t.test(data$OverallScore, mu=60)
result

groupA <- data %>% filter(Group == "A")
groupB <- data %>% filter(Group == "B")

result2 <- t.test(groupA$OverallScore, groupB$OverallScore, var.equal=TRUE)
result2

writeLines("Cohen D is")
computeCohenD(groupA, result2)

result3 <- t.test(groupA$PostTrainingScore, groupA$PreTrainingScore, paired = TRUE)
result3

writeLines("Cohen D is")
computeCohenD(groupA, result3)
