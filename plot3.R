#######################################################################
# Filename:         plot3.R
# Version:          1.0
# Author:           Robert Muwanga
# License:          Apache License 2.0
# Purpose:          Creates Plot 3 as part of the course 
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
plot3.filename <- 'plot3.png'

# Open png device
png(  filename = plot3.filename
      , width = dimensions$width
      , height = dimensions$height)

## Draw the plots
# Use the plotting function to plot Sub_metering_1 data
with(
    energy.data
    ,plot(
        index
        ,Sub_metering_1
        ,type = 'l'
        ,axes = FALSE # Remove axes for manual generation below
        ,ylab = 'Energy sub metering'
        ,xlab = '')
)

# Add Sub_metering_2 plot data to existing plot
with(
    energy.data
    , lines(x = index, y = Sub_metering_2, col = 'red')
)

# Add Sub_metering_3 plot data to existing plot
with(
    energy.data
    , lines(x = index, y = Sub_metering_3, col = 'blue')
)

# Manually generate the x-axis 
axis(side = 1
     , at=c(0, median(energy.data$index), nrow(energy.data))
     , labels=c('Thur', 'Fri', 'Sat')
)

# Manually generate the y-axis
axis(side = 2
     , at=NULL
     , labels=TRUE
)

# Add legend information
legend(x = 'topright'
       , lty = c(rep(1,3))
       , lwd = c(rep(2.5, 3))
       , legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3')
       , col = c('black', 'red', 'blue'))

# Add a box border around the plot
box()

# Close device and hide output from terminal
invisible(dev.off())

print(paste('Completed writing plot to:', plot3.filename))
