#Exploratory Data Analysis
#Week 1
#Project Assignment
#Plot 2: 
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png")
dev.off()