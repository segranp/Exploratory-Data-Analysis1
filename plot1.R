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