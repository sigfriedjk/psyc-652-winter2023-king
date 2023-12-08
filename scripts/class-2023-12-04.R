library(haven)
library(dplyr)
print("Starting Class 1")


class1data1 <- "data_sets/class/CLIMB_Data_Set_with_Demographics_and_Manager_Ratings_w_Pay_Level__2.sav"
class1data2 <- "data_sets/class/Independent_and_Dependent_Samples_t_test_data-1.sav"
class1data3 <- "data_sets/class/Mitchell_SPSS_Data_Set_12_4_2023.sav"
print("Starting Read")
data_frame1 <- read_sav(class1data1)
data_frame2 <- read_sav(class1data2)
data_frame3 <- read_sav(class1data3)
print("Read Complete")