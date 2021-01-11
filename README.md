

## Getting and Cleaning Data Course Project


The goal of this project is to demonstrate basic getting and cleaning data skills using ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Some minor analysis of the original data set was carried out in order to produce
tidy data.

**Inital phase of data preparation:**

1. Archived (zip file) data sets can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. The following files:

    * `activity_labels.txt`
	* `features.txt`
	* `subject_train.txt`
	* `subject_test.txt`
	* `X_train.txt`
	* `y_train.txt`
	* `X_test.txt`
	* `y_test.txt`   
	
	  
    should be extracted into the **same** directory where the R script is.

**Final phase** consists of executing R script ([run_analysis.R](run_analysis.R)). The output of the R script is a tidy data set, [tidy.csv](tidy.csv).
More information can be found in the [code book](CodeBook.md).  
    

> Note: *reshape2* package is required for the R script to function. 
