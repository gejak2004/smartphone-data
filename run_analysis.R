
library(reshape2)

#
# MERGEING THE TRAINING AND THE TEST SETS INTO ONE DATA SET ---------
#

# import data into data frames
subject_train = read.table('subject_train.txt')
subject_test = read.table('subject_test.txt')
X_train = read.table('X_train.txt')
y_train = read.table('y_train.txt')
X_test = read.table('X_test.txt')
y_test = read.table('y_test.txt')


# recreate training and test sets separately
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)

# merge training and test sets
data <- rbind(train, test)

#
# LABELING DATA SET WITH DESCRIPTIVE NAMES --------------------------
#

feature_names <- read.table('features.txt', 
                            stringsAsFactors=FALSE)
feature_names <- feature_names[[2]] # we only need the second column 

colnames(data) <- c('SubjectID', 'Activity', feature_names)


#
# NAMING ACTIVITIES  -----------------------------------------------
#

# read activity codes and labels from a file
activities <- read.table('activity_labels.txt', 
                         col.names=c('Code', 'Type'))

# convert activity column into categorical data type
data$Activity = factor(data$Activity, 
                       levels=activities$Code,
                       labels=activities$Type)

#
# EXTRACTING MEAUSUREMENTS ON THE MEAN AND STANDARD DEVIATON --------
#

# find which columns contain "mean()" or "std()" 
mean_std_columns <- (
    grepl("mean()", names(data), fixed=TRUE) | 
    grepl("std()", names(data),  fixed=TRUE)
)

# include ID, and Activity columns
mean_std_columns[1:2] <- TRUE 

# reduce data set to ID, Activity and columns with "mean()" or "std()"
data <- data[, mean_std_columns]

#
# CREATING INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE
# FOR EACH ACTIVITY AND EACH SUBJECT.
#

# melt data from wide format into long format
# so we can 'group' it based on SubjectID, Activity and Feature
long_data <- melt(data, 
                 id.vars=c('SubjectID', 'Activity'),
                 variable.name='Feature',
                 value.name='Value')

# for each pair of values of SubjectId and Activity find 
# the mean of the Feature
tidy_data <- dcast(long_data, SubjectID + Activity ~ Feature, mean)

# export tidy data to a file
write.table(tidy_data, file='tidy.txt', row.names=FALSE)
