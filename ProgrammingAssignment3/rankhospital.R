rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  outcomeData <- read.csv("outcome-of-care-measures.csv")
  fData <- factor(outcomeData[, 7])
  states <- levels(fData)
  
  ## Check that state and outcome are valid
  if (!(state %in% states))
    stop("Invalid state was entered.")
  
  if (!(outcome == "heart attack" || outcome == "heart failure" || outcome == "pneumonia"))
    stop("Invalid outcome was entered.")
  ## Return hospital name in that state with the given rank
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
  if (num == "best")
    orderData[1, 2]
  else if(num == "worst")
    orderData[nrow(orderData), 2]
  else
    orderData[num, 2]
  
  ## 30-day death rate
}