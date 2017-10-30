
Steps to reproduce the tidy data from the raw data.

Prerequisites: This project is run with RStudio using R version 3.41 in x86_64-pc-linux-gnu platform. R packages dplyr and plyr must be installed.

1- Download the zip file and extract it to your project folder:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2- In your Project Folder verify that there is an folder named: UCI HAR Dataset

3- Place run_analysis.R to your project folder.

4- Run the script with source("run_analysis.R") and verify the resulting CSV file. Beware! It will take some time to finish it since it reads large files. In the tested environment it took more than 10 seconds with 1GB ram.


Steps performed inside run_analysis.R

1- Read the train and test data set. 

Both sets consist of 3 files: 

* For training: X_train.txt, y_train.txt and subject_train.txt
* For testing: X_test.txt, y_test.txt and subject_test.txt

X_train and X_test are the big test data. Each row consists of 561 columns which are named in feature.txt
Since they consist data from different subjects they are added together to from 1 data set called: "merged_set" data frame:

2- Concatenate two DFs on top of each other for each data set.

3- Set the colunm names to the merged set. The names are gathered from feature.txt since it has the feature vector's variables. 561 names are set as column names in merged_set

4- Select only the columns which has mean and std in it and form and data frame merged_set_mean_std

5-  Read activity labels: 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

6- Create a factor for merged label data. Labels taken from activity labels file.

7-  Make clear variable names by renaming columns. Grep used to rename column names which has 2 or more "." with just 1 "."

8- Add new columns to our date set with Activity name and Subject Ids. 

Subject IDs vary from 1 to 30.

Activity names are read in step 5 above.

9- Make "group by"  in dplyr package to be able to use summarise function in the final data.

10- Summarise data with mean function. In the end, the variables which has "mean" and "std" in it are grouped by Subject Id and Activiy Name and their average is calculated.

11- Write the data set to a txt file.
