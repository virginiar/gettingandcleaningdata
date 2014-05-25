## Getting and Cleaning Data Project

### Source

The data linked represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.
More information into the README.txt file at the raw data.

## Variables
The variables are described into the raw data' files:
* The activities are listed into the activity_labels.txt
* The features ares listed into features.txt, the description of this variables are also included into the features_info.txt
* The original dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
* Into each dataset, you can try a "X" file with the data of each experiment, a "y" file with the activities and a "subject" file with the subject.

## Data Transformations Steps
0. The script provides code for download and unzip the original data. This code are commented. You could uncommented to get the data if necessary.
1. Merges the training and the tests sets to create on data set.
    >a. Reading the activities names.
    >b. Reading the features names.
    >c. Reading the activities file for train and test data.
    >d. Reading the subtject files for train and test data.
    >e. Reading the experiment data files for train and test data.
    >f. Merging the activity, subject and data files for train and test data.
    >g. Merging the data for train and test data.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
For each signal, the script only extracts the variables for mean() and std() as specified at features_info.txt file.
3. Uses descriptive activity names to name the activities in the data set according the recomendations about text in the data sets.
4. Appropriately labels the data set with descriptive activity names. Also, the script write the projectData.txt file with the tidy data.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject, using melt and cast. It is the projectAverage.txt.
