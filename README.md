---
title: "README"
author: "ME!"
date: "06 01 2021"
output: html_document
---

# run_analysis.R description

## Merges the training and the test sets to create one data set

- read files from the "test" directory
- read the feature file from the main directory and use it to create a vector that
        holds column names for that data set
- set column names to the data set
- read the file of activities and save it to data frame
- read the file of subjects and save it to data frame
- use cbind to put all the data frames together (test_set)

- read files from the "train" directory
- use feature dataset, to give names to the columns of data frame
- read the file of activities and save it to data frame
- read the file of subjects and save it to data frame
- use cbind to put all the data frames together (train_set)

- use rbind to merge both data sets together (full_set)

- change class of the elements in the data set from string to numeric

## Uses descriptive activity names to name the activities in the data set

- read file "activity_labels.txt" to data frame, that hols corresponding between 
        names of activities and its numbers
- use this data frame to change activity values in full_set from numeric to descriptive names

## Extracts only the measurements on the mean and standard deviation for each measurement

- in names of columns of data set select one names that include "mean(" or "std("

- create data frame that include only necessary names and data from the full_set

- name it result_set

## From the first data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- for each unic combination of subject and activity extract subset of measurements

- count mean() for every values in set

- record results in a new data set

- use names of the first dataset to set names in the second dataset

## Record and return

- create text file for the second tidy data set

- return the first data set as script result


