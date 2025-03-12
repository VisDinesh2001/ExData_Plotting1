## Load required packages
library(data.table)
library(lubridate)
library(dplyr)

## Read the data
data <- fread("household_power_consumption.txt")
data$Date <- dmy(data$Date) ## Convert date into Date format
datafiltered <- subset(data, Date == "2007-02-01"| Date == "2007-02-02")

## Convert characters into numeric and time classes
datafiltered$Global_active_power <- as.numeric(datafiltered$Global_active_power)
time <- datafiltered$Time
date <- datafiltered$Date
datetime <- strptime(paste(date, time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
  


## Construct Plot in png file
png(file = "plot2.png")
plot(datetime, datafiltered$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at= c(as.numeric(c(min(datetime), median(datetime), max(datetime)))),
      labels = c("Thu", "Fri", "Sat"))
dev.off()