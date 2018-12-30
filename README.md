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

## Code Book

- labelCode: codes related to activities from 1 to 6, with respective correspondence in variable labelName;
- subjectID: identification codes related to each volunteer;
- labelName: names related to activities among the categories WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING;

There are also a set of variables that comes from the original data set. From "features_info.txt", that belongs to the data set, and shows information about the variables on the feature vector:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
