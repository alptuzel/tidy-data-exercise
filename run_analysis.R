
library(plyr)
library(dplyr)

### For the coursera tidy data assignment


## First read the train data set by creating three DFs for
## observations, corresponding activity types and 
## corresponding subject ids

# setwd("~/tidy-data-exercise")

train_set <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")

train_labels <-  read.table("./UCI HAR Dataset/train/y_train.txt", sep="")

train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="")

## Then do the same for test data set 

test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")

test_labels <-  read.table("./UCI HAR Dataset/test/y_test.txt", sep="")

test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")


## Concatenate two DFs on top of each other for each data set. Order is important!
## Test data is added after train data

merged_set <- rbind(train_set,test_set)

merged_labels <- rbind(train_labels,test_labels)

merged_subjects <- rbind(train_subjects,test_subjects)

## Set the colunm names to merged set. The names are gathered from feature.txt
## Since it has the feature vector's variables.

feature_keys <- read.table("./UCI HAR Dataset/features.txt", sep="")

colnames(merged_set) <- make.names( as.character(feature_keys$V2), unique=TRUE)


## Select only the columns which has mean and std in it.
## Use select from dplyr package

merged_set_mean_std <- select(merged_set, contains("mean"), contains("std") )

## Read activity labels

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="")

## Create a factor for merged label data. Labels taken from activity labels file.

merged_labels<-mutate(merged_labels ,activity_name = 
                        factor( merged_labels$V1 , labels = activity_labels$V2))


## Make clear variable names by renaming columns
## Grep used to rename column names which has 2 or more "." with just 1 "."

colnames(merged_labels)[1] <- "Activity.Type"

colnames(merged_labels)[2] <- "Activity.Name"


colnames(merged_set_mean_std) <- sub("\\.{2,}", "\\.", colnames(merged_set_mean_std))



### Add new columns to our date set with Activity name and Subject Ids

merged_set_mean_std <- mutate( merged_set_mean_std , 
                                   Subject.ID= merged_subjects$V1)


merged_set_mean_std <- mutate( merged_set_mean_std , 
                               Activity= merged_labels$Activity.Name)


## Make "group by" to be able to use summarise function

merged_set_ms_group <- group_by(merged_set_mean_std, Activity, Subject.ID )



## Summarise data with mean function, it is used with  grouped columns

my_tidy_data<- summarise_all(merged_set_ms_group, funs (mean) )


## Write final data set to a CSV

write.csv(my_tidy_data,"my_tidy_data.csv")


