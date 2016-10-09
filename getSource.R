#######################################################################
# Filename:         getSource.R
# Version:          1.0
# Author:           Robert Muwanga
# License:          Apache License 2.0
# Purpose:          Download, extract and create data frame with the 
#                   Electric Power Consumption data as part of course 
#                   project 1 on the Exploratory Analytics Course  
#                   (John Hopkins Data Specialisation Course)
# Dependencies:     checkPackages.R
#######################################################################
source('checkPackages.R')

# Set variables
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
source.filename <- 'household_power_consumption.zip'
dest.filename <- 'household_power_consumption.txt'
data.folder <- file.path(getwd(), 'data')

get.source <- function() {
    # Check if zip file is in data folder and if not download and extract
    if(!dir.exists(data.folder)) 
        dir.create(data.folder, recursive = TRUE)
    
    if(!file.exists(file.path(data.folder, source.filename))) 
        download.file(url, file.path(data.folder, source.filename))
    
        unzip(
            file.path(data.folder, source.filename)
          , overwrite = FALSE # It will overwrite existing extracted files.
          , exdir = data.folder
          , junkpaths = FALSE # Keep everything in the same folder.
    )
    
    dir.files <- list.files(path = data.folder)
    
    # Returns the filename that was extracted
    dir.files[(dir.files == dest.filename)]
}

get.data <- function(data.filename) {
    # Returns a data frame with only the required data. Searches for the 
    # data.filename from the data folder.
    
    lower.date.limit <- ymd('2007-02-01')
    upper.date.limit <- ymd('2007-02-02')
    
    tbl_df(
        read.delim(file.path(data.folder, dest.filename), sep = ';', 
                   header = TRUE , stringsAsFactors = FALSE, 
                   colClasses = c(rep('character', 2), rep('numeric', 7)), 
                   na.strings = '?')) %>% 
        filter(
            dmy(Date) >= lower.date.limit & 
                dmy(Date) <= upper.date.limit) %>% 
        mutate(
            Weekday = wday(dmy(Date), label = TRUE, abbr = TRUE)
            , index = seq_along(1:n()))
}