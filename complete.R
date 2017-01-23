complete <- function(directory, id = 1:332) {
  #set working directory
  workingDir <- paste(getwd(), "Programming Assignment 1", directory, sep = "/")
  files <- list.files(workingDir, full.names = TRUE)
  df <- data.frame()
  
  for (i in id) {
    currentFile <- read.csv(files[i])
    nobs <- sum(complete.cases(currentFile))
    temp <- data.frame(i, nobs)
    df <- rbind(df, temp)
  }
  
  colnames(df) <- c("id", "nobs")
  df
}

