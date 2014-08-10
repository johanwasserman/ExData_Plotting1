source("prep.R")

plot4 <- function() { 
  if (!exists("pdata")) {
    pdata <- prep()
  }
  
  png("plot4.png", width=400, height=400)
  
  # set 2 column and 2 rowsfor graphics
  par(mfrow=c(2,2))

  # plot Global Active Power
  plot(pdata$Time, pdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

  # plot Voltage
  plot(pdata$Time, pdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

  # plot Enertgy sub metering
  plot(pdata$Time, pdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(pdata$Time, pdata$Sub_metering_2, col="red")
  lines(pdata$Time, pdata$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=1, box.lwd=0, bty="n")

  # plot Global reactivepower
  plot(pdata$Time, pdata$Global_reactive_power, type="n", xlab="datetime", ylab="Global reactive power")
  lines(pdata$Time, pdata$Global_reactive_power)
  
  dev.off()
}