rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcomeData <- read.csv("outcome-of-care-measures.csv")
  fData <- factor(outcomeData[, 7])
  states <- levels(fData)
  
  ## Check that state and outcome are valid
  if (!(outcome == "heart attack" || outcome == "heart failure" || outcome == "pneumonia"))
    stop("Invalid outcome was entered.")
  
  ## For each state, find the hospital of the given rank
  if (outcome == "heart attack")
    colNum <- 11
  else if (outcome == "heart failure")
    colNum <- 17
  else
    colNum <- 23
  
  output <- vector()
  for ( i in 1:length(states)) {
    stateData <- outcomeData[grep(states[i], outcomeData$State), ]
    orderData <- stateData[order(stateData[, colNum], stateData[, 2], na.last = NA), ]
    if (num == "best")
      hospital <- orderData[1, 2]
    else if(num == "worst")
      hospital <- orderData[nrow(orderData), 2]
    else
      hospital <- orderData[num, 2]
    output <- append(output, c(hospital, states[i]))
  }
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  output <- as.data.frame(matrix(output, length(states), 2, byrow = TRUE))
  colnames(output) <- c("hospital", "state")
  rownames(output) <- states
  output
  
}