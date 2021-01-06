run_analysis <- function() {
    ## read files from test folder
    
    file_name <- ".//UCI HAR Dataset//test//X_test.txt"
    X_test <- read.table(file_name)
    
    # read feature file and use it for name columns
    file_name <- ".//UCI HAR Dataset//features.txt"
    feature_names <- read.table(file_name)
    feature_names <- feature_names[,2]
    colnames(X_test) <- feature_names
    
    # read file of activities
    file_name <- ".//UCI HAR Dataset//test//y_test.txt"
    y_test <- read.table(file_name)
    colnames(y_test) <- c('activity')
    
    # read file of subjects
    file_name <- ".//UCI HAR Dataset//test//subject_test.txt"
    subject_test <- read.table(file_name)
    colnames(subject_test) <- c('subject')
    
    test_set <- cbind(subject_test, y_test, X_test)
    
    
    ## read files from train folder
    
    file_name <- ".//UCI HAR Dataset//train//X_train.txt"
    X_train <- read.table(file_name)
    colnames(X_train) <- feature_names
    
    # read file of activities
    file_name <- ".//UCI HAR Dataset//train//y_train.txt"
    y_train <- read.table(file_name)
    colnames(y_train) <- c('activity')
    
    # read file of subjects
    file_name <- ".//UCI HAR Dataset//train//subject_train.txt"
    subject_train <- read.table(file_name)
    colnames(subject_train) <- c('subject')
    
    train_set <- cbind(subject_train, y_train, X_train)
    
    # merge both sets together
    full_set <- rbind(test_set, train_set)
    
    full_set$subject <- as.integer(full_set$subject)
    
    ## Uses descriptive activity names to name the activities in the data set
    activity_codes <- as.integer(full_set$activity)
    
    file_name <- ".//UCI HAR Dataset//activity_labels.txt"
    activity_labels <- read.table(file_name)
    
    for( i in 1:length(activity_codes)) {
        activity_codes[i] <- activity_labels[activity_codes[i], 2]
    }
    
    full_set$activity <- activity_codes
    
    ## Extracts only the measurements on the mean and standard deviation for each measurement. 
    
    spec_names <- names(full_set)
    
    spec_names <- grep(("mean\\(|std\\("), spec_names, value = TRUE)
    
    result_set <- data.frame(subject = full_set$subject, activity = full_set$activity)
    
    for( i in 1:length(spec_names)) {
        result_set[spec_names[i]] <- full_set[spec_names[i]]
    }
    
    # Create another dataset with the average of each variable for each activity and each subject
    
    count <- 1
    
    for (subj in 1:30) {
        small_set <- data.frame()
       
        for (act in activity_codes) {
           
            aver_set <- filter(result_set, subject == subj & activity == act)
           
            small_set[count, 1] <- subj
            small_set[count, 2] <- act
           
            for (key in 3:length(ncol(aver_set))) {
               
                small_set[count, key] <- mean(as.numeric(aver_set[, key]), na.rm = TRUE)
            }
            
            count <- count + 1
        }
       
    }
    
    colnames(small_set, spec_names)
}