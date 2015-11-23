# readme for student project
explanation of steps involved in creating analysis script:

this analysis script should be self-explanatory and simple (though not elegant, sorry)
it assumes only that all the relevant files are in the directory and not in subfolders
also assumes that the packages data_table and plyr are present
prepares the data almost in the order specified in the instructions
I pull all files into R as data frames, 
combine the x_test and y_test
combine the x_train and y_train
 add the subject_test and subject_train to these data frames
 rename the columns for merging
 merge the test and training sets
 rename the columns using the features names from the original features file (understandable names, not trying to make up new ones)
sort out the mean and the standard deviation columns, removing others with similar names
add a second sort value column
sort everything by sortvalue, subject and activity so the final data set will be ready for summary
merge it all together in a seamless way via the sortvalue
rename all of the activities so the variables have real names
remove the sorting column
transform into a data table for summarizing
summarise via subject and activity to get the mean for each column variable

 

