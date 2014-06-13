corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
    id <- 1:332
    ac <- complete("specdata", id)
    ids <- ac[ac[,2]>threshold,1]
    cors <- numeric()
    if (length(ids) > 0) {
        monitors <- sprintf("%03d.csv", ids)
      
        files <- file.path(directory, monitors)
      
        for (f in files) {
            dat <- na.omit(read.csv(f))
            sulf <- dat[,2]
            nitr <- dat[,3]
            cors <- rbind(cors,cor(sulf,nitr))
        }          
    }
    as.vector(cors)
}