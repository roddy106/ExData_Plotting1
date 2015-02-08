## Assignment: Electricity Data
## Week 1 Explanatory Analytics Course

## Author: RS Grewal

## Objective:

## File loading
## Given the size of the file and the loading likely on the UCI ML database
## I will save the file once to my machine and then in future runs use that

filename <- "household_power_consumption.txt"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists(filename)){
    temp <- tempfile()
    download.file(fileUrl, destfile = temp, method ="curl")
    unzip(temp)
    dateDownloaded <- date()
}

## electricity_data <- read.csv(filename,  na.strings ="?", sep=";", nrows = 100)
electricity_data <- read.csv(filename,  na.strings ="?", sep=";")


## Convert the date column from character to date
## This time we need to create a new time column as well

electricity_data$Time <- strptime(paste(electricity_data$Date,electricity_data$Time), "%d/%m/%Y %H:%M:%S") 
electricity_data$Date <- as.Date(electricity_data$Date,"%d/%m/%Y")
     
data <- electricity_data[electricity_data$Date %in% as.Date(c("2007-02-01","2007-02-02")), c("Time","Global_active_power")]

rm(list = "electricity_data")

png(filename="plot2.png", width=480, height = 480)
plot(data,
    ylab="Global Active Power (kilowatts)",
    xlab="",
    col ="black",
    type = "l"
)

dev.off()

