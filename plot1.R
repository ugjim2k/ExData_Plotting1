#######################################################################
# Filename:         plot1.R
# Version:          1.0
# Author:           Robert Muwanga
# License:          Apache License 2.0
# Purpose:          Creates Plot 1 as part of the course 
#                   project 1 on the Exploratory Analytics Course  
#                   (John Hopkins Data Specialisation Course)
# Dependencies:     checkPackages.R, getSource.R
#######################################################################

source('checkPackages.R')   # Ensures necessary libraries are installed
source('getSource.R')       # Functions for downloading and creating
                            # 'energy.data' data object

# If 'energy.data' is not in current environment, create it
if(!('energy.data' %in% ls())) 
    energy.data <- get.data(get.source())
    
dimensions <- list('width' = 480, 'height' = 480)
plot1.filename <- 'plot1.png'

# Open png device
png(  filename = plot1.filename
    , width = dimensions$width
    , height = dimensions$height)

# Write plot to png file
with(energy.data, 
     hist(Global_active_power, 
          xlab = 'Global Active Power (kilowatts)', 
          main = 'Global Active Power', col = 'red'))

# Close device and hide output from terminal
invisible(dev.off())

print(paste('Completed writing plot to:', plot1.filename))
