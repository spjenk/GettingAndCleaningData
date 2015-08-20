# GettingAndCleaningData
Coursera Getting and Cleaning Data Course project

## Contents 
* run_analysis.R: R Script that process Samsung activity data into a tidy data set
* Readme.md: Details on the content for the course project and instructions
* codebook.md: Code Book that describes the variables and summaries calculated


## run_analysis.R
### Requirements
The R working directory should be set to the run_analysis.R source file location

The following files are expected in the working directory

 * UCI HAR Dataset/train/X_train.txt
 * UCI HAR Dataset/test/X_test.txt
 * UCI HAR Dataset/train/y_train.txt
 * UCI HAR Dataset/test/y_test.txt
 * UCI HAR Dataset/features.txt
 * UCI HAR Dataset/activity_labels.txt

### How the script works 

__Step 1: Read and merge__

Read in the training and test sets and merge to create one data set

__Step 2: Apply column names__ 

Read in the features.txt file and apply it as the the column names for the dataset

__Step 3: set descriptive activity names__ 

Read in activity labels and replace the description of the activity name over the matching column values (i.e. 1 - 6)

__Step 4: Create tidy dataset__ 

Using dplyr, summarise each column with the mean of all values grouping by the Activity

__Step 5: Write tidy tidy dataset to file__

Write the tidy dataset out as a txt file for submission

