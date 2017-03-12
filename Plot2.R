#This script creates Plot 2 of the assignment, a plot of Global Active Power over time, in PNG format

#The data file should be in the working directory

plot2 <- function() {
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  power2day <- rbind(power[power$Date == "1/2/2007", ], power[power$Date == "2/2/2007", ])

  power2day$Datetime <- strptime(paste(power2day$Date, power2day$Time), "%d/%m/%Y %H:%M:%S")
  
  png(filename = "Plot2.png")
  plot(power2day$Datetime, power2day$Global_active_power, type = "n", xlab = "", 
       ylab = "Global Active Power (kilowatts)")
  lines(power2day$Datetime, power2day$Global_active_power)
  dev.off()
}