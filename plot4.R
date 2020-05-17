###############################################################################
# Exploratory Data Analysis Course Project 1
# This assignment uses data from the UC Irvine Machine Learning Repository.
# http://archive.ics.uci.edu/ml/
# The data used for this project in  particular is the "Individual household 
# electric power consumption Data Set" 
#(https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
# Only the first 2 days in February 2017 are used in  generating plot3.
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

# transform time to datetime format
feb_data <- transform(feb_data, datetime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# transform all characters to numeric
feb_data$Global_active_power <- as.numeric(feb_data$Global_active_power)
feb_data$Global_reactive_power <- as.numeric(feb_data$Global_reactive_power)
feb_data$Voltage <- as.numeric(feb_data$Voltage)
feb_data$Global_intensity <- as.numeric(feb_data$Global_intensity)
feb_data$Sub_metering_1 <- as.numeric(feb_data$Sub_metering_1)
feb_data$Sub_metering_2 <- as.numeric(feb_data$Sub_metering_2)
feb_data$Sub_metering_3 <- as.numeric(feb_data$Sub_metering_3)

# Generate plot 4
# first set up the plot window with 2 rows and 2 columns
par(mfrow=c(2,2))

# On row1 col1, plot Global Active Power  against date/time
plot(feb_data$datetime, feb_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# On row1 col2, plot Voltage against date/time
plot(feb_data$datetime, feb_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# On row2 col1, plot sub_metering 1,2,3 against date/time
plot(feb_data$datetime,feb_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(feb_data$datetime,feb_data$Sub_metering_2,col="red")
lines(feb_data$datetime,feb_data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=1:3, bty="n", cex=.5)

# On row2 col2, plot Global_reactive_power against date/time
plot(feb_data$datetime, feb_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Save plot as .png file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
