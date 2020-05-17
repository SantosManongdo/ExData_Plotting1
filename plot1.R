###############################################################################
# Exploratory Data Analysis Course Project 1
# This assignment uses data from the UC Irvine Machine Learning Repository.
# http://archive.ics.uci.edu/ml/
# The data used for this project in  particular is the "Individual household 
# electric power consumption Data Set" 
#(https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
# Only the first 2 days in February 2017 are used in  generating plot1.
###############################################################################


# Set working directory
setwd("/Users/maricelmanongdo/Documents/Data Science/Coursera/Exploratoty_Analysis/Exploratory_Analysis_Assignment")

# LOAD REQUIRED PACKAGES
library(data.table)
library(lubridate)

# LOAD DATA
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

# convert date to date format 
data$Date = as.Date(data$Date, format = '%d/%m/%Y')

# subset first 2 days of Feb2007
feb_data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Generate plot 1 - Histogram of Global Active Power
hist(as.numeric(feb_data$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
# Save plot as .png file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()