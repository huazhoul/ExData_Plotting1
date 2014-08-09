
rm(list=ls())

# Data input (assume at the current folder)
dataSourceFile <- ".\\household_power_consumption.txt"

# Read the data into R
rawData <- read.table(dataSourceFile, header=TRUE, sep=";", na.strings="?");

# Convert time
rawData$Time <- paste(rawData$Date, rawData$Time)
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")

# Choose the subset data
selectedDate <- as.Date(c("01/02/2007", "02/02/2007"),"%d/%m/%Y")
subsetData <- rawData[ rawData$Date %in% selectedDate, ]

subsetData$Time <- strptime(subsetData$Time, "%d/%m/%Y %H:%M:%S")

# Open PNG device
png(filename="plot2.png", width=480, height=480, units="px")

# Plot
plot(subsetData$Time, subsetData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

# Close the device
dev.off()
