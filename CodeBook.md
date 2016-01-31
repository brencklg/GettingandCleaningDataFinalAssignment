
# The data came from the following publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors 
or their institutions for its use or misuse. Any commercial use is prohibited.

# The original comments on the variables are as follows

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating 
the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Of the 561 variables, we only selected 66, corresponding to the mean and std of the accelerometer and gyroscope variables.

##The following are the variable naems in the summarySet file.
A capital M indicates a mean.  A capital S indicate the std. If there is an X, Y, or Z at the end it indicates that the value
is supplied for each three dimensional axis.

1.	tBodyAccMX
2.	tBodyAccMY
3.	tBodyAccMZ
4.	tBodyAccSX
5.	tBodyAccSY
6.	tBodyAccSZ
7.	tGravityAccMX
8.	tGravityAccMY
9.	tGravityAccMZ
10.	tGravityAccSX
11.	tGravityAccSY
12.	tGravityAccSZ
13.	tBodyAccJerkMX
14.	tBodyAccJerkMY
15.	tBodyAccJerkMZ 
16.	tBodyAccJerkSX 
17.	tBodyAccJerkSY
18.	tBodyAccJerkSZ 
19.	tBodyGyroMX 
20.	tBodyGyroMY 
21.	tBodyGyroMZ 
22.	tBodyGyroSX 
23.	tBodyGyroSY 
24.	tBodyGyroSZ 
25.	tBodyGyroJerkMX 
26.	tBodyGyroJerkMY 
27.	tBodyGyroJerkMZ 
28.	tBodyGyroJerkSX 
29.	tBodyGyroJerkSY
30.	tBodyGyroJerkSZ 
31.	tBodyAccMagM
32.	tBodyAccMagS
33.	tGravityAccMagM 
34.	tGravityAccMagS 
35.	tBodyAccJerkMagM
36.	tBodyAccJerkMagS
37.	tBodyGyroMagM
38.	tBodyGyroMagS 
39.	tBodyGyroJerkMagM
40.	tBodyGyroJerkMagS 
41.	fBodyAccMX 
42.	fBodyAccMY 
43.	fBodyAccMZ 
44.	fBodyAccSX 
45.	fBodyAccSY 
46.	fBodyAccSZ 
47.	fBodyAccJerkMX 
48.	fBodyAccJerkMY 
49.	fBodyAccJerkMZ
50.	fBodyAccJerkSX 
51.	fBodyAccJerkSY
52.	fBodyAccJerkSZ 
53.	fBodyGyroMX 
54.	fBodyGyroMY 
55.	fBodyGyroMZ 
56.	fBodyGyroSX 
57.	fBodyGyroSY 
58.	fBodyGyroSZ 
59.	fBodyAccMagM 
60.	fBodyAccMagS 
61.	fBodyBodyAccJerkMagM 
62.	fBodyBodyAccJerkMagS 
63.	fBodyBodyGyroMagM 
64.	fBodyBodyGyroMagS 
65.	fBodyBodyGyroJerkMagM 
66.	fBodyBodyGyroJerkMagS 



