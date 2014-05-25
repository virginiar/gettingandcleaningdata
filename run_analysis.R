# Download the file and unzip
if (!file.exists("project")) {
    dir.create("project")
}
setwd("project")

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="project.zip")

unzip("project.zip")

setwd("UCI HAR Dataset")

# 1. Merges the training and the tests sets to create on data set.

# a. Reading the activities and creating factor
activities <- read.table("activity_labels.txt", col.names=c("ActivityID","Activity"))

# b. Reading the features
features <- read.table("features.txt", col.names=c("FeatureID", "Feature"))

# c. Reading the activities files
ytest <- read.table("test/y_test.txt", col.names=c("ActivityID"))
ytrain <- read.table("train/y_train.txt", col.names=c("ActivityID"))

# d. Reading the subtject files
subjecttest <- read.table("test/subject_test.txt", col.names=c("SubjectID"))
subjecttrain <- read.table("train/subject_train.txt", col.names=c("SubjectID"))

# e. Reading the data files
xtest<- read.table("test/X_test.txt", col.names=features$Feature)
xtrain <- read.table("train/X_train.txt", col.names=features$Feature)

# f. Merging the activity, subject and data files
xtest$ActivityID <- ytest$ActivityID
xtest$SubjectID <- subjecttest$SubjectID
xtrain$ActivityID <- ytrain$ActivityID
xtrain$SubjectID <- subjecttrain$SubjectID

# g. Merging the data
datacomplete <- rbind(xtest, xtrain)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
columnselected <- grep("mean\\(\\)|std\\(\\)", names(datacomplete))
datasubset <- datacomplete[, columnselected]
datasubset$ActivityID <- datacomplete$ActivityID
datasubset$SubjectID <- datacomplete$SubjectID

# 3. Uses descriptive activity names to name the activities in the data set
activities$Activity <- tolower(activities$Activity)
activities$Activity <- gsub("_","",activities$Activity)
activities$Activity <- as.factor(activities$Activity)
data <- merge(datasubset, activities)
data$ActivityID <- NULL

# 4. Appropriately labels the data set with descriptive activity names. 
colnames <- names(data)
colnames <- gsub("\\.mean\\.+","Mean", colnames)
colnames <- gsub("\\.std\\.+", "Std", colnames)
names(data) <- colnames
setwd("project")
write.table(data, "projectData.txt")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)
datamelt <- melt(data, id.vars=c("Activity", "SubjectID"))
datacast <- dcast(datamelt, Activity + SubjectID ~ variable, mean)
write.table(datacast, "projectAverage.txt")
