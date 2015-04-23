##################################################################################################################
# This script is ready to:

# Merges the training and the test sets to create one data set.
# Extract only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##################################################################################################################

# Install required packages 

install.packages("plyr", dependencies = TRUE)
install.packages("reshape2", dependencies = TRUE)
install.packages("data.table", dependencies = TRUE)

# Download the zip file:

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/getdata-projectfiles-UCI.zip", method = "curl")

# Unzip the file and put it in data folder

unzip("./data/getdata-projectfiles-UCI.zip", exdir = "./data")

# Set the path and check the files

path <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path, recursive=TRUE)
files

# Load the data files

train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", sep = "\n")
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", sep = "\n")
train_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt", quote="\"")
train_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt", sep="\n")
test_x  <- read.table("./data/UCI HAR Dataset/test/X_test.txt", quote="\"")
test_y  <- read.table("./data/UCI HAR Dataset/test/y_test.txt", sep="\n")

# Combine the data sources: (train: train_subject, train_y, train_x) (test: test_subject, test_y, test_x) 

train <- cbind(train_subject, train_y, train_x)
test  <- cbind(test_subject,  test_y,  test_x)

# Combined data (train & test):

data <- rbind(train, test)

##################################################################################################################

# Extract only the measurements on the mean and standard deviation for each measurement. 

# Read in the variable text file and keep only those variables with mean or std in their name

variable_names <- read.table("./data/UCI HAR Dataset/features.txt", sep="\n")
variable_names <- gsub("^[0-9]+ ", "", variable_names$V1)
variables <- grepl("mean|std", variable_names)

## Add two more TRUE, subject and y values

variables_total <- c(TRUE, TRUE, variables)

# Remove the FALSE variables from the data set

data <- data[, which(variables_total == T)]
colnames(data) <- c("subject", "activity", variable_names[variables])

##################################################################################################################

# Uses descriptive activity names to name the activities in the data set

# Load the activities labels file

activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", quote="\"")

##################################################################################################################

# Appropriately labels the data set with descriptive activity names. 

# Some fixes in the variable names

names(data)<-gsub("^t", "time_", names(data))
names(data)<-gsub("^f", "frequency_", names(data))
names(data)<-gsub("Acc", "Accelerometer_", names(data))
names(data)<-gsub("Gyro", "Gyroscope_", names(data))
names(data)<-gsub("Mag", "Magnitude_", names(data))
names(data)<-gsub("BodyBody", "Body_", names(data))

##################################################################################################################

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Factorize subject

data$subject <- factor(data$subject)

# Save the data set as a text file

write.table(data, file="./data/data_set.txt")

# Create a tidy_data set with averages

require(data.table)
data_table <- data.table(data)
variables_table <- colnames(data_table)[-(1:2)]
tidy_data <- data_table[, lapply(.SD, mean), .SDcols = variables_table, 
                        by = list(subject, activity)]

# Save the tidy data set as tidy_data.txt

write.table(tidy_data, file="./data/tidy_data.txt", row.name=FALSE)

##################################################################################################################
