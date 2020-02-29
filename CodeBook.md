This project has been completed for the Getting and Cleaning Data course
offered by Johns Hopkins University through Coursera. The original
publication citation for the data is: Davide Anguita, Alessandro Ghio
Luca Oneto, Xavier Parra, and Jorge L. Reyes-Ortiz. Human Activity
Recognition on Smartphones using a Multiclass Hardware-Friendly Support
Vector Machine. International Workshop of Ambient Assisted Living (IWAAL
2012). VItoria-Gastiez, Spain. Dec 2012.

The purpose of this project was to load and merge the data files
produced by the study, conduct a series of assigned manipulations on the
data, and produce a ‘tidy’ data file summarizing the study data. The
study description and data are available here:

*<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" class="uri">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>
*<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

The downloaded Dataset.zip file contained the following data files used
in this assignment:

1.  README.txt
2.  train/X\_train.txt - Training data set.
3.  train/y\_train.txt - Training data set labels.
4.  test/X\_test.txt - Test data set.
5.  test/y\_test.txt - Test data set labels.
6.  features\_info.txt - Information about the ‘features’ variables.
7.  features.txt - List of ‘features’ variables.
8.  activity\_labels.txt - Links between class labels and activity
    names.

THe variables used and summarized in this study were updated with
descriptive names and include:

subject

activity

TimeBodyAcceleration-Mean()-X-Axis

TimeBodyAcceleration-Mean()-Y-Axis

TimeBodyAcceleration-Mean()-Z-Axis

TimeBodyAcceleration-StdDev()-X-Axis

TimeBodyAcceleration-StdDev()-Y-Axis

TimeBodyAcceleration-StdDev()-Z-Axis

TimeGravityAcceleration-Mean()-X-Axis

TimeGravityAcceleration-Mean()-Y-Axis

TimeGravityAcceleration-Mean()-Z-Axis

TimeGravityAcceleration-StdDev()-X-Axis

TimeGravityAcceleration-StdDev()-Y-Axis

TimeGravityAcceleration-StdDev()-Z-Axis

TimeBodyAccelerationJerk-Mean()-X-Axis

TimeBodyAccelerationJerk-Mean()-Y-Axis

TimeBodyAccelerationJerk-Mean()-Z-Axis

TimeBodyAccelerationJerk-StdDev()-X-Axis

TimeBodyAccelerationJerk-StdDev()-Y-Axis

TimeBodyAccelerationJerk-StdDev()-Z-Axis

TimeBodyAngular-Mean()-X-Axis

TimeBodyAngular-Mean()-Y-Axis

TimeBodyAngular-Mean()-Z-Axis

TimeBodyAngular-StdDev()-X-Axis

TimeBodyAngular-StdDev()-Y-Axis

TimeBodyAngular-StdDev()-Z-Axis

TimeBodyAngularJerk-Mean()-X-Axis

TimeBodyAngularJerk-Mean()-Y-Axis

TimeBodyAngularJerk-Mean()-Z-Axis

TimeBodyAngularJerk-StdDev()-X-Axis

TimeBodyAngularJerk-StdDev()-Y-Axis

TimeBodyAngularJerk-StdDev()-Z-Axis

TimeBodyAccelerationMagnitude-Mean()

TimeBodyAccelerationMagnitude-StdDev()

TimeGravityAccelerationMagnitude-Mean()

TimeGravityAccelerationMagnitude-StdDev()

TimeBodyAccelerationJerkMagnitude-Mean()

TimeBodyAccelerationJerkMagnitude-StdDev()

TimeBodyAngularMagnitude-Mean()

TimeBodyAngularMagnitude-StdDev()

TimeBodyAngularJerkMagnitude-Mean()

TimeBodyAngularJerkMagnitude-StdDev()

FrequencyBodyAcceleration-Mean()-X-Axis

FrequencyBodyAcceleration-Mean()-Y-Axis

FrequencyBodyAcceleration-Mean()-Z-Axis

FrequencyBodyAcceleration-StdDev()-X-Axis

FrequencyBodyAcceleration-StdDev()-Y-Axis

FrequencyBodyAcceleration-StdDev()-Z-Axis

FrequencyBodyAccelerationJerk-Mean()-X-Axis

FrequencyBodyAccelerationJerk-Mean()-Y-Axis

FrequencyBodyAccelerationJerk-Mean()-Z-Axis

FrequencyBodyAccelerationJerk-StdDev()-X-Axis

FrequencyBodyAccelerationJerk-StdDev()-Y-Axis

FrequencyBodyAccelerationJerk-StdDev()-Z-Axis

FrequencyBodyAngular-Mean()-X-Axis

FrequencyBodyAngular-Mean()-Y-Axis

FrequencyBodyAngular-Mean()-Z-Axis

FrequencyBodyAngular-StdDev()-X-Axis

FrequencyBodyAngular-StdDev()-Y-Axis

FrequencyBodyAngular-StdDev()-Z-Axis

FrequencyBodyAccelerationMagnitude-Mean()

FrequencyBodyAccelerationMagnitude-StdDev()

FrequencyBodyAccelerationJerkMagnitude-Mean()

FrequencyBodyAccelerationJerkMagnitude-StdDev()

FrequencyBodyAngularMagnitude-Mean()

FrequencyBodyAngularMagnitude-StdDev()

FrequencyBodyAngularJerkMagnitude-Mean()

FrequencyBodyAngularJerkMagnitude-StdDev()
