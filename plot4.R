plot4 <- function(){
	# Reading data
    tmp <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
    tmp$Date <- as.Date(tmp$Date, format="%d/%m/%Y")
    tmp <- tmp[tmp$Date >= as.Date("2007-02-01") & tmp$Date<=as.Date("2007-02-02"),]
    tmp$Date <- as.POSIXct(paste(as.Date(tmp$Date, format="%d/%m/%Y"), tmp$Time, sep=" "))
	# Creating PNG File
    png("plot4.png", width=480, height=480)
	# 4 Plots in 1 File
    par(mfrow=c(2,2))
    plot(tmp$Date, tmp$Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(tmp$Date, tmp$Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(tmp$Date, tmp$Sub_metering_1, type="n", lwd=1, ylim=c(0, max(c(tmp$Sub_metering_1, tmp$Sub_metering_2, tmp$Sub_metering_3))), xlab="", ylab="Energy sub metering")
    lines(tmp$Date, tmp$Sub_metering_1, col="black")
    lines(tmp$Date, tmp$Sub_metering_2, col="red")
    lines(tmp$Date, tmp$Sub_metering_3, col="blue")
    legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), box.lwd=0)
    plot(tmp$Date, tmp$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")
    dev.off()
}