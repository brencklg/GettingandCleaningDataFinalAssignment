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


# 33 measurements….  Mean and std → 66 variables

1.	fBodyAcc-mean()-X
2.	fBodyAcc-mean()-Y
3.	fBodyAcc-mean()-Z
4.	fBodyAcc-std()-X
5.	fBodyAcc-std()-Y
6.	fBodyAcc-std()-Z
7.	fBodyAccJerk-mean()-X
8.	fBodyAccJerk-mean()-Y
9.	fBodyAccJerk-mean()-Z
10.	fBodyAccJerk-std()-X
11.	fBodyAccJerk-std()-Y
12.	fBodyAccJerk-std()-Z
13.	fBodyAccMag-mean()
14.	fBodyAccMag-std()
15.	fBodyBodyAccJerkMag-mean()
16.	fBodyBodyAccJerkMag-std()
17.	fBodyBodyGyroJerkMag-mean()
18.	fBodyBodyGyroJerkMag-std()
19.	fBodyBodyGyroMag-mean()
20.	fBodyBodyGyroMag-std()
21.	fBodyGyro-mean()-X
22.	fBodyGyro-mean()-Y
23.	fBodyGyro-mean()-Z
24.	fBodyGyro-std()-X
25.	fBodyGyro-std()-Y
26.	fBodyGyro-std()-Z
27.	tBodyAcc-mean()-X
28.	tBodyAcc-mean()-Y
29.	tBodyAcc-mean()-Z
30.	tBodyAcc-std()-X
31.	tBodyAcc-std()-Y
32.	tBodyAcc-std()-Z
33.	tBodyAccJerk-mean()-X
34.	tBodyAccJerk-mean()-Y
35.	tBodyAccJerk-mean()-Z
36.	tBodyAccJerk-std()-X
37.	tBodyAccJerk-std()-Y
38.	tBodyAccJerk-std()-Z
39.	tBodyAccJerkMag-mean()
40.	tBodyAccJerkMag-std()
41.	tBodyAccMag-mean()
42.	tBodyAccMag-std()
43.	tBodyGyro-mean()-X
44.	tBodyGyro-mean()-Y
45.	tBodyGyro-mean()-Z
46.	tBodyGyro-std()-X
47.	tBodyGyro-std()-Y
48.	tBodyGyro-std()-Z
49.	tBodyGyroJerk-mean()-X
50.	tBodyGyroJerk-mean()-Y
51.	tBodyGyroJerk-mean()-Z
52.	tBodyGyroJerk-std()-X
53.	tBodyGyroJerk-std()-Y
54.	tBodyGyroJerk-std()-Z
55.	tBodyGyroJerkMag-mean()
56.	tBodyGyroJerkMag-std()
57.	tBodyGyroMag-mean()
58.	tBodyGyroMag-std()
59.	tGravityAcc-mean()-X
60.	tGravityAcc-mean()-Y
61.	tGravityAcc-mean()-Z
62.	tGravityAcc-std()-X
63.	tGravityAcc-std()-Y
64.	tGravityAcc-std()-Z
65.	tGravityAccMag-mean()
66.	tGravityAccMag-std()

# The strategy of the program is as follows:
1.	Read in the features file and create a vector with variable names that make sense
2.	Read in the two Test data files and the two Train data files
3.	Add the variable names to the columns and delete the columns we don’t want
4.	Read in the text names for the activities the go with the Activity Code
5.	Add the character names to the “y” files that have Activity Code in them
6.	Add the Activity Code and Activity Name to the Test and Train dataframes
7.	Read in the subject files and add the subject code to the Test and Train dataframes
8.	Merge the Test and Train datafrmes together to create a single datframe
9.	Drop the ActivityCode variable as it is redundant with the Activity Name variable.  I can always put it back later if I need it.
10.	I now have a single dataframe, “finalSet”  with 10,299 observations and 69 variables
a.	SubjectCode and ActivityName
b.	66 variables coinciding with the mean and std measurements
11.	Create another dataframe, “summarySet” that provides averages of the mean and std measurements grouped by subject and activity.  
a.	This data set has 40 observations of the 68 variables
i.	SubjectCode and ActivityName
ii.	The average for each of the 66 mean and std variables

