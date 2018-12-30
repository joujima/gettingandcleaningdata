## Getting and Cleaning Data Course Project

# SETTING DATA SET FILES AND WORKING DIRECTORY
## Downloading the zipfile, if it does not already exist.
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile = "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
if(!file.exists(destfile)){
   download.file(fileURL, destfile = destfile)
}

## Creating a separate working directory, if it is not available yet.
project_dir = "Getting and Cleaning Data Course Project/"
if(!file.exists(project_dir)){
   dir.create(project_dir)
}

## Getting the original working directory before changing it.
original_wd <- getwd()
setwd(project_dir)

## Unzipping the file if necessary and setting working directory
if(!file.exists("UCI HAR Dataset")){
   unzip(destfile)
}
setwd("UCI HAR Dataset")

## Loading dependency library
library(dplyr)


# LOADING AND SETTING DATA SETS
## Reading X
X_test <- read.table("test/X_test.txt",header = FALSE)
X_train <- read.table("train/X_train.txt",header = FALSE)

## Merging X
X <- rbind(X_test, X_train)

## Reading the variable names (features)
features <- read.table("features.txt", header = FALSE)

## Applying names to variables
names(X) <- t(features$V2)

## Reading Y
Y_test <- read.table("test/y_test.txt", header = FALSE)
Y_train <- read.table("train/y_train.txt", header = FALSE)

## Merging Y
Y <- rbind(Y_test, Y_train)
names(Y) <- "labelCode"

## Reading subject ID
subject_id_test <- read.table("test/subject_test.txt", header = FALSE)
subject_id_train <- read.table("train/subject_train.txt", header = FALSE)

## Merging subject IDs
subject_id <- rbind(subject_id_test,subject_id_train)
names(subject_id)<- "subjectID"

## Merging collected data and labels (item 1)
complete_dataset <- cbind(X, Y, subject_id)

# SELECTING FEATURES OF INTEREST AND APPLYING CORRECT LABELS
## Selecting only indices of measurements on mean and standard deviation
selected_features_indices <- grep("mean|std",features$V2)


## Selecting data on the mean and standard deviation and their respective label
## Subject IDs (562) and Labels (563) are also selected. (item 2)
selected_dataset <- complete_dataset[,c(selected_features_indices,562,563)]

## Reading descriptive activity names (item 3)
activity_names <- read.table("activity_labels.txt", header = FALSE)
names(activity_names) <- c("labelCode", "labelName")

## Merging dataset with activity names (item 4)
selected_dataset_labels <- merge(selected_dataset, activity_names, by.x = "labelCode", by.y = "labelCode")

# CALCULATING AVERAGES DATA SET
## Creating data set with the average of each variable for each activity and each subject
## For each subject and each activity, the averages are calculated
## and added to final dataframe (item 5)
averages = selected_dataset_labels[FALSE,]
for(subject in 1:30){
   for(activity in 1:6){
      activity_name <- as.character(activity_names[activity,2])
      new_line <- cbind(data.frame(activity,t(apply(filter(selected_dataset_labels,labelCode==activity,subjectID==subject)[,2:80],2,mean)), subject), activity_name)
      names(new_line) <- names(selected_dataset_labels)
      averages <- rbind(averages,new_line)
   }
}

# SAVING DATA SET
write.table(averages, file = "averages.txt", row.names = FALSE)

## Returning to the original working directory
setwd(original_wd)