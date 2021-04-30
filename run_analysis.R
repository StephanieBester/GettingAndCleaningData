
#Getting and cleaning data----
setwd("Your WD")

#import the subject files
train_subject <- read.table("train/subject_train.txt",header = FALSE)
test_subject <- read.table("test/subject_test.txt",header = FALSE)

#rename the column in the subject file to something meaningful
names(train_subject)[names(train_subject) == "V1"] <- "Subject"
names(test_subject)[names(test_subject) == "V1"] <- "Subject"

#import the training files
train_set <- read.table("train/X_train.txt",header = FALSE)
train_labels <- read.table("train/Y_train.txt",header = FALSE)

#import the test files
test_set <- read.table("test/X_test.txt",header = FALSE)
test_labels <- read.table("test/Y_test.txt",header = FALSE)

#import activity names
activitynames <- read.table("activity_labels.txt",header = FALSE)

#merge the activity names and labels
train_labels <- merge(train_labels,activitynames,sort = FALSE)
test_labels <- merge(test_labels,activitynames,sort = FALSE)

#rename the column in the label files
names(train_labels)[names(train_labels) == "V2"] <- "Activity_label"
names(test_labels)[names(test_labels) == "V2"] <- "Activity_label"

#import the features file
headings <- read.table("features.txt",header = FALSE)

#keep only the column with the headings
headings <- headings[,2]

#add headings to the train and test sets
colnames(train_set) <- headings
colnames(test_set) <- headings

#put the headings containing mean() and std() in a vector
keepheadings <- sort(c(grep("mean()",headings,fixed = TRUE), grep("std()",headings,fixed = TRUE)))

#on the train and test set, only keep the headings ontaining mean() and std() in a vector
train_set <- train_set[,keepheadings]
test_set <- test_set[,keepheadings]

#bind the test and lables together
train <- cbind(train_subject, train_labels, train_set)
test <- cbind(test_subject, test_labels, test_set)

#bind the test and training set into 1
combineddata <- rbind(train,test)

#remove 2nd column called V1
combineddata <- combineddata[,-2]

#Summarising in a tidy dataset----
library(dplyr)
Tidydata <- summarise_all(group_by(combineddata,Subject,Activity_label),mean)

