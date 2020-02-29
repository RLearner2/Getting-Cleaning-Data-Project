##Read the data from the URL, save as a local file, and unzip
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "Dataset.zip")
unzip("Dataset.zip")
##
##Read Data Tables from the unzipped data
##
subjecttrain <-read.table("./UCI HAR Dataset/train/subject_train.txt",
                                    col.names = c("subject"))
subjectxtrain <-read.table("./UCI HAR Dataset/train/X_train.txt")
subjectytrain <-read.table("./UCI HAR Dataset/train/y_train.txt",
                                    col.names = c("activity"))
subjecttest <-read.table("./UCI HAR Dataset/test/subject_test.txt",
                                    col.names = c("subject"))
subjectxtest <-read.table("./UCI HAR Dataset/test/X_test.txt")
subjectytest <-read.table("./UCI HAR Dataset/test/y_test.txt",
                                    col.names = c("activity"))
##
##Create combined data file from subject, feature, and measurement data files
##
train <-cbind(subjecttrain, subjectytrain, subjectxtrain)
test <-cbind(subjecttest, subjectytest, subjectxtest)
combineddata = rbind(test, train)
##
##Read data labels for activity labels and activity features
##
activitylabels <-fread("./UCI HAR Dataset/activity_labels.txt",
       select = c(1, 2), col.names = c("activityid", "activityname"))
features <-read.table("./UCI HAR Dataset/features.txt",
                                col.names = c("featureid", "featurename"))
features <- as.character(features[ ,2])  ##Make the featurename a string
##
##Make data label vectors
##This one is for use in the grep function
datalabels <- c("subject", "activityname", features)  
##
##Put data label vector on main data file
colnames(combineddata) <-c("subject", "activity", features)
##
##Merge the activity names to the main data file to use as factor variable 
## instead of activity integer codes, and sort the columns to improve readability
## Use suppressWarnings because the warnings are needless here
##
suppressWarnings(labeleddata <- merge(combineddata, activitylabels, by.x="activity", by.y="activityid", all = TRUE))
labeledsorteddata <-labeleddata[c(2, 564, 3:563, 1)]
labeledsorteddata = labeledsorteddata[,-564]
##
##Indicate which set of variables to filter/keep, and then assign the reduced data to a new file
##
keepreduced <- grep("subject|activityname|mean\\(|std\\(",datalabels, value = FALSE)
datameanstd <-labeledsorteddata[,keepreduced]
##
##Delete some no longer needed files and free some space for processing.  Tidy Computing!
##
rm(fileURL, test, train, subjecttest, subjecttrain, subjectxtest, subjectxtrain, subjectytest,
   subjectytrain, labeleddata, labeledsorteddata, combineddata)
##
##Create the Subject and Activity factors to compute the averages in the later step
##
datameanstd$subject <- as.factor(datameanstd$subject)
datameanstd$activityname <- as.factor(datameanstd$activityname)
##
##Reshape the data set into a 'tidy' format
##
datameanstd <-melt(datameanstd, id = c("subject", "activityname"))
tidydata = dcast(datameanstd, subject + activityname ~variable, mean)
##
##Label the data with desctiptive variable names
##
names(tidydata) <- gsub("activityname", "activity", names(tidydata))
names(tidydata) <- gsub("BodyBody", "Body", names(tidydata))
names(tidydata) <- gsub("Acc", "Acceleration", names(tidydata))
names(tidydata) <- gsub("Mag", "Magnitude", names(tidydata))
names(tidydata) <- gsub("Gyro", "Angular", names(tidydata))
names(tidydata) <- gsub("^t", "Time", names(tidydata))
names(tidydata) <- gsub("^f", "Frequency", names(tidydata))
names(tidydata) <- gsub("std", "StdDev", names(tidydata))
names(tidydata) <- gsub("mean", "Mean", names(tidydata))
names(tidydata) <- gsub("-X", "-X-Axis", names(tidydata))
names(tidydata) <- gsub("-Y", "-Y-Axis", names(tidydata))
names(tidydata) <- gsub("-Z", "-Z-Axis", names(tidydata))

##Write final tidy data set
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)

