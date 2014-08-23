cleaningcourseproject
=====================
This program reads in the Samsung datasets activity_labels.txt, features.txt, subject_test.txt, X_test.txt, y_test.txt, subject_train.txt, x_train.txt, and y_train.txt and then combines each test dataset with its corresponding train dataset using rbind.

Using the column names listed in features.txt the script creates the column names for the combined x dataset and then creates a new dataset (msdata) for all "mean" and "std" variables.

msdata is then combined with the datasets for the subject and activity info.

The combined dataset is then tidied up to have more descriptive names.

The data is then aggregated into a new dataset comprised of the averages of each variable by activity and subject.

Since the aggregated dataset created 2 new variables to replace the Activity and Subject variables, the old ones are removed and the new ones are renamed "Activity" and "Subject."

Lastly, the new dataset is written to file as a txt file.
