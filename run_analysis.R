library(dplyr)
library(stringr)

#merge training and test sets to create one data set
train_X <- read.table('UCI HAR Dataset/train/X_train.txt', header=F, fill=T)
test_X <- read.table('UCI HAR Dataset/test/X_test.txt', header=F, fill=T)
dirty_ds <- merge(train_X, test_X,all = TRUE)

#name columns
cols <- read.table('UCI HAR Dataset/features.txt', header=F, fill=T)
colnames(dirty_ds) <- cols[,2]

#extract measurements for mean and standard deviation only
dirty_ds <- dirty_ds[,grep("mean\\(|std\\(", names(dirty_ds))]

#include activy into the dirty data set
y_train <- read.table('UCI HAR Dataset/train/y_train.txt', header=F, fill=T)
y_test <- read.table('UCI HAR Dataset/test/y_test.txt', header=F, fill=T)
y_merge <- rbind(y_train, y_test)
dirty_ds <- cbind(y_merge, dirty_ds)

#set descriptive activity names 
dsLabels <- read.table('UCI HAR Dataset/activity_labels.txt', header=F, fill=T)
activityName <- dsLabels[,2]
dirty_ds[,1] <- activityName[dirty_ds[,1]]
colnames(dirty_ds)[1] <- 'Activity'

#create tidy dataset with average of each function grouping by activity
tidy_ds <- dirty_ds %>% group_by(Activity) %>% summarise_each(funs(mean))

#write tidy dataset to file
write.table(tidy_ds, "tidy_data.txt", row.names = FALSE)