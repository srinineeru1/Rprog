complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  monitors <- sprintf("%03d.csv", id)
  
  filenames <- file.path(directory, monitors)

  load_data <- function(file) {
    tables <- read.csv(file))
    do.call(rbind, tables)
    
  }
  
  nobs <- load_data(filenames)
  
#  nobs <- nobs[complete.cases(nobs),]
  #nobs <- nrow(nobs)
  print(nobs)
  nobs <- cbind(c(id), nobs)
  
  colnames(nobs) <- c("id", "nobs")
  nobs <- aggregate(nobs~id, nobs, length )

  return(nobs)
  
  
}