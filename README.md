Getting and cleaning data: course project
=========================================

This README file contains information about the `run_analyis.R` script.

Data source
------------------

The complete information about the Getting and Cleaning Data Course Project can be found in:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data set can be obtained from here (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

Dependencies
------------
The script requires "reshape2", "plyr" and "data.table" packages to be installed.
The install instances are writed in the script.

Output: data
------------
The script generates two data sets: 
- `data.txt` : with training and test data sets together with subject and activity data, based on the variables with mean and standard deviation.
- `tidy_data.txt`: aggregate of the `data.txt` calculating the mean by any subject and any activity.
