#This script creates Plot 1 of the assignment, a histogram of Global Active Power 
#in red with specified labels, in PNG format

#The data file should be in the working directory

plot1 <- function() {
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  power2day <- rbind(power[power$Date == "1/2/2007", ], power[power$Date == "2/2/2007", ])
  
  png(filename = "Plot1.png")
  hist(power2day$Global_active_power, col = "red", 
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}