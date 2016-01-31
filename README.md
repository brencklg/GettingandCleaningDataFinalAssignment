# GettingandCleaningDataFinalAssignment

This is the final assignment for the Getting and Cleaning Data course.  The final code is in the file run_analysis.R
The thought process is described as follows

# First look at test subject and train subject files:

- Test subject has 2947 rows, and has 9 unique values: (2,4,9,10,12,13,18,20,24)
- Train subject has 7352 rows, and has 21 unique values: (1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30)
- So, of the 30 subjects, 9 (30%) are in the test set and 21 (70%) are in the train set
- There are 10,299 rows (observations?).  2947 (28.6%) are test rows, and 7,352 (71.4%) are train rows.
- X_test has 2947 rows and 561 variables
- Y_test has 2947 rows and 1 variable
- Y_test has 6 unique values: (1,2,3,4,5,6). I think they correspond to the 6 activities:
    1 – WALKING
    2 – WALKING UPSTAIRS
    3 – WALKING DOWNSTAIRS
    4 – SITTING
    5 – STANDING
    6 – LAYING
- The 561 variables in X_test correspond to the 561 variable labels as listed in features.txt

# The measurement variables are:

1.	tBodyAcc-XYZ
2.	tGravityAcc-XYZ
3.	tBodyAccJerk-XYZ
4.	tBodyGyro-XYZ
5.	tBodyGyroJerk-XYZ
6.	tBodyAccMag
7.	tGravityAccMag
8.	tBodyAccJerkMag
9.	tBodyGyroMag
10.	tBodyGyroJerkMag
11.	fBodyAcc-XYZ
12.	fBodyAccJerk-XYZ
13.	fBodyGyro-XYZ
14.	fBodyAccMag
15.	fBodyAccJerkMag
16.	fBodyGyroMag
17.	fBodyGyroJerkMag

### The variables that are followed with -XYZ are repeated three times, once for each dimension


# The strategy of the program is as follows:
1.	Read in the features file and create a vector with variable names that make sense
2.	Read in the two Test data files and the two Train data files
3.	Add the variable names to the columns and delete the columns we don’t want
4.	Read in the text names for the activities the go with the Activity Code
5.	Add the character names to the “y” files that have Activity Code in them
6.	Add the Activity Code to the Test and Train dataframes
7.	Read in the subject files and add the subject code to the Test and Train dataframes
8.	Merge the Test and Train datasets with the text names for activities
8.	Merge the Test and Train datafrmes together to create a single datframe
9.	Drop the ActivityCode variable as it is redundant with the Activity Name variable.  I can always put it back later if I need it.
10.	I now have a single dataframe, “finalSet”  with 10,299 observations and 68 variables
a.	SubjectCode and ActivityName
b.	66 variables coinciding with the mean and std measurements
11.	Create another dataframe, “summarySet” that provides averages of the mean and std measurements grouped by subject and activity.  
a.	This data set has 180 observations of the 68 variables
i.	SubjectCode and ActivityName
ii.	The average for each of the 66 mean and std variables

