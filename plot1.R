## Load required packages
library(data.table)

## Read the data
data <- fread("household_power_consumption.txt")
data$Date <- dmy(data$Date) ## Convert date into Date format
datafiltered <- subset(data, Date == "2007-02-01"| Date == "2007-02-02")

## Convert characters into numeric
datafiltered$Global_active_power <- as.numeric(datafiltered$Global_active_power)

## Construct Plot in png file
png(file = "plot1.png")
hist(datafiltered$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red", main = "Global Active Power")

dev.off() ## Close device
## dev.copy(png, "plot1.png")