#This script creates Plot 3 of the assignment, a plot of the 3 submeters over time, in PNG format

#The data file should be in the working directory

plot3 <- function() {
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  power2day <- rbind(power[power$Date == "1/2/2007", ], power[power$Date == "2/2/2007", ])
  
  power2day$Datetime <- strptime(paste(power2day$Date, power2day$Time), "%d/%m/%Y %H:%M:%S")
  
  png(filename = "Plot3.png")
  plot(power2day$Datetime, power2day$Sub_metering_1, type = "n", xlab = "", 
       ylab = "Energy sub metering")
  lines(power2day$Datetime, power2day$Sub_metering_1)
  lines(power2day$Datetime, power2day$Sub_metering_2, col="red")
  lines(power2day$Datetime, power2day$Sub_metering_3, col="blue")  
  
  legend("topright", lty = 1, col=c("black", "red","blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  dev.off()
}