#######################################################################
# Filename:         plot2.R
# Version:          1.0
# Author:           Robert Muwanga
# License:          Apache License 2.0
# Purpose:          Creates Plot 2 as part of the course 
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
plot2.filename <- 'plot2.png'

# Open png device
png(  filename = plot2.filename
      , width = dimensions$width
      , height = dimensions$height)

# Draw the plot
with(
    energy.data
    ,plot(
        index
        ,Global_active_power
        ,type = 'l'
        ,axes = FALSE # Remove axes for manual generation below
        ,ylab = 'Global Active Power (kilowatts)'
        ,xlab = '')
)

# Manually generate the x-axis 
axis(side = 1
    , at=c(1, median(energy.data$index), nrow(energy.data))
    , labels=c('Thur', 'Fri', 'Sat')
)

# Manually generate the y-axis
axis(side = 2
     , at=NULL
     , labels=TRUE
)

# Add a box border around the plot
box()

# Close device and hide output from terminal
invisible(dev.off())

print(paste('Completed writing plot to:', plot2.filename))
