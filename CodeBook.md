Code Book
========

This code book describes the variables, the data, and any transformations or work that I performed to clean up the data.


### Raw Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Raw Data transformation

The raw data sets are processed with the script run_analysis.R script to create a tidy data set.

1.Merges the training and the test sets to create one data set

Training and test set are merged into a data set.


2.Extracts only the measurements on the mean and standard deviation for each measurement

Using grep command, column names are filtered with pattern matching "mean" or "std". Data are extracted for these column names.


3.Uses descriptive activity names to name the activities in the data set

Activity names are converted to lower case and underscore is replaced with space.


4.Appropriately labels the data set with descriptive variable names

Variable name for subjectId and activity is labeled with "SubjectID" and "Activity" respectively.


5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject

From the intermediate data, a tidy data called "data.txt" is created with the average of each measurement.


### Tidy data set

__Variables__

The tidy data contains :
* SubjectID - It is an identifier for each subject. Value is from 1 to 30.
* Activity - It represents the name of the activities. Values are "walking", "walking upstairs", "walking downstairs", "sitting", "standing" and "laying"
* Average of the measurements on the mean and standard deviation for each measurement extracted from the raw data. Column name formatted with <Measurement>-<Function>-<Property>. E.g. tBodyAccJerk-std()-Y represents the standard deviation for the Y of tBodyAccJerk measurement.
