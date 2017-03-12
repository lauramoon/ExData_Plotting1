#This script creates Plot 4 of the assignment, a panel plot of 4 plots, in PNG format
#The lefthand plots are plots 2 and 3 of this assignment, while the righthand plots
#show voltage and global reactive power over time

#The data file should be in the working directory

plot4 <- function() {
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  power2day <- rbind(power[power$Date == "1/2/2007", ], power[power$Date == "2/2/2007", ])
  
  power2day$Datetime <- strptime(paste(power2day$Date, power2day$Time), "%d/%m/%Y %H:%M:%S")
  
  png(filename = "Plot4.png")
  par(mfrow=c(2,2))
  
  #Upper left plot
  plot(power2day$Datetime, power2day$Global_active_power, type = "n", xlab = "", 
       ylab = "Global Active Power")
  lines(power2day$Datetime, power2day$Global_active_power)
  
  #Upper right plot
  plot(power2day$Datetime, power2day$Voltage, type = "n", xlab = "datetime", 
       ylab = "Voltage")
  lines(power2day$Datetime, power2day$Voltage)

  #lower left plot
  plot(power2day$Datetime, power2day$Sub_metering_1, type = "n", xlab = "", 
       ylab = "Energy sub metering")
  lines(power2day$Datetime, power2day$Sub_metering_1)
  lines(power2day$Datetime, power2day$Sub_metering_2, col="red")
  lines(power2day$Datetime, power2day$Sub_metering_3, col="blue")  
  
  legend("topright", lty = 1, bty="n", col=c("black", "red","blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  #lower right plot
  plot(power2day$Datetime, power2day$Global_reactive_power, type = "n", xlab = "datetime", 
       ylab = "Global_reactive_power")
  lines(power2day$Datetime, power2day$Global_reactive_power)
  
  dev.off()
}