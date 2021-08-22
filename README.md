# Getting-and-Cleaning-Data-Course-Project

This is a project for a Coursera course on getting and cleaning data from by Johns Hopkins University
<https://www.coursera.org/learn/data-cleaning>

### Data used in the project

This R.script was invented to analyze the data from the [**UCI HAR Dataset**](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Obviously, it is supposed to work if that archive mentioned exists on the same working directory as the script.

The following files were used from the initial dataset:

- ***feature.txt*** - description of the features
- ***train/X_train.txt*** - measurements of the features in the train set
- ***test/X_test.txt*** - measurements of the features in the test set
- ***train/subject_train.text*** - subjects for the measurements in the train set
- ***test/subject_test.text*** - subjects for the measurements in the test set
- ***train/y_train.text*** - activity for each measurement in the train set
- ***test/y_test.text*** - activity for each measurement in the test set

### R.script steps

1. Firstly I began by reading the data into datasets variables for the features names, type of activities, train data and test data
2. Since the train and test data has no descriptions whatsoever I renamed the columns using the features dataset.
3. Adding two new variables in the end of the datasets, ***train*** and ***test***
        - One describing the ID activity in every row example in the dataset using the ***y_train*** and ***y_test*** vectors
        - Second variable linking each row with the correspondent individual using ***subject_train*** and ***subject_test*** vectors
4. Merging ***train*** and ***test*** datasets with *rbind*
5. Filtered the names variables I wanted to use in this project with *grep* function, and applied it to our merged dataset.
6. Add an ***activitylabel*** factor variable, to the dataset, which describes the type of activity of each example based on the activity ID
7. Melted the dataset considering the id.variables ***activitylabel*** and ***subject***
8. Used *dcast* function to portrait the final tidy_dataset using same id.variables as point 7
9. Finally writing down final file using *write.table*