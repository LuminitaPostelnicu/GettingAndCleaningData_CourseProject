---
title: "CodeBook.md"
author: "Luminita Postelnicu"
date: "25 Sep 2015"
output: html_document
---

This code book presents the variables from the final tidy dataset obtained according to the description from README.md.

"ID_Volunteer" - the ID of the volunteer in the study (values from 1 to 30)     
"Activity" - type of activity: walking, walking_upstairs, walking_downstairs, sitting, standing, laying   

The follwoing variables estimate the mean and standard deviations for the accelerometer and gyroscope for the three direction X, Y and Z:
"tBodyAccMeanX"    
"tBodyAccMeanY"      
"tBodyAccMeanZ"     
"tBodyAccStdX"       
"tBodyAccStdY"       
"tBodyAccStdZ"       
"tBodyGyroMeanX"     
"tBodyGyroMeanY"    
"tBodyGyroMeanZ"     
"tBodyGyroStdX"      
"tBodyGyroStdY"      
"tBodyGyroStdZ" 

The following variables estimate the average of each variable described above, grouped by volunteer ID and activity:
"avg_tBodyAccMeanX" 
"avg_tBodyAccMeanY"  
"avg_tBodyAccMeanZ"  
"avg_tBodyAccStdX"   
"avg_tBodyAccStdY"   
"avg_tBodyAccStdZ"  
"avg_tBodyGyroMeanX" 
"avg_tBodyGyroMeanZ" 
"avg_tBodyGyroStdX"  
"avg_tBodyGyroStdY"  
"avg_tBodyGyroStdZ"
