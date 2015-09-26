---
title: "README"
author: "Luminita Postelnicu"
date: "25 Sep 2015"
output: html_document
---

This document describes how the script run_analysis.R works.
The analysis is carried out starting from the Human Activity Recognition Using Smartphones Dataset Version 1.0

I start by calling the library dplyr (as I will use a few of its features). Then, I read the subject_test, y_test and X_test tables which contain the volunteer ID (taking values from 1 to 30), the type of activity (i.e. walking, walking_upstairs, walking_downstairs, sitting, standing, laying), respectively the computed features (the complete list can be found in features.txt). Next, I cbind the three tables in a data frame, and I subsequently complete the resulting table by adding the variables/columns from the remaining datasets from the "test" folder. The resulting data frame is assigned to the variable "newDB1". 

I follow the same steps to build a data frame containing the datasets subject_train, y_train, X_train, and the ones from the folder "train", and I assign the result to the variable "newDB2".

I rbind "newDb1" and "newDB2" in a new dataset called "data". I then extract the volunteer ID (or subject), the activity type and the measurements on the mean and standard deviation for each measurement in the variable "dataNew" according to their column positions in the dataset "data", as follows:

```dataNew <- data[,c(1:8, 123:128)]
```

In the new dataset, I use descriptive activity names to name the activities and I label the data set with descriptive variable names.

In the last step, I use a chain command to create a second, independent tidy data set with the average of each variable for each activity and each volunteer ID (i.e. subject). I write the data as a txt file (named "dataFinal.txt") according with the assignment requirements.

The 'CodeBook.md' presents a detailed account of the variables from the final dataset.
