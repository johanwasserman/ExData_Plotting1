source("prep.R")

if (!exists("pdata")) {
  pdata <- prep()
}

png("plot3.png", width=400, height=400)

plot(pdata$Time, pdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(pdata$Time, pdata$Sub_metering_2, col="orangered")
lines(pdata$Time, pdata$Sub_metering_3, col="dodgerblue")
legend("topright", col=c("black", "orangered", "dodgerblue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()