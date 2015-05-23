# motion-data-cleaning
repository for coursera getting and cleaning data project

##Overview
Instructions for this project are located [here](https://class.coursera.org/getdata-014/human_grading/view/courses/973501/assessments/3/submissions).

The complete raw data set for this project is located [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

##Setup and Use
* `run_analyis.R` - Place this file same working directory as the data. This script will process the raw data files and create a tidy data set for further analysis. When run in R, the file will load the appropriate data files as long as they follow the directory structure below. Then, the script will clean up the data and write an output file.
* `tidy_accel_data.txt` - This is a text file containing the output of the `run_analysis.R` script. It contains a table.  

###Directory Structure and Data Location
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

##Steps used to create tidy data set

1. Load the `plyr' library
2. Set working directory and directory structure for data files
3. Read the features.txt file into an R data frame.
4. Coerce the list of features from factors into character strings
5. Use the list of features to create a list of acceptable column names for future data frames.
6. Read the activity_lables.txt file into a data frame. 
7. Read the acceleration data, label data, and subject data for the training data set into separate data frames.
8. Repeat step 7 for the test data set. 
9. Use `bind_cols` to combine the data frames in step 7 into one data frame. 
10. rename the columns of this new data frame using the names "subject","activity", and the names generated in step 5.
11. use the `mutate` function to add a column labeling each row as part of the training data set. 
11. repeat steps 9 through 11 for the test data set.
12. Use `bind_rows` to combine the test and training data sets into one data frame. 
13. Use the `select` and `contains` functions to create a data frame containing only the features including mean or standard deviation in their name.
14. Use the `summarize_each` and the `group_by` functions to create a new data frame that averages the selected features based on subject and activity. This new data frame has one row for each combination of subject and activity and the average of each of the selected features. 
15. Write the data frame from step 14 into a `.txt` file using `table.write()` and `row.names = FALSE`. 
