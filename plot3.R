plot3 <- function() {
    powerdata <- read.table("household_power_consumption.txt", header = T, sep = ";", as.is = c(3:9))
    powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
    powerdata <- powerdata[powerdata$Date %in% as.Date(c("2007-02-01", "2007-02-02"), format = "%Y-%m-%d"),]
    datetime <- paste(powerdata$Date, powerdata$Time)
    powerdata$Weekday <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
    png(file = "plot3.png", width = 480, height = 480)
    with(powerdata, {
        plot(Weekday, Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
        lines(Weekday, Sub_metering_2, col = "red")
        lines(Weekday, Sub_metering_3, col = "blue")
    })
    legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}