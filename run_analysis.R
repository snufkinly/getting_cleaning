library(plyr)
library(data.table)

# Pull all the files into R




features <- read.table("features.txt")
subject_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
# make new x_train and x_test for working
x_train1 = x_train
x_test1 = x_test
# add subject and activity labels for test and train
x_test1 <- cbind(y_test, x_test)
x_test1 <- cbind(subject_test, x_test1)
x_train1 <- cbind(y_train, x_train)
x_train1 <- cbind(subject_train, x_train1)


#set up for merging test and train files, rename columns
column_rename <- as.numeric(c(1:563))
colnames(x_test1) <- column_rename
colnames(x_train1) <- column_rename



# merge x_train and x_test
merged1 <- merge(x_test1, x_train1, all=TRUE)

#changing column names to real descriptives
features1 <- as.character(features[,2])
features1 <- c("subject", "activity", features1)
features1 <- t(features1)
features1 <- as.vector(features1)
colnames(merged1) <- features1

mean_colnames <- colnames(merged1[, grep('mean()', names(merged1))])
std_colnames <- colnames(merged1[, grep('std', names(merged1))])

freq_colnames <- colnames(merged1[, grep('Freq', names(merged1))])
mean_colnames <- setdiff(mean_colnames, freq_colnames)
#add back subject and activity
mean_colnames<- c("subject", "activity", mean_colnames)
std_colnames <- c("subject", "activity", std_colnames)
#pulling out mean and std


std_dev <- merged1[, std_colnames]
meanmerged <- merged1[, mean_colnames]
sort_stddev <- arrange(std_dev, subject, activity)
sort_meanmerged <- arrange(meanmerged, subject, activity)
sortvalue <- c(1:10299)
sortvalue <- as.numeric(sortvalue)
sort_stddev <- cbind(sortvalue, sort_stddev)
sort_meanmerged <- cbind(sortvalue, sort_meanmerged)
#remove extra subject and activity columns
sort_stddev <- subset(sort_stddev, select = -c(subject, activity))

# now have two datasets with correct column names just containing mean and std so need to 
# merge them back into one tidy data set

merged_data <- join(sort_meanmerged, sort_stddev, by="sortvalue")

#rename all the activities in a crude way
merged_data$activity[merged_data$activity == 1] <- "WALKING"
merged_data$activity[merged_data$activity == 2] <- "WALKING_UPSTAIRS"
merged_data$activity[merged_data$activity == 3] <- "WALKING_DOWNSTAIRS"
merged_data$activity[merged_data$activity == 4] <- "SITTING"
merged_data$activity[merged_data$activity == 5] <- "STANDING"
merged_data$activity[merged_data$activity == 6] <- "LAYING"

#remove sorting column
merged_data <- merged_data[, 2:69]

#make into data table
merged_dt <- as.data.table(merged_data)
small_data <- merged_dt[, lapply(.SD, mean), by = c("subject", "activity")]

#write table as a text file (tab-delimited text)
write.table(small_data, file="summary_table.txt", row.names=FALSE, sep="\t" )
