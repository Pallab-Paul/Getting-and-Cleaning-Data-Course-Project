# Overview:
This project is done for the Getting and Cleaning Data Coursera course. The purpose of this project is to generate a tidy data set with the average of each variable for each activity and each subject generated from the input training, testing, features and activity datasets.

# Input Data:
The input data source is available in the following location
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The input dataset contains the following data files:
1. 'features_info.txt': Shows information about the variables used on the feature vector.
2. 'features.txt': List of all features.
3. 'activity_labels.txt': Links the class labels with their activity name.
4. 'train/X_train.txt': Training set.
5. 'train/y_train.txt': Training labels.
6. 'test/X_test.txt': Test set.
7. 'test/y_test.txt': Test labels.

# Run_Analysis R Script Logic:
The R script run_analysis developed as part of this project does the following:
1.	Download the File
2.	Unzip the file
3.	Read Training Data
4.	Read Testing Data
5.	Read Feature vector
6.	Read Activity Labels
7.	Assign proper column Names to training and testing data tables from features, activity , and subject
8.	Merge All Data into One data table
9.	Create Mean and Standard Deviation column name vector to be used to select the mean and standard deviation from the master data table
10.	Select subset from the master data table using the Mean and Standard Deviation column vector created above
11.	Attach Activity name in the selected subset
12.	Create tidy data set grouped by subject id and activity id
13.	Write the tidy data set to “ProjectTidyDataset.txt” file

# Variables Used:
1. dt_x_train: data table to read x_train.txt
2. dt_y_train: data table to read y_train.txt
3. dt_subject_train: data table to read subject_train.txt
4. dt_x_test: data table to read x_test.txt
5. dt_y_test: data table to read y_test.txt
6. dt_subject_test: data table to read subject_test.txt
7. dt_features: data table to read features.txt
8. dt_activity: data table to read activity_labels.txt
9. dt_merge_train: merge all training files (x_train,y_train,subject_train)
10. dt_merge_test: merge all testing files (x_test,y_test,subject_test)
11. dt_final: merge dt_merge_train and dt_merge_test data table into one single data table
12. MeanSDVector: Column vector created to filter the columns ActivityId, SubjectId, mean, and std from merged data table dt_final
13. dt_mean_SD: subset from master data table dt_final
14. dt_tidy: tidy data set
