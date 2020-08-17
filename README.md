# Getting and Cleaning Data Course Project
## Data utilized for research
Data were recovered from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
From this dataset the following files were used:
1. **Features.txt** - list of all features
2. **activity_labels.txt** - links the class labels with their activity name
3. **subject_test.txt** - identifies the subject who performed the activty in the test set
4. **x_test.txt** - test set
5. **y_test.txt** - test labels
6. **subject_train.txt** - identifies the subject who performed the activty in the train set
7. **x_train.txt** - training set
8. **y_train.txt** - training labels

##Files
* `Codebook.md` - a file that describes variables, data and the modfications made
* `run_analysis.R` - the R script that follows 5 steps given by the course project:
  * Merging the training and testing data
  * Extracting only the mean and standar deviation measurements
  * Using descriptive names to the activities in the data set
  * Appropriately labes the data set with descriptive activity names
  * Creates a second independent tidy data set with the average of each variable for each activity and each subject
* `End_data.txt` - the exported data set after the R script was performed
