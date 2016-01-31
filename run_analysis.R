#Make sure the necessary libraries are loaded
library(dplyr)
library(tidyr)
#Set the working directory correctly
setwd("~/Desktop/R Projects/Coursera/Getting and Cleaning Data/CourseProject/UCI HAR Dataset")
list.files()

# Read in the features file to get the names of the 561 variables
# Create a vector with the 561 names of the variables (fNames)
featureText <- read.table(file="features.txt")
fNames <- as.character(featureText[,2])

# Remove unnecessary characters from the variables we are ultimately interested in....
# Each variable is named for the measurement.
# A capital M indicates a Mean measurement
# A capital S indicated a std dev measurement
# If there is a capital X,Y, or Z it indicated a measuremt made along the three axis
# Other varialbe names (max, min etc.) were not modified as these were being dropped
# Only the 66 variable I am keeping are renamed
fNames <- gsub("-mean\\(\\)-", "M",fNames)
fNames <- gsub("-std\\(\\)-", "S",fNames)
fNames <- gsub("-mean\\(\\)", "M",fNames)
fNames <- gsub("-std\\(\\)", "S",fNames)


# read in the test data sets (both tables have 2947 rows)
# -- xTest contains the observations for 561 variables (varialbe names in fNames)
# -- yTest contains the code for the activity corresponding to each of the 2947 observations
xTest <- read.table( file="./test/X_test.txt")
yTest <- read.table( file="./test/y_test.txt")

# read in the train data sets (both tables have 7352 rows)
# -- xTrain contains the observations for 561 variables (varialbe names in fNames)
# -- yTrain contains the code for the activity corresponding to each of the 7532 observations
xTrain <- read.table( file="./train/X_train.txt")
yTrain <- read.table( file="./train/y_train.txt")

# Apply the appropriate column names the 561 variables based on the features.txt file
# do this for both Test and Train using the fNAmes vector repared above
colnames(xTest) <- fNames
colnames(xTrain) <- fNames



# Select only the variables for the mean and std of each measurement - there should be 66
# -- there are 17 measurements
# -- 8 of them have X,Y, and Z components for a total of 48 variables
# -- 9 of them have one component for a total of 18 variables.
testSet <- xTest[,c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241,
                    253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)]
trainSet <- xTrain[,c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241,
                      253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)]


# Read in activity labels and name the columns Activty Code and Activity Name
activityLabels <- read.table(file="activity_labels.txt")
colnames(activityLabels) <- c("ActivityCode", "ActivityName")

# add activity to the test set and the train set.  Name the yTest and yTrain variables ActivityCode
# -- merge the yTest and yTrain files with the test descriptions of the activity
# -- then bind the the test and train dataset - adding the Activity Code and Activity Name as a variable
colnames(yTest) <- c("ActivityCode")
yTest <- merge (yTest, activityLabels, by.x="ActivityCode", sort=FALSE)
colnames(yTrain) <- c("ActivityCode")
yTrain <- merge (yTrain, activityLabels, by.x="ActivityCode", sort= FALSE)

testSet <- cbind(yTest, testSet)
trainSet <- cbind(yTrain, trainSet)

# Read in the test and train subject files 
# -- They contain one variable, the subject number for each observation
# -- label the variable SubjectCode and add as a variable to the test and train datasets
testSubjects <- read.table( file="./test/subject_test.txt")
trainSubjects <- read.table( file="./train/subject_train.txt")
colnames(testSubjects) <- c("SubjectCode")
colnames(trainSubjects) <- c("SubjectCode")
testSet <- cbind(testSubjects, testSet)
trainSet <- cbind(trainSubjects, trainSet)

# Finally.....
# Merge the test data and the train data together  creating one final set with 
# -- 69 variables and 10,299 observations
finalSet <- merge(testSet, trainSet, sort=FALSE, all=TRUE)

# Drop the ActivityCode variable as it is redundant with the ActivityName varialbe and no longer needed
finalSet <- select (finalSet, -ActivityCode)

## save the finalSet data set for use later.
write.table(finalSet, file="finalset.txt",append=FALSE,quote=TRUE,sep=",", 
            eol="\n",na="NA",dec=".",row.names=FALSE, col.names=TRUE,
            qmethod=c("escape","double"), fileEncoding="")


## now create a summary dataset that contains the average for each variable groups by activity and subjectff

summarySet <- group_by(finalSet, SubjectCode, ActivityName) %>%
              summarize(
                 tBodyAccMX = mean( tBodyAccMX ),
                 tBodyAccMY = mean(tBodyAccMY ),
                 tBodyAccMZ = mean(tBodyAccMZ ),
                 tBodyAccSX = mean(tBodyAccSX ),
                 tBodyAccSY  = mean(tBodyAccSY   ),
                 tBodyAccSZ = mean(tBodyAccSZ ),
                 tGravityAccMX = mean(tGravityAccMX ),
                 tGravityAccMY = mean(tGravityAccMY ),
                 tGravityAccMZ = mean(tGravityAccMZ ),
                 tGravityAccSX = mean(tGravityAccSX ),
                 tGravityAccSY = mean(tGravityAccSY ),
                 tGravityAccSZ = mean(tGravityAccSZ ),
                 tBodyAccJerkMX = mean(tBodyAccJerkMX ),
                 tBodyAccJerkMY = mean(tBodyAccJerkMY ),
                 tBodyAccJerkMZ = mean(tBodyAccJerkMZ ),
                 tBodyAccJerkSX = mean(tBodyAccJerkSX ),
                 tBodyAccJerkSY = mean(tBodyAccJerkSY ),
                 tBodyAccJerkSZ = mean(tBodyAccJerkSZ ),
                 tBodyGyroMX = mean(tBodyGyroMX ),
                 tBodyGyroMY = mean(tBodyGyroMY ),
                 tBodyGyroMZ = mean(tBodyGyroMZ ),
                 tBodyGyroSX = mean(tBodyGyroSX ),
                 tBodyGyroSY = mean(tBodyGyroSY ),
                 tBodyGyroSZ = mean(tBodyGyroSZ ),
                 tBodyGyroJerkMX = mean(tBodyGyroJerkMX ),
                 tBodyGyroJerkMY = mean(tBodyGyroJerkMY ),
                 tBodyGyroJerkMZ = mean(tBodyGyroJerkMZ ),
                 tBodyGyroJerkSX = mean(tBodyGyroJerkSX ),
                 tBodyGyroJerkSY = mean(tBodyGyroJerkSY ),
                 tBodyGyroJerkSZ = mean(tBodyGyroJerkSZ ),
                 tBodyAccMagM = mean(tBodyAccMagM ),
                 tBodyAccMagS = mean(tBodyAccMagS ),
                 tGravityAccMagM = mean(tGravityAccMagM ),
                 tGravityAccMagS = mean(tGravityAccMagS ),
                 tBodyAccJerkMagM = mean(tBodyAccJerkMagM ),
                 tBodyAccJerkMagS = mean(tBodyAccJerkMagS ),
                 tBodyGyroMagM = mean(tBodyGyroMagM ),
                 tBodyGyroMagS = mean(tBodyGyroMagS ),
                 tBodyGyroJerkMagM = mean(tBodyGyroJerkMagM ),
                 tBodyGyroJerkMagS = mean(tBodyGyroJerkMagS ),
                 fBodyAccMX = mean(fBodyAccMX ),
                 fBodyAccMY = mean(fBodyAccMY ),
                 fBodyAccMZ = mean(fBodyAccMZ ),
                 fBodyAccSX = mean(fBodyAccSX ),
                 fBodyAccSY = mean(fBodyAccSY ),
                 fBodyAccSZ = mean(fBodyAccSZ ),
                 fBodyAccJerkMX = mean(fBodyAccJerkMX ),
                 fBodyAccJerkMY = mean(fBodyAccJerkMY ),
                 fBodyAccJerkMZ = mean(fBodyAccJerkMZ ),
                 fBodyAccJerkSX = mean(fBodyAccJerkSX ),
                 fBodyAccJerkSY = mean(fBodyAccJerkSY ),
                 fBodyAccJerkSZ = mean(fBodyAccJerkSZ ),
                 fBodyGyroMX = mean(fBodyGyroMX ),
                 fBodyGyroMY = mean(fBodyGyroMY ),
                 fBodyGyroMZ = mean(fBodyGyroMZ ),
                 fBodyGyroSX = mean(fBodyGyroSX ),
                 fBodyGyroSY = mean(fBodyGyroSY ),
                 fBodyGyroSZ = mean(fBodyGyroSZ ),
                 fBodyAccMagM = mean(fBodyAccMagM ),
                 fBodyAccMagS = mean(fBodyAccMagS ),
                 fBodyBodyAccJerkMagM = mean(fBodyBodyAccJerkMagM ),
                 fBodyBodyAccJerkMagS = mean(fBodyBodyAccJerkMagS ),
                 fBodyBodyGyroMagM = mean(fBodyBodyGyroMagM ),
                 fBodyBodyGyroMagS = mean(fBodyBodyGyroMagS ),
                 fBodyBodyGyroJerkMagM = mean(fBodyBodyGyroJerkMagM ),
                 fBodyBodyGyroJerkMagS = mean(fBodyBodyGyroJerkMagS )
)

#Save the summarySet for later use
write.table(summarySet, file="summaryset.txt",append=FALSE,quote=TRUE,sep=",", 
            eol="\n",na="NA",dec=".",row.names=FALSE, col.names=TRUE,
            qmethod=c("escape","double"), fileEncoding="")

