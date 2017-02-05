# Download and extract data
if (!file.exists("dataset.zip")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, "dataset.zip")
}

if (!file.exists("UCI HAR Dataset/")) {
  unzip("dataset.zip")
}

# Read in features and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
features[, 2] <- as.character(features[, 2])
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[, 2] <- as.character(activityLabels[, 2])

# Extract only the measurements on the mean and standard deviation for each measurement
meanstd <- grep(".*mean.*|.*std.*", features[,2])
meanstd.names <- features[meanstd,2]
meanstd.names = gsub('-mean', 'Mean', meanstd.names)
meanstd.names = gsub('-std', 'Std', meanstd.names)

# Read in testing data
testX <- read.table("UCI HAR Dataset/test/X_test.txt")[meanstd]
testY <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
testingData <- cbind(testSubject, testY, testX)

# Read in training data
trainX <- read.table("UCI HAR Dataset/train/X_train.txt")[meanstd]
trainY <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainingData <- cbind(trainSubject, trainY, trainX)

mergeData <- rbind(trainingData, testingData)
colnames(mergeData) <- c("subject", "activity", meanstd.names)
library(reshape2)
mergeData$activity <- factor(mergeData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
mergeData$subject <- as.factor(mergeData$subject)
mergeData.melted <- melt(mergeData, id = c("subject", "activity"))
mergeData.mean <- dcast(mergeData.melted, subject + activity ~ variable, mean)
write.table(mergeData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)



