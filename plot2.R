plot2 <- function() {
	# Reading data
    tmp <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
    tmp$Date <- as.Date(tmp$Date, format="%d/%m/%Y")
    tmp <- tmp[tmp$Date >= as.Date("2007-02-01") & tmp$Date<=as.Date("2007-02-02"),]
    tmp$Date <- as.POSIXct(paste(as.Date(tmp$Date, format="%d/%m/%Y"), tmp$Time, sep=" "))
	# Creating PNG File
    png("plot2.png", width=480, height=480)
    plot(tmp$Date, tmp$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
}