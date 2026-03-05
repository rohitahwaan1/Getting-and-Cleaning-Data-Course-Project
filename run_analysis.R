if(!file.exists("UCI HAR Dataset")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile="dataset.zip", method="curl")
  unzip("dataset.zip")
}

library(dplyr)

features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
library(dplyr)

features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

colnames(X) <- features$V2
colnames(y) <- "Activity"
colnames(subject) <- "Subject"

data <- cbind(subject, y, X)

data <- data %>% select(Subject, Activity, contains("mean"), contains("std"))

data$Activity <- factor(data$Activity,
                        levels = activity_labels$V1,
                        labels = activity_labels$V2)

names(data) <- gsub("-", "", names(data))
names(data) <- gsub("\\()", "", names(data))
names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^f", "Frequency", names(data))

tidy_data <- data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

write.table(tidy_data, "tidy_dataset.txt", row.names = FALSE)
