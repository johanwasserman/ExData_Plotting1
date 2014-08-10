# Prepares the psubset (power datasubset) table

library("data.table")
library("reshape2")
library("lubridate")

prep <-function() {

  # check if the data file we are interested in exists
  # if not, download and extract
  if (!file.exists("household_power_consumption.txt")) {
    # create a directory to work in
    dir.create(file.path(path.expand("~"), "/R"), showWarnings = FALSE)
    dir.create(file.path(path.expand("~"), "/R/DataScience"), showWarnings = FALSE)
    dir.create(file.path(path.expand("~"), "/R/DataScience/ExploratoryDataAnalysis"), showWarnings = FALSE)
    dir.create(file.path(path.expand("~"), "/R/DataScience/ExploratoryDataAnalysis/Project1"), showWarnings = FALSE)
    w_dir <- paste0(path.expand("~"), "/R/DataScience/ExploratoryDataAnalysis/Project1")
    setwd(w_dir)
    print(paste("Working directory is:", w_dir))

    # get the zipped data set and save it to the working directory
    power_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    power_zip <- paste0(w_dir, "/power.zip")
    download.file(power_url, power_zip)
    # and unzip the contents
    unzip(power_zip, exdir=w_dir)
  
    # do some clean-up
    rm(power_url)
    rm(power_zip)
  } # endif

  # read the table from the data file
  pdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
  
  # convert the time and date
  pdata$Time <- strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")
  pdata$Date <- as.Date( as.character(pdata$Date), "%d/%m/%Y")
  # subset the data we are interested in
  pdata<- subset(pdata, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
  
  return(pdata)
}