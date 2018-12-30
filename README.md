# gettingandcleaningdata
Getting and Cleaning Data Course Project
This repository contains files from "Getting and Cleaning Data" course project:
## run_analysis.R:
Contains a script in R programming language, that finds a proper working directory, downloads the data set if necessary, loads data related to sensors and labels, binds them properly, filters the data, iteratively search and calculate averages according to the project's requirement, and store the calculated data into a .txt file. Sequentially, it performs:
1. checks if there is a working directory ("Getting and Cleaning Data/"), and if there is not one, it creates that;
2. checks if there is the zipfile (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and if there is not, it downloads and unzips that;
3. loads the data frames related to the sensors (embedded accelerometer and gyroscope) from test and train (X_test, X_train), and binds their rows into X;
4. loads the variable names from "features.txt", and associates them to table X;
5. loads the label codes column from test and train (Y_test, Y_train), and binds their rows into table Y (named labelCode);
6. loads the subject IDs column related to the volunteers, and stores it in table subject_id (named subjectID);
7. binds the columns of Y, X, and subject_id, into one data frame named complete_data;
8. finds variables related to mean and standard deviation by filtering those which have the strings "mean" (average of measurements) or "std" (standard deviation of measurements), just like the project requirements, and stores the respective indices;
9. filters complete_data to extract only the variables of interest, and stores them in selected_dataset;
10. loads the data that relates the label names and label codes, and stores it in table labels (variables labelCode and labelName)
11. merges selected_data with labels into selected_data_labels, taking labelCode as reference;
12. creates a new data frame (averages), with same variables in selected_data_labels;
13. adds a new row into table averages containing the average for each selected variable, for each subject and for each label;
14. stores the table averages into file "averages.txt", according to project requirements.

