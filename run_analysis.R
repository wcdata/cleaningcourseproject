features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_complete <- rbind(subject_test,subject_train)
x_complete <- rbind(x_test,x_train)
y_complete <- rbind(y_test,y_train)
rm(x_test,x_train,y_test,y_train,subject_test,subject_train)
colnames(x_complete) <- features$V2
msdata <- x_complete[,grep("Mean|std", ignore.case = TRUE,colnames(x_complete))]
act_complete <-factor(y_complete$V1,labels = activity_labels$V2)
data_complete <- cbind(act_complete,subject_complete,msdata)
colnames(data_complete) <- c("Activity","Subject","Body Accelerator X (Mean)","Body Accelerator Y (Mean)","Body Accelerator Z (Mean)","Body Accelerator X (Std)","Body Accelerator Y (Std)","Body Accelerator Z (Std)","Gravity Accelerator X (Mean)","Gravity Accelerator Y (Mean)","Gravity Accelerator Z (Mean)","Gravity Accelerator X (Std)","Gravity Accelerator Y (Std)","Gravity Accelerator Z (Std)","Body Accelerator Jerk X (Mean)","Body Accelerator Jerk Y (Mean)","Body Accelerator Jerk Z (Mean)","Body Accelerator Jerk X (Std)","Body Accelerator Jerk Y (Std)","Body Accelerator Jerk Z (Std)","Body Gyro X (Mean)","Body Gyro Y (Mean)","Body Gyro Z (Mean)","Body Gyro X (Std)","Body Gyro Y (Std)","Body Gyro Z (Std)","Body Gyro Jerk X (Mean)","Body Gyro Jerk Y (Mean)","Body Gyro Jerk Y (Mean)","Body Gyro Jerk X (Std)","Body Gyro Jerk Y (Std)","Body Gyro Jerk Z (Std)","Body Accelerator Magnitude (Mean)","Body Accelerator Magnitude (Std)","Gravity Accelerator Magnitude (Mean)","Gravity Accelerator Magnitude (Std)","Body Accelerator Jerk Magnitude (Mean)","Body Accelerator Jerk Magnitude (Std)","Body Gyro Magnitude (Mean)","Body Gyro Magnitude (Std)","Body Gyro Jerk Magnitude (Mean)","Body Gyro Jerk Magnitude (Std)","Body Accelerator X (Mean) (FDSignal)","Body Accelerator Y (Mean) (FDSignal)","Body Accelerator Z (Mean) (FDSignal)","Body Accelerator X (Std) (FDSignal)","Body Accelerator Y (Std) (FDSignal)","Body Accelerator Z (Std) (FDSignal)","Body Accelerator X (Mean Freq) (FDSignal)","Body Accelerator Y (Mean Freq) (FDSignal)","Body Accelerator Z (Mean Freq) (FDSignal)","Body Accelerator Jerk X (Mean) (FDSignal)","Body Accelerator Jerk Y (Mean) (FDSignal)","Body Accelerator Jerk Z (Mean) (FDSignal)","Body Accelerator Jerk X (Std) (FDSignal)","Body Accelerator Jerk Y (Std) (FDSignal)","Body Accelerator Jerk Z (Std) (FDSignal)","Body Accelerator Jerk X (Mean Freq) (FDSignal)","Body Accelerator Jerk Y (Mean Freq) (FDSignal)","Body Accelerator Jerk Z (Mean Freq) (FDSignal)","Body Gyro X (Mean) (FDSignal)","Body Gyro Y (Mean) (FDSignal)","Body Gyro Z (Mean) (FDSignal)","Body Gyro X (Std) (FDSignal)","Body Gyro Y (Std) (FDSignal)","Body Gyro Z (Std) (FDSignal)","Body Gyro X (Mean Freq) (FDSignal)","Body Gyro Y (Mean Freq) (FDSignal)","Body Gyro Z (Mean Freq) (FDSignal)","Body Accelerator Magnitude (Mean) (FDSignal)","Body Accelerator Magnitude (Std) (FDSignal)","Body Accelerator Magnitude (Mean Freq) (FDSignal)","Body Accelerator Jerk Magnitude (Mean) (FDSignal)","Body Accelerator Jerk Magnitude (Std) (FDSignal)","Body Accelerator Jerk Magnitude (Mean ) (FDSignal)","Body Gyro Magnitude (Mean) (FDSignal)","Body Gyro Magnitude (Std) (FDSignal)","Body Gyro Magnitude (Mean Freq) (FDSignal)","Body Gyro Jerk Magnitude (Mean) (FDSignal)","Body Gyro Jerk Magnitude (Std) (FDSignal)","Body Gyro Jerk Magnitude (Mean Freq) (FDSignal)","Angle-Body Accelerator (Mean) - Gravity","Angle-Body Accelerator Jerk (Mean) - Gravity (Mean)","Angle-Body Gyro (Mean) - Gravity (Mean)","Angle-Body Gyro Magnitude (Mean) - Gravity (Mean)","Angle: (X - Gravity Mean)","Angle: (Y - Gravity Mean)","Angle: (Z - Gravity Mean)")
aggdata <-aggregate(data_complete, by=list(data_complete$Activity,data_complete$Subject),FUN=mean, na.rm=TRUE)
aggdata[,(which( colnames(aggdata)=="Activity"))] <- NULL
aggdata[,(which( colnames(aggdata)=="Subject"))] <- NULL
names(aggdata)[1]<- "Activity"
names(aggdata)[2]<- "Subject"
write.table(aggdata, "tidy.txt", row.names = FALSE)