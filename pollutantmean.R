pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
      
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
      
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
      
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
  
    monitors <- sprintf("%03d.csv", id)
  
    files <- file.path(directory, monitors)

    mydata <- NULL
    for (f in files) {
        dat <- read.csv(f)
        mydata <- rbind(mydata, dat)
    }  
    nonNAdata <- mydata[complete.cases(mydata[pollutant]),]
  
    mean(nonNAdata[,pollutant]) 
}