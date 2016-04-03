s_test <- read.table("C:/Users/shreyas/datasciencecoursera/test/subject_test.txt", header = FALSE)
s_train <- read.table("C:/Users/shreyas/datasciencecoursera/train/subject_train.txt", header = FALSE)
Xtrain <- read.table("C:/Users/shreyas/datasciencecoursera/train/X_train.txt", header = FALSE)
ytrain <- read.table("C:/Users/shreyas/datasciencecoursera/train/y_train.txt", header = FALSE
)
Xtest <- read.table("C:/Users/shreyas/datasciencecoursera/test/X_test.txt", header = FALSE)
ytest <- read.table("C:/Users/shreyas/datasciencecoursera/test/y_test.txt", header = FALSE)
features <- read.table("C:/Users/shreyas/datasciencecoursera/features.txt", header = FALSE)
activity <- read.table("C:/Users/shreyas/datasciencecoursera/activity_labels.txt", header = FALSE)
activity <- gsub("Walking_Upstairs", "WalkingUpstairs", activity, fixed = TRUE)
activity <- gsub("Walking_Downstairs", "WalkingDownstairs", activity, fixed = TRUE)

names(s_train) <- "subjectID"
names(s_test) <- "subjectID"
names(Xtrain) <- features$V2
names(Xtest) <- features$V2
names(ytrain) <- "activity"
names(ytest) <- "activity"
train <- cbind(s_train, ytrain, Xtrain)
test <- cbind(s_test,ytest,Xtest)
comb <- rbind(train,test)
meanstd <- grepl("mean\\(\\)", names(comb))| grepl("std\\(\\)", names(comb))
meanstd[1:2] <- TRUE
comb <- comb[,meanstd]
comb$activity <- factor(comb$activity, labels = c("Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying"))
library(reshape2
      )
x <- melt(comb, id=c("subjectID","activity"))
tidy <- dcast(x, subjectID+activity~variable, mean)
write.csv(tidy, "tidy.csv", row.names = FALSE)

