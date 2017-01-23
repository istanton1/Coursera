pollutantmean <- function(directory, pollutant, id = 1:332) {
  #set working directory
  workingDir <- paste(getwd(), "Programming Assignment 1", directory, sep = "/")
  files <- list.files(workingDir, full.names = TRUE)[id]
  files
  df <- numeric(0)
  for (i in files) {
    df <- rbind(df, read.csv(i))
  }
    
  #for(i in files) df <- read.csv(files[i])
  mean(df[, pollutant], na.rm = TRUE)
  #colnames(df)
}