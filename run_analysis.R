library(plyr)

#1. Download the File

if(!file.exists("./ProjectData")){dir.create("./ProjectData")}
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "./ProjectData/AssignmentDataset.zip")

#2. Unzip the file
unzip(zipfile = "./ProjectData/AssignmentDataset.zip",exdir = "./ProjectData")

#3. Read Training Data
dt_x_train <- read.table("./ProjectData/UCI HAR Dataset/train/X_train.txt")
dt_y_train <- read.table("./ProjectData/UCI HAR Dataset/train/y_train.txt")
dt_subject_train <- read.table("./ProjectData/UCI HAR Dataset/train/subject_train.txt")

#4. Read Testing Data
dt_x_test <- read.table("./ProjectData/UCI HAR Dataset/test/X_test.txt")
dt_y_test <- read.table("./ProjectData/UCI HAR Dataset/test/y_test.txt")
dt_subject_test <- read.table("./ProjectData/UCI HAR Dataset/test/subject_test.txt")

#5. Read Feature vector
dt_features <- read.table("./ProjectData/UCI HAR Dataset/features.txt")

#6. Read Activity Labels
dt_activity <- read.table("./ProjectData/UCI HAR Dataset/activity_labels.txt")

#7. Assign Column Names to training and testing data tables
colnames(dt_x_train) <- dt_features[,2]
colnames(dt_y_train) <- "ActivityId"
colnames(dt_subject_train) <- "SubjectId"

colnames(dt_x_test) <- dt_features[,2]
colnames(dt_y_test) <- "ActivityId"
colnames(dt_subject_test) <- "SubjectId"

colnames(dt_activity) <- c("ActivityId","ActivityName")

#8. Merge All Data into One data table
dt_merge_train <- cbind(dt_y_train,dt_subject_train,dt_x_train)
dt_merge_test <- cbind(dt_y_test,dt_subject_test,dt_x_test)
dt_final <- rbind(dt_merge_train,dt_merge_test)

#9. Create Mean and SD vector

allcolnames <- colnames(dt_final)
MeanSDVector <- (grepl("ActivityId",allcolnames,ignore.case = TRUE)|
                  grepl("SubjectId",allcolnames,ignore.case = TRUE)|
                  grepl("mean",allcolnames,ignore.case = TRUE) |
                  grepl("std",allcolnames,ignore.case = TRUE))

#10.Select subset from the master data table
dt_mean_SD <- dt_final[,MeanSDVector == TRUE]

#11. Attach Activity name
dt_mean_SD_with_activity <- merge(dt_mean_SD,dt_activity,by = "ActivityId", all.x = TRUE)

#12. Create tidy data set
dt_tidy <- aggregate(.~SubjectId+ActivityId,dt_mean_SD_with_activity,mean)
dt_tidy <- dt_tidy[order(dt_tidy$SubjectId,dt_tidy$ActivityId),]

#13. write the tidy dataset
write.table(dt_tidy,"ProjectTidyDataset.txt",row.names = FALSE)
