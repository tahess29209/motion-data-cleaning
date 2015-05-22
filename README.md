# motion-data-cleaning
repository for coursera getting and cleaning data project

##Overview
Instructions for this project are located here: https://class.coursera.org/getdata-014/human_grading/view/courses/973501/assessments/3/submissions

##Analysis File
run_analyis.R - Run this file from the same working directory as the data. This script will process the raw data files and create a tidy data set for further analysis. 

###Steps used to create tidy data set

1. Each test and training data file is read into R data frames using `read.table()`. This includes the subject data. 
2. The activity_lables and features are read into R data frames using `read.table()`.
3. All of the test data components are combined into a single data frame using `cbind()`.
4. All of the training data components are combined into a single data frame using `cbind()`.
5. The training and test data sets are combined into a single data frame using `rbind()`.

##Directory Structure and Data Location
The run_analysis.R script must be located in the same directory as the UCI HAR dataset. The layout of the required data files is as follows (note that the inertial signal data is not used in this analysis):

* **Working Directory**
  * run_analysis.R
  * **UCI HAR Dataset**
    * **test**
      * **Intertial Signals**
      * subject_test.txt
      * X_test.txt
      * y_test.txt
    * **train**
      * **Intertial Signals** 
      * subject_train.txt
      * X_train.txt
      * y_train.txt
    * activity_labels.txt
    * features.txt
    * features_info.txt
    * README.txt



