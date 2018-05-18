#Coursera Getting and Cleaning Data Course Project

# run_analysis.r File Description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

library(plyr)

# Downloading dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")


# 1. Merge the training and the test sets to create one data set:

# 1.1 Reading files

# a. Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# b. Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# c. Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# d. Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# 1.2 Assigning column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"ActivityId"
colnames(subject_train) <- "SubjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "ActivityId"
colnames(subject_test) <- "SubjectId"

colnames(activityLabels) <- c('ActivityId','activityType')

# 1.3 Merging all data in one set:
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
all_data <- rbind(mrg_train, mrg_test)

# 2. Extracting only the measurements on the mean and standard deviation for each measurement

# 2.1 Reading column names:
colNames <- colnames(all_data)

# 2.2 Create vector for defining ID, mean and standard deviation:
mean_and_std <- (grepl("ActivityId" , colNames) | 
                   grepl("SubjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

# 2.3 Making nessesary subset from all_data:
setForMeanAndStd <- all_data[ , mean_and_std == TRUE]

# 3. Using descriptive activity names to name the activities in the data set:
setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='ActivityId',
                              all.x=TRUE)

# 4. Appropriately labeling the data set with descriptive variable names.

#1.leading t or f is based on time or frequency measurements.
#2. Body = related to body movement.
#3. Gravity = acceleration of gravity
#4. Acc = accelerometer measurement
#5. Gyro = gyroscopic measurements
#6. Jerk = sudden movement acceleration
#7. Mag = magnitude of movement
#8 mean and SD are calculated for each subject for each activity for each mean and SD measurements. 
#The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

names(setWithActivityNames)<-gsub("std()", "SD", names(setWithActivityNames))
names(setWithActivityNames)<-gsub("mean()", "MEAN", names(setWithActivityNames))
names(setWithActivityNames)<-gsub("^t", "time", names(setWithActivityNames))
names(setWithActivityNames)<-gsub("^f", "frequency", names(setWithActivityNames))
names(setWithActivityNames)<-gsub("Acc", "Accelerometer", names(setWithActivityNames))
names(setWithActivityNames)<-gsub("Gyro", "Gyroscope", names(setWithActivityNames))
names(setWithActivityNames)<-gsub("Mag", "Magnitude", names(setWithActivityNames))
names(setWithActivityNames)<-gsub("BodyBody", "Body", names(setWithActivityNames))

# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

# 5.1 Making second tidy data set 
TidySet_2 <- aggregate(. ~SubjectId + ActivityId, setWithActivityNames, mean)
TidySet_2 <- TidySet_2[order(TidySet_2$SubjectId, TidySet_2$ActivityId),]

# 5.2 Writing second tidy data set in txt file
write.table(TidySet_2, "TidySet_2.txt", row.name=FALSE)