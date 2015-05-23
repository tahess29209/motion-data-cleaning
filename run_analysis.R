library(dplyr)

#set working directory and provide directory names for data files. 
setwd("C:/Users/Tim/SkyDrive/Documents/Coursera/R/CleaningDataProject")
datadirectory <- "UCI HAR Dataset"
trainingdirectory <- "train"
testdirectory <- "test"

#read in the list of features and the list of activity labels
features <- read.table(file.path(datadirectory,"features.txt"))
#coerce the feature factors to character arrays
features[[2]]<- as.character(features[[2]])
#make acceptable column names from the list of data features. 
goodnames <- make.names(features[[2]], unique = TRUE)
#read activity label data from file. 
activity_labels <- read.table(file.path(datadirectory, "activity_labels.txt"))

#read training set data into R
train_data <- tbl_df(read.table(file.path(datadirectory,trainingdirectory,"X_train.txt")))
train_labels <- tbl_df(read.table(file.path(datadirectory,trainingdirectory,"y_train.txt")))
train_subjects <- tbl_df(read.table(file.path(datadirectory, trainingdirectory, "subject_train.txt")))

#read test set data into R
test_data <- tbl_df(read.table(file.path(datadirectory,testdirectory,"X_test.txt")))
test_labels <- tbl_df(read.table(file.path(datadirectory,testdirectory,"y_test.txt")))
test_subjects <- tbl_df(read.table(file.path(datadirectory, testdirectory, "subject_test.txt")))

#bind training data to subject and activity labels.
train_df <- bind_cols(train_subjects,train_labels,train_data)
#rename the columns of the data frame.
names(train_df) <- c("subject","activity",goodnames)
#add a column indicating that the measurement has come from the training data set. 
train_df <- mutate(train_df,dataset = "train")

#repeat operations with the test data set. 
test_df <- bind_cols(test_subjects,test_labels, test_data)
names(test_df) <- c("subject","activity",goodnames)
test_df <- mutate(test_df, dataset = "test")

#combine the test and training data sets into one. 
data <- bind_rows(train_df,test_df)
#convert activity labels to factors that are textual activity descriptions
data[[2]] <- factor(data[[2]], labels = activity_labels[[2]])

#Select only the variables that are either mean or standard deviations
data2 <- select(data, subject, activity, dataset, contains("mean"),contains("std")) 

#output data set - get the average value of each variable for each combination of subject and activity
data3 <- summarise_each(group_by(data2, subject, activity), "mean", tBodyAcc.mean...X:fBodyBodyGyroJerkMag.std..)

#write data to output file
write.table(data3, file= "tidy_accel_data.txt", row.names = FALSE)
