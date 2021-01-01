library(dplyr)
# set file paht for read
x_testfile <- "UCI HAR Dataset/test/X_test.txt"
y_testfile <- "UCI HAR Dataset/test/y_test.txt"
sub_testfile <- "UCI HAR Dataset/test/subject_test.txt"
x_trainfile <- "UCI HAR Dataset/train/X_train.txt"
y_trainfile <- "UCI HAR Dataset/train/y_train.txt"
sub_trainfile <- "UCI HAR Dataset/train/subject_train.txt"
featuresfile <- "UCI HAR Dataset/features.txt"
activityfile <- "UCI HAR Dataset/activity_labels.txt"
# read data from test
x_test <- read.table(x_testfile)
y_test <- read.table(y_testfile)
x_train <- read.table(x_trainfile)
y_train <- read.table(y_trainfile)
subject_test <- read.table(sub_testfile)
subject_train <- read.table(sub_trainfile)
features <- read.table(featuresfile)
activity <- read.table(activityfile)
# set the names of data frame
names(x_test) <- features[, 2]
names(subject_test) <- "subject"
names(y_test) <- "activity"
names(x_train) <- features[, 2]
names(subject_train) <- "subject"
names(y_train) <- "activity"
# make activity name more readable
for (i in 1:6) {
  y_test[y_test[, 1] == i, 1] <- activity[i, 2]
  y_train[y_train[, 1] == i, 1] <- activity[i, 2]

}
#select std() and mean() from the test data
test_meanst <- select(x_test, grep("std\\(\\)|mean\\(\\)", features[, 2]))
#select std() and mean() from the train data
train_meanst <- select(x_train, grep("std\\(\\)|mean\\(\\)", features[, 2]))
# combine data together
test_data <- mutate(subject_test, y_test, data_source = "test", test_meanst)
train_data <- mutate(subject_train,
                     y_train,
                     data_source = "train",
                     train_meanst)
step4 <- rbind(test_data, train_data)
write.table(step4, "step4.txt", row.name = FALSE)


step5 <- step4 %>%
  group_by(subject, activity, data_source) %>%
  summarise(across(everything(), mean))
write.table(step5, "step5.txt", row.name = FALSE)
write.table(names(step5), "assignment_features.txt", row.name = FALSE)
