#Codebook


##Introduction

This code book will describe the data used in this process and how they are processed to get the required tidy dataset.



##Explanation 
Following codes are used to read their respective files using read.table command

s_test => subject_test.txt

s_train => subject_train.txt

Xtrain => X_train.txt

ytrain => y_train.txt

Xtest => X_test.txt

ytest => y_test.txt

features => features.txt

activity => activity_labels.txt



Train and test formed by binding columns of (s_train,  ytrain, Xtrain) and (s_test,ytest,Xtest) respectively

Comb is the final matrix formed by binding rows train and test

The activity column was converted from a integer to a factor, using labels describing the activities.

All feature columns removed thatdid not contain "mean" and "std" exact string.

The tide data set was created showing mean of each subject and each activity. Since there 6 activity and 30 subjects for each activity, hence we have 180-182 rows.

Output has been made in both csv and txt file using write.csv and write.txt command respectively