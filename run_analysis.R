library(dplyr)

setwd()

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "projectrawdata.zip")
unzip("projectrawdata.zip")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

#Training Data
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_response <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_id <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_id, train_response, train)

#Test Data
test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_response <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_id <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_id, test_response, test)

#Step 1 Merge the Training and Test Data Sets
all <- rbind(train, test)

#Step 2 & 4 Appropriate column name labels and 
#subset only measres with mean or std. 
colnames(all)[1:2] <- c("subject", "activity")
colnames(all)[3:ncol(all)] <- as.character(features[,2])

want <- grep("-(mean|std)\\(\\)", colnames(all))
all <- all[, c(1,2, want)]

#Step 3 Descriptive Activity Names
all[,2] <- activity_labels[all[,2], 2]

#Step 5 Data frame with Average of Each Variable for Each Subject
all_tidy <- group_by(all, subject, activity) %>%
            summarise_each(funs(mean))
write.table(all_tidy, "all_tidy.txt", row.names = FALSE)
            

