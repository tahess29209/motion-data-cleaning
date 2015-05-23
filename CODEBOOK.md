#Motion Data Cleaning Project Codebook

This file describes the output variables produced in the tidy data set that is produced by run_analysis.R, located in this repository. 

##File Description
The output of `run_analysis.R` is a table contained in a `tidy_accel_data.txt`. The raw data set contains 561 numeric variables describing motion captured in an experiment using 30 participants performing 6 different activities. This tidy data set extracts a subset of the 561 variables, and calculates the mean value of each variable for every combination of participant and activity. 

##Variables

* subject
  * Unique identifier for each participant in the study.
  * integer:1-30
* activity
  * Identifies the type of activity represented by the acceleration data.
  * factor, 6 levels
    * WALKING
    * WALKING-UPSTAIRS
    * WALKING-DOWNSTAIRS
    * WALKING-SITTING
    * WALKING-STANDING
    * WALKING-LAYING
* Numeric data: 86 columns
  * For each subject and activity combination, muliple acceleration measuresments were gathered. These columns contain the average of each measurement characteristic for a given subject and activity combination. 
  * numeric: normalized to [-1,1]
    * tBodyAcc.mean...X
    * tBodyAcc.mean...Y
    * ...
    * fBodyBodyGyroJerkMag.std..


More detailed descriptions of each acceleration data type can be found in the file `features_info.txt`, included in the original data set. 
