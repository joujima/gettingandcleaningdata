# gettingandcleaningdata
Getting and Cleaning Data Course Project
This repository contains files from "Getting and Cleaning Data" course project:
## run_analysis.R:
Contains a script in R programming language, that does the following:
- checks if there is a working directory ("Getting and Cleaning Data/"), and if there is not one, it creates that;
- checks if there is the zipfile (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and if there is not, it downloads and unzips that;
- loads the data frames related to the sensors (embedded accelerometer and gyroscope) from test and train (X_test, X_train), and binds into X;
- loads the variable names from "features.txt", and stores them into table X.
- loads the labels from test and train (Y_test, Y_train), and binds into table Y (named labelCode);
- loads the data related to the subjects (volunteers), and stores them in table subject_id (named subjectID);
- binds Y, X, and subject_id, into one data frame named complete_data;
- finds variables related to mean and standard deviation, just like the project requirements, and stores the respective indices;
- filters complete_data to extract only the variables of interest, and stores them in selected_dataset;
- loads the data that relates the label names and label codes, and stores it in table labels (variables labelCode and labelName)
- merges selected_data with labels into selected_data_labels, taking labelCode as reference;
- creates a new data frame (averages), with same variables in selected_data_labels;
- adds a new row into table averages containing the average for each selected variable, for each subject and for each label;
- stores the table averages into file "averages.txt", according to project requirements.
