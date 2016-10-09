#######################################################################
# Filename:         plot4.R
# Version:          1.0
# Author:           Robert Muwanga
# License:          Apache License 2.0
# Purpose:          Creates Plot 4 as part of the course 
#                   project 1 on the Exploratory Analytics Course  
#                   (John Hopkins Data Specialisation Course)
# Dependencies:     checkPackages.R, getSource.R
#######################################################################

source('checkPackages.R')   # Ensures necessary libraries are installed
source('getSource.R')       # Functions for downloading and creating
                            # 'energy.data' data object

# If 'energy.data' is not in current environment, create it
if(!('energy.data' %in% ls())) {
  get.source()
  energy.data <- get.data()
}    

dimensions <- list('width' = 480, 'height' = 480)
plot4.filename <- 'plot4.png'

plot1 <- function() {
    with(
        energy.data
        ,plot(
            index
            ,Global_active_power
            ,type = 'l'
            ,axes = FALSE # Remove axes for manual generation below
            ,ylab = 'Global Active Power'
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
}

plot2 <- function() {
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
           , col = c('black', 'red', 'blue')
           , cex = 0.75)
    
    # Add a box border around the plot
    box()
}

plot3 <- function() {
    with(
        energy.data
        ,plot(
            index
            ,Voltage
            ,type = 'l'
            ,axes = FALSE # Remove axes for manual generation below
            ,ylab = 'Voltage'
            ,xlab = 'datetime')
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
}

plot4 <- function() {
    with(
        energy.data
        ,plot(
            index
            ,Global_reactive_power
            ,type = 'l'
            ,axes = FALSE # Remove axes for manual generation below
#            ,ylab = 'Voltage'
            ,xlab = 'datetime')
    )
    
    # Manually generate the x-axis 
    axis(side = 1
         , at=c(1, median(energy.data$index), nrow(energy.data))
         , labels=c('Thur', 'Fri', 'Sat')
    )
    
    # Manually generate the y-axis
    axis(side = 2
         , at=NULL
         , labels=NULL
    )
    
    # Add a box border around the plot
    box()    
}

# Open png device
png(  filename = plot4.filename
      , width = dimensions$width
      , height = dimensions$height)

# Set a 2x2 plot space
par(mfcol = c(2,2))

# Plot each of the plotting functions above in the plotting space
plot1()
plot2()
plot3()
plot4()

# Close device and hide output from terminal
invisible(dev.off())

print(paste('Completed writing plot to:', plot4.filename))
