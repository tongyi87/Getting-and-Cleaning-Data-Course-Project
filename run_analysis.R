#Unzip and overwrite if exist

unzip("getdata-projectfiles-UCI HAR Dataset.zip", overwrite=TRUE)
dataPath<-file.path(getwd(),"UCI HAR Dataset")

#1. Merges the training and the test sets to create one data set.

subjectIDs<-rbind(read.table(file.path(dataPath,"train/subject_train.txt")), read.table(file.path(dataPath,"test/subject_test.txt")))
colnames(subjectIDs)<-"SubjectID"


xs<-rbind(read.table(file.path(dataPath,"train/X_train.txt")), read.table(file.path(dataPath,"test/X_test.txt")))
xsColumnNames<-read.table(file.path(dataPath,"features.txt"))[[2]]
colnames(xs)<-xsColumnNames


ys<-rbind(read.table(file.path(dataPath,"train/Y_train.txt")), read.table(file.path(dataPath,"test/Y_test.txt")))
colnames(ys)<-"ActivityID"


mergedData<-cbind(cbind(subjectIDs, ys), xs)


#2.Extracts only the measurements on the mean and standard deviation for each measurement.


meanStdColumnNames<-c(grep("mean",xsColumnNames,value = TRUE),grep("std",xsColumnNames,value = TRUE))
extractedData<-mergedData[c(c("SubjectID","ActivityID"), meanStdColumnNames)]


#3.Uses descriptive activity names to name the activities in the data set


activites<-read.table(file.path(dataPath,"activity_labels.txt"))
colnames(activites)<-c("ActivityID", "Activity")


activites$Activity<-gsub(pattern = "_", replacement = " ",x = activites$Activity)
activites$Activity<-tolower(activites$Activity)


#4.Appropriately labels the data set with descriptive variable names. 


cleanData<-merge(x = extractedData,y = activites, by = "ActivityID")
cleanData <- cleanData[,!(names(cleanData) %in% c("ActivityID"))]


#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


averageData<-aggregate(cleanData[meanStdColumnNames],
          by=list(SubjectID=cleanData$SubjectID,Activity=cleanData$Activity),
          FUN=mean)
averageData <- averageData[order(averageData$SubjectID,averageData$Activity),]

write.table(averageData, file = "data.txt", row.names = FALSE)