# Codeboook for "Getting and Cleaning Data" Course Project

This is the codebook for this project. I'll quickly describe the variables, the data the transformations I did on the data as well.

The initial data for this project can be found [**in this website**](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#), it has many different variables but I'll only be describing the ones I used for this project.

### Variables from initial dataset

From the original dataset, I've used the following variables for this project:

1. *subject* - ID of person (from 1:30)
2. *activity* - ID of activity (from 1:6)
3. From the 561 variables available in the original dataset I've only used the **mean** and **standard deviation** of the following features:
   - tBodyAcc-(X/Y/Z for each axis)
   - tGravityAcc-(X/Y/Z for each axis)
   - tBodyAccJerk-(X/Y/Z for each axis)
   - tBodyGyro-(X/Y/Z for each axis)
   - tBodyGyroJerk-(X/Y/Z for each axis)
   - tBodyAccMag-(X/Y/Z for each axis)
   - tGravityAccMag-(X/Y/Z for each axis)
   - tBodyAccJerkMag-(X/Y/Z for each axis)
   - tBodyGyroMag-(X/Y/Z for each axis)
   - tBodyGyroJerkMag-(X/Y/Z for each axis)
   - fBodyAcc-(X/Y/Z for each axis)
   - fBodyAccJerk-(X/Y/Z for each axis)
   - fBodyGyro-(X/Y/Z for each axis)
   - fBodyAccMag
   - fBodyBodyAccJerkMag
   - fBodyBodyGyroMag
   - fBodyBodyGyroJerkMag
   
   
### New variables created

 1. Created an ***activitylabel*** variable - factor variable describing the activities with the following levels: *WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*
 2. Created and ***subject*** variable - integer variable in which each number relates to a specific individual that participated in the test (from 1 to 30)