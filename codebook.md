codebook for getting and cleaning data personal project 	snufkinly 11/22/15

	

	

Project Description

processing of a mesy dataset into a tidy dataset and a summarized tidy dataset for the getting and cleaning data course

raw data provided via course:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Notes on the original (raw) data
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
For each record we are provided with:
======================================
data from smartphone accelerometer and gyroscope
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Creating the tidy datafile
Guide to create the tidy data file
data was grouped, combined, renamed, sorted and processed via run_analysis.R script
detail available in readme file listed below
https://github.com/snufkinly/getting_cleaning/blob/master/README.md

briefly: collapsed seperate parts of test and training data sets to provide variable names, subject and activity variables to the core un-named data.
data was sorted and merged
data was stripped of variables unneccesary for this assignmend (leaving mean and standard deviation values)
this data was then prepared for summarization, sorted via subject and activity and the mean was calculated for each variable under this rubric
finally the data was written as tab-delimited text file and saved to this github repository


General description of the file including:

full clean dataset "merged_data" 10299obs. of 68 variables including subject and activity variables
smaller summary dataset of means subset by activity and subject "small_data" 180 obs of 68 variables
variables list by column:
 [1] "subject"                     "activity"                    "tBodyAcc-mean()-X"          
 [4] "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tGravityAcc-mean()-X"       
 [7] "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tBodyAccJerk-mean()-X"      
[10] "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyGyro-mean()-X"         
[13] "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyroJerk-mean()-X"     
[16] "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyAccMag-mean()"         
[19] "tGravityAccMag-mean()"       "tBodyAccJerkMag-mean()"      "tBodyGyroMag-mean()"        
[22] "tBodyGyroJerkMag-mean()"     "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[25] "fBodyAcc-mean()-Z"           "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[28] "fBodyAccJerk-mean()-Z"       "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[31] "fBodyGyro-mean()-Z"          "fBodyAccMag-mean()"          "fBodyBodyAccJerkMag-mean()" 
[34] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroJerkMag-mean()" "tBodyAcc-std()-X"           
[37] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-std()-X"        
[40] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-std()-X"       
[43] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-std()-X"          
[46] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-std()-X"      
[49] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-std()"          
[52] "tGravityAccMag-std()"        "tBodyAccJerkMag-std()"       "tBodyGyroMag-std()"         
[55] "tBodyGyroJerkMag-std()"      "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"           
[58] "fBodyAcc-std()-Z"            "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"       
[61] "fBodyAccJerk-std()-Z"        "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"          
[64] "fBodyGyro-std()-Z"           "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-std()"  
[67] "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-std()" 

all variables bounded by [-1,1]
acceleration signals from smartphone accelerometer X axis in standard gravity units 'g'
body acceleration signals *Body* obtained by subtracting gravity from the total acceleration
angular velocity measured by the gyroscope for each window sample ((fixed-width sliding windows of 2.56 sec and 50% overlap) 128 readings per window),units are radians/sec

  

