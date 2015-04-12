plot1 <- function(){
	# Reading data
    tmp <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
    tmp$Date <- as.Date(tmp$Date, format="%d/%m/%Y")
    tmp <- tmp[tmp$Date >= as.Date("2007-02-01") & tmp$Date<=as.Date("2007-02-02"),]
	# Creating PNG File
    png("plot1.png", width=480, height=480)
    par(mar=c(4.7, 4.7, 0.7, 0.7))
    hist(tmp$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
    dev.off()
}