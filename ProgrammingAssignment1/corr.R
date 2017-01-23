corr <- function(directory, threshold = 0) {
  #set working directory
  workingDir <- paste(getwd(), "Programming Assignment 1", directory, sep = "/")
  files <- list.files(workingDir, full.names = TRUE)
  x <- numeric(0)
  
  for (i in 1:length(files)) {
    currentFile <- read.csv(files[i])
    temp1 <- sum((!is.na(currentFile$sulfate)) & (!is.na(currentFile$nitrate)))
    if (temp1 > threshold) {
      y <- currentFile[which(!is.na(currentFile$sulfate)), ]
      temp2 <- y[which(!is.na(y$nitrate)), ]
      x <- c(x, cor(temp2$sulfate, temp2$nitrate))
    }
  }
  
  x
}