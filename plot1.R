source("prep.R")

if (!exists("pdata")) {
  pdata <- prep()
}

png("plot1.png", width=400, height=400)

hist(pdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="orangered")

dev.off()