source("prep.R")

if (!exists("pdata")) {
  pdata <- prep()
}

png("plot2.png", width=400, height=400)

plot(pdata$Time, pdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()