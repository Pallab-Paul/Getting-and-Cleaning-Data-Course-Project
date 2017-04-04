# Getting-and-Cleaning-Data-Course-Project
# Overview:
This project is done for the Getting and Cleaning Data Coursera course. The purpose of this project is to generate a tidy data set with the average of each variable for each activity and each subject generated from the input training, testing, features and activity datasets.

# Project Summary:
The R script run_analysis developed as part of this project does the following:
1.	Downloads the dataset and unzip it
2.	Loads the training and test datasets into data tables
3.	Loads the activity and feature info into data tables
4.	Merges testing, training, features, and activity data sets into one single dataset
5.	Create the mean and standard deviation dataset from the master merged dataset
6.	Attach activity names in the mean and standard deviation dataset
7.	Creates the tidy dataset from the already created mean and standard deviation dataset. The tidy dataset is consists of the average value of each variable for each subject and activity pair
8.	Finally create the output text file for the tidy dataset named as ProjectTidyDataset.txt
