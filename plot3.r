
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
png(filename="plot3.png", width=480, height=480, units="px")

# Plot
plot(subsetData$Time, subsetData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
points(subsetData$Time, subsetData$Sub_metering_2, type="l", col="red")
points(subsetData$Time, subsetData$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the device
dev.off()
