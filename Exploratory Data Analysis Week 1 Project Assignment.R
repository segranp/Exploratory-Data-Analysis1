#Exploratory Data Analysis
#Week 1
#Project Assignment

setwd("C:/Users/segran.pillay/My Documents/Exploratory Data Analysis/")

# Downloading dataset
if(!file.exists("./project")){dir.create("./project")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./project/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./project/Dataset.zip",exdir="./project")

readFile <- "./project/household_power_consumption.txt"

#Plot data
plotData <- read.table(readFile, header=T, sep=";", na.strings="?")

#Setting Time Variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

#Plot 1: Global Active Power
par(mfrow=c(1,1))
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()

#Plot 2: 
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png")
dev.off()

#Plot 3:
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.copy(png,"plot3.png")
dev.off()       

#Plot 4:
#Generating Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(finalData$SetTime, finalData$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalData$SetTime, finalData$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png,"plot4.png")
dev.off() 
