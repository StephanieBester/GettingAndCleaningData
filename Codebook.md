**Step 1: import the subject files**
Import the train and test subject files into 2 seperate dataframes.
The file names are:
subject_train.txt
subject_test.txt

**Step 2: rename both of the the subject files column name**
rename the column in the subject file to something meaningful, in this case "subject"

**Step 3: import the training set and labels files**
import the training set and labels files into 2 seperate dataframes. The file names are:
X_train.txt
Y_train.txt

**Step 4: import the test set and labels files**
import the test set and labels files into 2 seperate dataframes. The file names are:
X_test.txt
Y_test.txt

**Step 5: import activity names file**
The file name is:
activity_labels.txt

**Step 6: merge the activity names and labels. This makes the labels human readible. 
merge activity_labels.txt and Y_train.txt into a dataframe
merge activity_labels.txt and Y_test.txt into a dataframe

**Step 7: rename the column in the label files create in the previous step to something meaningful, in this case "Activity_label"

**Step 8: import the features file
The file name is:
features.txt

**Step 9: keep only the column with the headings of the features.txt file

**Step 10: add headings from the features file to the train and test sets from step 3 and 4

**Step 11: from the features.txt file imported in step 8, put the headings containing mean() and std() in a vector

**Step 12: on the train and test set (created in step 10), only keep the headings in the vector created in step 11

**Step 13: cbind the result from step 12 and step 6 together, 2 seperate dataframes for the training and test.

**Step 14: rbind the 2 dataframe produced in Step 13 together

**Step 15: remove 2nd column called V1 in the dataframe created in Step 14

**Step 16: Summarise the dataframe from Step 15 into a tidy dataset using dplyr summarise_all function

