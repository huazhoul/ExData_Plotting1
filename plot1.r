
rm(list=ls())

# Data input (assume at the current folder)
dataSourceFile <- ".\\household_power_consumption.txt"

# Read the data into R
rawData <- read.table(dataSourceFile, header=TRUE, sep=";", na.strings="?");

# Convert time
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")

selectedDate <- as.Date(c("01/02/2007", "02/02/2007"),"%d/%m/%Y")

# Choose the subset data
subsetData <- rawData[ rawData$Date %in% selectedDate, ]

# Delete raw data which is not required
rm(rawData)

# Open PNG device
png(filename="plot1.png", width=480, height=480, units="px")

# Plot
hist(subsetData$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

# Close the device
dev.off()
