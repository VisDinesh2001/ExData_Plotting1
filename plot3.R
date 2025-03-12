## Load required packages
library(data.table)
library(lubridate)
library(dplyr)

## Read the data
data <- fread("household_power_consumption.txt")
data$Date <- dmy(data$Date) ## Convert date into Date format
datafiltered <- subset(data, Date == "2007-02-01"| Date == "2007-02-02")

## Convert characters into numeric and time classes
datafiltered$Sub_metering_1 <- as.numeric(datafiltered$Sub_metering_1)
datafiltered$Sub_metering_2 <- as.numeric(datafiltered$Sub_metering_2)
datafiltered$Sub_metering_3 <- as.numeric(datafiltered$Sub_metering_3)
time <- datafiltered$Time
date <- datafiltered$Date
datetime <- strptime(paste(date, time, sep = " "), format = "%Y-%m-%d %H:%M:%S")


## Construct Plot in png file
  png(file = "plot3.png")
      ## Create Plot with data for submetering 1
      plot(datetime, datafiltered$Sub_metering_1, type = "l", xlab = "",
           ylab = "Energy sub metering", xaxt = "n")
      ## Add data for submeter 2
      points(datetime, datafiltered$Sub_metering_2, type = "l", col = "red")
      ## Add data for submeter 3
      points(datetime, datafiltered$Sub_metering_3, type = "l", col = "blue")
      
      ## Add legend
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                                    "Sub_metering_3"),
             lty = 1, col = c("black", "red", "blue"))
      
      ## Label x-axis appropriately by day
      axis(1, at= c(as.numeric(c(min(datetime), median(datetime), max(datetime)))),
           labels = c("Thu", "Fri", "Sat"))
  dev.off()