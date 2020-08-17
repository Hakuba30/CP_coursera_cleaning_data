library(dplyr)

#downloading dataset
filename <- "UCI HAR Dataset.zip"
#checking file
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
}  
#checking folder
if (!file.exists("UCI HAR Dataset")){
        unzip(filename)
}

#naming all dataframes

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("i","feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")

#Merging the training and test datasets

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test) 
Merged_data <- cbind(Subject, Y, X)

#Extracting mean and sd

Data <- Merged_data %>% select(subject, label, contains("mean"), contains("std"))

#Using the activity names

Data$label <- activities[Data$label, 2]

#labeling

names(Data)[2] = "activity"
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("^t", "Time", names(Data))
names(Data) <- gsub("^f", "Frequency", names(Data))
names(Data) <- gsub("tBody", "TimeBody", names(Data))
names(Data) <- gsub("-mean()", "Mean", names(Data), ignore.case = TRUE)
names(Data) <- gsub("-std()", "STD", names(Data), ignore.case = TRUE)
names(Data) <- gsub("-freq()", "Frequency", names(Data), ignore.case = TRUE)
names(Data) <- gsub("angle", "Angle", names(Data))
names(Data) <- gsub("gravity", "Gravity", names(Data))

End_data <- Data %>%
        group_by(subject, activity) %>%
        summarise_all(.funs = mean)
write.table(End_data, "End_data.txt", row.names = FALSE)

str(End_data)
End_data
