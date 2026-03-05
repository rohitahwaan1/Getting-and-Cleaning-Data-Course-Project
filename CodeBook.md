# CodeBook

## Dataset

Human Activity Recognition Using Smartphones Dataset

## Description

This project processes the UCI HAR dataset and produces a tidy dataset containing the average of each variable for each activity and each subject.

## Variables

### Subject

ID of the participant (1–30)

### Activity

Type of activity performed:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Measurements

Measurements are derived from smartphone accelerometer and gyroscope signals.

Variables include:

* TimeBodyAccMeanX
* TimeBodyAccMeanY
* TimeBodyAccMeanZ
* TimeBodyAccStdX
* TimeBodyAccStdY
* TimeBodyAccStdZ
* FrequencyBodyAccMeanX
* FrequencyBodyAccMeanY
* FrequencyBodyAccMeanZ
* FrequencyBodyAccStdX
* FrequencyBodyAccStdY
* FrequencyBodyAccStdZ

## Data Processing Steps

1. Merge training and test datasets
2. Extract mean and standard deviation measurements
3. Apply descriptive activity names
4. Label variables with descriptive names
5. Create tidy dataset with the average of each variable for each activity and subject
