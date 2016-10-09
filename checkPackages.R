#######################################################################
# Filename: checkPackages.R
# Version:  1.0
# Author:   Robert Muwanga
# License:  Apache License 2.0
# Purpose:  Check necessary packages are installed for use as part of
#           course project 1 on the Exploratory Analytics 
#           Course (John Hopkins Data Specialisation Course)
#######################################################################

packages <- c('lubridate', 'dplyr') # List of packages

sapply(packages, function(package) { # Install packages if not installed
    if(!(package %in% installed.packages())) install.packages(package)
})

# Load packages into environment.

lapply(packages, function(package) {
    require(package, character.only = TRUE) 
})