
train_X <- read.table('../dataset/train/X_train.txt', header=F, fill=T)
test_X <- read.table('../dataset/test/X_test.txt', header=F, fill=T)

ds <- merge(train_X, test_X,all = TRUE)

cols <- read.table('../dataset/features.txt', header=F, fill=T)
colnames(ds) <- cols[,2]

ds <- ds[,grep("mean|std", names(ds))]

dsLabels <- read.table('../dataset/activity_labels.txt', header=F, fill=T)