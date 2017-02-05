best <- function(state, outcome) {
  ## Read outcome data
  outcomeData <- read.csv("outcome-of-care-measures.csv")
  fData <- factor(outcomeData[, 7])
  states <- levels(fData)
  
  ## Check that state and outcome are valid
  if (!(state %in% states))
    stop("Invalid state was entered.")
  
  if (!(outcome == "heart attack" || outcome == "heart failure" || outcome == "pneumonia"))
    stop("Invalid outcome was entered.")
  
  ## Return hospital name in that state with lowest 30-day death
  if (outcome == "heart attack")
    colNum <- 11
  else if (outcome == "heart failure")
    colNum <- 17
  else
    colNum <- 23
  
  outcomeData[, colNum] <- as.numeric(levels(outcomeData[, colNum])[outcomeData[, colNum]])
  outcomeData[, 2] <- as.character(outcomeData[, 2])
  stateData <- outcomeData[grep(state, outcomeData$State),]
  orderData <- stateData[order(stateData[, colNum], stateData[, 2], na.last = NA), ]
  orderData[1, 2]
  
  ## rate
}