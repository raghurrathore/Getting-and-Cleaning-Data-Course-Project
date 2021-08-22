# first, start by reading feature names and activity names
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# train data
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(train) <- features$V2  # renaming columns on train dataset
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
train$activity <- y_train$V1    # concatenating activity on train dataset
subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train$subject <- subjects_train$V1    # concatenating subject on train dataset


# do the exact same process above for the test dataset
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(test) <- features$V2
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
test$activity <- y_test$V1
subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test$subject <- subjects_test$V1

# merging both datasets (train and test) together
merged_dataset <- rbind(train, test)

# filtering the columns wanted for this project, mean and std deviation values, and obviously both ones that we created (activity and subject)
feature_names <- colnames(merged_dataset)
feature_names_filtered <- grep("mean\\(\\)|std\\(\\)|activity|subject", feature_names, value = T)
filtered_dataset <- merged_dataset[, feature_names_filtered]

# labeling the respect activity number in the dataset to their correspondent description
filtered_dataset$activitylabel <- factor(filtered_dataset$activity, 
                                         levels = c(1,2,3,4,5,6), 
                                         labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# creating an independent tidy data set with the average of each variable for each activity and each subject
library(reshape2)
aux_colnames = grep("std\\(\\)|mean\\(\\)", feature_names, value = T)
melted_dataset <-melt(filtered_dataset, id.vars = c('activitylabel', 'subject'), measure.vars = aux_colnames, variable.name = "measure")
tidy_dataset <- dcast(melted_dataset, activitylabel + subject ~ measure, mean)
write.table(tidy_dataset, file = "tidy_dataset.txt", row.names = F)
