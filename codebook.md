The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Variables

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Identifiers
SubjectID Subject identifier  (ranges from 1 to 30)

ActivityID  6 activities (ranges from 1 to 6)
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

561-FEATURE VECTOR WITH TIME AND FREQUENCY DOMAIN VARIABLES
The measurements are classified in two domains:
* Time-domain signals (variables prefixed by time), resulting from the capture of accelerometer and gyroscope raw signals.
* Frequency-domain signals (variables prefixed by frequency), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.


Sample Variables
Time-domain signals
* Average time-domain body acceleration in the X, Y and Z directions: timeBodyAccelerometer-Mean()-X/Y/Z
* Standard deviation of the time-domain body acceleration in the X, Y and Z directions: timeBodyAccelerometer-SD()-X/Y/Z
* Average time-domain gravity acceleration in the X, Y and Z directions: timeGravityAccelerometer-Mean()-X/Y/Z
* Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions: timeGravityAccelerometer-SD()-X/Y/Z
* Average time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions: timeBodyAccelerometerJerk-Mean()-X/Y/Z
* Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions: timeBodyAccelerometerJerk-SD()-X/Y/Z
* Average time-domain body angular velocity in the X, Y and Z directions: timeBodyGyroscope-Mean()-X/Y/Z


Frequency-domain signals
* Average time-domain body acceleration in the X, Y and Z directions: frequencyBodyAccelerometer-Mean()-X/Y/Z
* Standard deviation of the time-domain body acceleration in the X, Y and Z directions: frequencyBodyAccelerometer-SD()-X/Y/Z
* Average time-domain gravity acceleration in the X, Y and Z directions: frequencyGravityAccelerometer-Mean()-X/Y/Z
* Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions: frequencyGravityAccelerometer-SD()-X/Y/Z
* Average time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions: frequencyBodyAccelerometerJerk-Mean()-X/Y/Z
* Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions: frequencyBodyAccelerometerJerk-SD()-X/Y/Z
* Average time-domain body angular velocity in the X, Y and Z directions: frequencyBodyGyroscope-Mean()-X/Y/Z


