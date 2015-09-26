#setwd("/Users/Lumi/R_courses/DataScienceSpecialization/Getting and Cleaning Data/Week3/CourseProject/UCI_HAR_Dataset")
library(dplyr)
subject_test <- read.table("./test/subject_test.txt", header=FALSE, sep = "")
y_test <- read.table("./test/y_test.txt", header=FALSE, sep = "")
x_test <- read.table("./test/X_test.txt", header=FALSE, sep = "")
newDB1 <- cbind(subject_test, y_test, x_test)
body_acc_x_test <- read.table("./test/Inertial Signals/body_acc_x_test.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_acc_y_test <- read.table("./test/Inertial Signals/body_acc_y_test.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_acc_z_test <- read.table("./test/Inertial Signals/body_acc_z_test.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_gyro_x_test <- read.table("./test/Inertial Signals/body_gyro_x_test.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_gyro_y_test <- read.table("./test/Inertial Signals/body_gyro_y_test.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_gyro_z_test <- read.table("./test/Inertial Signals/body_gyro_z_test.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
total_acc_x_test <- read.table("./test/Inertial Signals/total_acc_x_test.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
total_acc_y_test <- read.table("./test/Inertial Signals/total_acc_y_test.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
total_acc_z_test <- read.table("./test/Inertial Signals/total_acc_z_test.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
newDB1 <- cbind(newDB1, body_acc_x_test, body_acc_y_test, body_acc_z_test, body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, total_acc_x_test, total_acc_y_test, total_acc_z_test)

subject_train <- read.table("./train/subject_train.txt", header=FALSE, sep = "")
y_train <- read.table("./train/y_train.txt", header=FALSE, sep = "")
x_train <- read.table("./train/X_train.txt", header=FALSE, sep = "")
newDB2 <- cbind(subject_train, y_train, x_train)
body_acc_x_train <- read.table("./train/Inertial Signals/body_acc_x_train.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_acc_y_train <- read.table("./train/Inertial Signals/body_acc_y_train.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_acc_z_train <- read.table("./train/Inertial Signals/body_acc_z_train.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_gyro_x_train <- read.table("./train/Inertial Signals/body_gyro_x_train.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_gyro_y_train <- read.table("./train/Inertial Signals/body_gyro_y_train.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
body_gyro_z_train <- read.table("./train/Inertial Signals/body_gyro_z_train.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
total_acc_x_train <- read.table("./train/Inertial Signals/total_acc_x_train.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
total_acc_y_train <- read.table("./train/Inertial Signals/total_acc_y_train.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
total_acc_z_train <- read.table("./train/Inertial Signals/total_acc_z_train.txt", header=FALSE, sep = "", fill=TRUE, strip.white = TRUE)
newDB2 <- cbind(newDB2, body_acc_x_train, body_acc_y_train, body_acc_z_train, body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, total_acc_x_train, total_acc_y_train, total_acc_z_train)

data <- rbind(newDB1, newDB2)

dataNew <- data[,c(1:8, 123:128)]

for (i in 1:nrow(dataNew)) {
        if (dataNew[i,2] == 1) dataNew[i,2] <- "WALKING"
        if (dataNew[i,2] == 2) dataNew[i,2] <- "WALKING_UPSTAIRS"
        if (dataNew[i,2] == 3) dataNew[i,2] <- "WALKING_DOWNSTAIRS"
        if (dataNew[i,2] == 4) dataNew[i,2] <- "SITTING"
        if (dataNew[i,2] == 5) dataNew[i,2] <- "STANDING"
        if (dataNew[i,2] == 6) dataNew[i,2] <- "LAYING"
}

names(dataNew)[1] <- paste("ID_Volunteer")
names(dataNew)[2] <- paste("Activity")
names(dataNew)[3] <- paste("tBodyAccMeanX")
names(dataNew)[4] <- paste("tBodyAccMeanY")
names(dataNew)[5] <- paste("tBodyAccMeanZ")
names(dataNew)[6] <- paste("tBodyAccStdX")
names(dataNew)[7] <- paste("tBodyAccStdY")
names(dataNew)[8] <- paste("tBodyAccStdZ")
names(dataNew)[9] <- paste("tBodyGyroMeanX")
names(dataNew)[10] <- paste("tBodyGyroMeanY")
names(dataNew)[11] <- paste("tBodyGyroMeanZ")
names(dataNew)[12] <- paste("tBodyGyroStdX")
names(dataNew)[13] <- paste("tBodyGyroStdY")
names(dataNew)[14] <- paste("tBodyGyroStdZ")

dataNew <-tbl_df(dataNew)
dataFinal <- dataNew %>% group_by(ID_Volunteer, Activity) %>% mutate(avg_tBodyAccMeanX = mean(tBodyAccMeanX), avg_tBodyAccMeanY = mean(tBodyAccMeanY), avg_tBodyAccMeanZ = mean(tBodyAccMeanZ), avg_tBodyAccStdX = mean(tBodyAccStdX), avg_tBodyAccStdY = mean(tBodyAccStdY), avg_tBodyAccStdZ = mean(tBodyAccStdZ), avg_tBodyGyroMeanX = mean(tBodyGyroMeanX), avg_tBodyGyroMeanZ = mean(tBodyGyroMeanZ), avg_tBodyGyroStdX = mean(tBodyGyroStdX), avg_tBodyGyroStdY = mean(tBodyGyroStdY), avg_tBodyGyroStdZ = mean(tBodyGyroStdZ))
write.table(dataFinal, file = "DataFinal.txt", row.names = FALSE)



