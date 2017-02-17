#Coursera JHU Data Science Specialization Getting and Cleaning Data Course Project

##Introduction

This repo contains all the work for the course project for the third course in the Coursera Data Science specialization. The run_analysis.R file is the primary file. There is also a codebook included in markdown format.

##run_analysis.R

This is the primary file in this repo. It uses data from the UCI human activity recognition using smartphones dataset. In all, there are 6 datasets used. First, training and test sets are imported. Each is then merged with their respective id's (subjects in the study) and the response variable. Next the test and train datasets are then combined together (the data frame all). After this, appropriate column names are add to the all data frame and the response variable (activity) values are labeled with one of the six labels from the activity_labels dataset.

Only the features measuring the mean or standard deviation are kept. Finally, a final data set is created which takes the column average of the final feature set by subject and activity.

##Dependencies (i.e. data)

To use the run_analysis.R script you'll need to download the data. However, this is taken care of in the script so long as you set a valid working directory to save the corresponding zip file to.

##Output

run_analysis.R will create the all_tidy.txt file which is the final tidy data set.

##CodeBook

There is a code book included, CodeBook.md, explaing the variables in the final data set and any relevant particulars.
