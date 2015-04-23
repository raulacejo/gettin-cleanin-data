Background of the data
----------------------
Information about the data collection and the differet data sets can be found in the `README.txt` file associated with the data. All the information can be obtained from:
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For my analysis I have done the following steps:
- Merge the `subject_train.txt`, `X_train.txt` and `y_train.txt` data sets. Result: `train` data set.
- Merge the `subject_test.txt`, `X_test.txt` and `y_test.txt` data sets. Result: `test` data set.
- Merge the `train` and `test` data sets to obtain `data` data set.
- From `features.txt` select the variables with mean and standard deviation, using their names. So it results a dimension reduction from 563 to 81 variables.
- From `activity_labels.txt` replaced the `y` variable in the `data` data set. Changing it from an integer to a factor.
- Change the subjects (in `subject_train.txt` and `subject_test.txt`) from numeric to categorical values.

Variables in the data set
------------------------

| Name | Type | Description |
| ---- | ---- | ----------- |
|activity | categorical| performed activity |
|subject  | categorical| unique id per subject |
|BodyAcc-XYZ | continuous | more detailed info see below |
|tGravityAcc-XYZ | continuous | 
|tBodyAccJerk-XYZ | continuous | 
|tBodyGyro-XYZ | continuous | 
|tBodyGyroJerk-XYZ | continuous | 
|tBodyAccMag | continuous | 
|tGravityAccMag | continuous | 
|tBodyAccJerkMag | continuous | 
|tBodyGyroMag | continuous | 
|tBodyGyroJerkMag | continuous | 
|fBodyAcc-XYZ | continuous | 
|fBodyAccJerk-XYZ | continuous | 
|fBodyGyro-XYZ | continuous | 
|fBodyAccMag | continuous | 
|fBodyAccJerkMag | continuous | 
|fBodyGyroMag | continuous | 
|fBodyGyroJerkMag | continuous | 
