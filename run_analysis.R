run_analysis <- function() {
    ## read files from test folder
    
    file_name <- "./UCI HAR Dataset/test/X_test.txt"
    X_test <- read.table(file_name)
    file_name <- "./UCI HAR Dataset/features.txt"
    feature_names <- read.table(file_name)
    feature_names <- feature_names[,2]
    colnames(X_test) <- feature_names
    
    file_name <- "./UCI HAR Dataset/test/y_test.txt"
    y_test <- read.table(file_name)
    colnames(y_test) <- c('activity_code')
    
    file_name <- "./UCI HAR Dataset/test/subject_test.txt"
    subject_test <- read.table(file_name)
    colnames(subject_test) <- c('subject')
    
    test_set <- cbind(subject_test, y_test, X_test)
    
    
    ## read files from train folder
    
    file_name <- "./UCI HAR Dataset/train/X_train.txt"
    X_train <- read.table(file_name)
    colnames(X_train) <- feature_names
    
    file_name <- "./UCI HAR Dataset/train/y_train.txt"
    y_train <- read.table(file_name)
    colnames(y_train) <- c('activity_code')
    
    file_name <- "./UCI HAR Dataset/train/subject_train.txt"
    subject_train <- read.table(file_name)
    colnames(subject_train) <- c('subject')
    
    train_set <- cbind(subject_train, y_train, X_train)
    
    full_set <- rbind(test_set, train_set)
    
    print(names(full_set))
}