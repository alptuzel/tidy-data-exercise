

# tidy-data-exercise


# For coursera Course Project - Getting And Cleaning Data by JHU

The purpose of this file is to clarify the files used in this project and related repository: tidy-data-exercise

Files included:

- CodeBoook.md: Procedures the fetch the raw data and steps to make it tidy

- README.md: This file! Overall descriptions.

- my-tidy-data.txt: Resulting tidy data in txt.

- run_analysis.R: R script to make the raw file tidy. You can directly run this file to have the final csv file. Beware of the directory that it runs since it reads text files from speficif directories.

#Project Overview:

The raw data is gathered from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

"One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone."


#Project Goal

From the raw data to gather only variables which has mean and std results in it and then summarize these results grouped by Subject Id and Activity Name


