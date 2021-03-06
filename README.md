The procedures to complete this data analysis project include:

Read the data from the following URL, save as a local file, and unzip
the data files:
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>"

The files extracted include: subject\_train.txt X\_train.txt
y\_train.txt subject\_test.txt X\_test.txt y\_test.txt
activity\_labels.txt features.txt

These files were combined to create one data file with subject, feature,
measurement data, and labels.

The data files contained far more variables than were used in this
project, so the grep function was used to filter the variables to
include just those containing means or standard deviations.

The subject and feature fields in the data file were converted from
variables to factors so that means could be computed o the basis of the
resulting factors.

The data was then reshaped to a tidy format and appended with
descriptive variable labels. The final data file was saved as
tidydata.txt and posted to Github.

The script for this project is:

```` markdown
```{r}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "Dataset.zip")
unzip("Dataset.zip")
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
train <-cbind(subjecttrain, subjectytrain, subjectxtrain)
test <-cbind(subjecttest, subjectytest, subjectxtest)
combineddata = rbind(test, train)
activitylabels <-fread("./UCI HAR Dataset/activity_labels.txt",
       select = c(1, 2), col.names = c("activityid", "activityname"))
features <-read.table("./UCI HAR Dataset/features.txt",
                                col.names = c("featureid", "featurename"))
features <- as.character(features[ ,2])  ##Make the featurename a string
datalabels <- c("subject", "activityname", features)  
colnames(combineddata) <-c("subject", "activity", features)
suppressWarnings(labeleddata <- merge(combineddata, activitylabels, by.x="activity", by.y="activityid", all = TRUE))
labeledsorteddata <-labeleddata[c(2, 564, 3:563, 1)]
labeledsorteddata = labeledsorteddata[,-564]
keepreduced <- grep("subject|activityname|mean\\(|std\\(",datalabels, value = FALSE)
datameanstd <-labeledsorteddata[,keepreduced]
rm(fileURL, test, train, subjecttest, subjecttrain, subjectxtest, subjectxtrain, subjectytest,
   subjectytrain, labeleddata, labeledsorteddata, combineddata)
datameanstd$subject <- as.factor(datameanstd$subject)
datameanstd$activityname <- as.factor(datameanstd$activityname)
datameanstd <-melt(datameanstd, id = c("subject", "activityname"))
tidydata = dcast(datameanstd, subject + activityname ~variable, mean)
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
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)
```
````
