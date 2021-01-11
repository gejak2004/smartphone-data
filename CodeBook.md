
## Getting and Cleaning Data Course Project
## version 1.0

### Description

Data sets are the product of an experiment with a group of 30 human 
volunteers with an age of 19-48 years. The raw data was collected from 
embedded accelerators and gyroscopes in the smartphones while the subjects
were performing six physical activities (walking, walking upstairs, 
walking downstairs, sitting, standing, laying). The directory structure of 
 the data reflects divison of subject data into  training and testing sets.
Out of 30 volunteers 21 (70%) were selected into the training group and 
9 (30%) into the test group.
Within each group there is a sub-directory "Inertial Signals" which 
contains raw intertial sensor data. In the project we used only windowed
(post-processed) data which are outside of 'Intertial Signals' sub-folders.
For more details one can reference the original work [here](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions)  


### Source File Description

Files are in the plain text format. The naming scheme is the following: files with 
prefix 'X_' contain 7352 records (rows) of the 561 features, while files with prefix 
'y_' contain activity labels for the coresponding observations.

* `activity_labels.txt`: activity ID (integer) and labels (character) for 6 activities.
* `features.txt`: feature names
* `subject_train.txt`: participant ID (integer) for each record in `X_train.txt`.
* `subject_test.txt`:  participant ID (integer) for each record in `X_test.txt`.
* `X_train.txt`: training data set for 21 of the 30 participants.
* `X_test.txt`: test data set for 9 of the 30 participants.
* `y_train.txt`: activity ID for each record in `X_train.txt`.
* `y_test.txt`:  activity ID for each record in `X_test.txt`.

<span style="text-decoration:underline">NOTES:</span>

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the 'X' and 'y' files.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.

### Tidy Data Description

The features used to produce tidy data were the ones containing mean and standard 
deviation of the raw data variables. Each feature was then summarized over participant ID and activity to produce mean values.

There are 180 rows (30 participants x 6 activities), two index columns (SubjectID, Activity) and the remaining 66 columns contain mean values of the target features for 
the particular values of participant ID and activity.

* `tidy.csv`:  data for mean values of features of interest for each participant and activity .

### Production steps

1. The source data were imported into data frames, train and test sets were assembled and then merged into a single data frame whose columns were then labeled using descriptive names.
3. Human readable form for activites was achieved by converting integer activity ID into a factor, using text labels for the activities.
2. Variables with  "mean()" or "std()", together with SubjectId and Activity were then extracted into a separate data frame.
4. The tidy data containing mean summary over SubjectId, Activity for each variable was produced using R's data reshaping facilities.
5. The tidy data set was saved in a comma-separated-value (CSV) format file.

***
