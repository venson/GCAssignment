# Getting and Cleaning Data Assignment

## file

- 'run_analysis.R' the script for cleaning the data as assignment required
- 'step4.txt' the output file for step4
- 'step5.txt' the output file for step5
- "assignment_features.txt" the column name of the output files

## script describing

### read data file

1. "X_test.txt","X_train.txt" are the main datasets providing the major dataset,
2. "y_test.txt", "y_train.txt" are the number of 30 volunteers corresponding to each row of the main data set
3. "activity_labels.txt" provide the relationship between activity and the number from "subject_test.txt" and "subject_train.txt"
4. "features.txt" provide the column name for the data from "X_test.txt" and "X_train.txt"

### tiding data

1. As required, give the data readable names.
2. Select mean and standard deviation for each measurement by select() grep() function and regular expression.
3. Merge data together, and adding subject, activity ,data_source columns to fill the essential data.
4. Using group_by() and summarise() function to get the data require by step5.
