plot2 <- function() {
    powerdata <- read.table("household_power_consumption.txt", header = T, sep = ";", as.is = c(3:9))
    powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
    powerdata <- powerdata[powerdata$Date %in% as.Date(c("2007-02-01", "2007-02-02"), format = "%Y-%m-%d"),]
    datetime <- paste(powerdata$Date, powerdata$Time)
    powerdata$Weekday <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
    png(file = "plot2.png", width = 480, height = 480)
    plot(powerdata$Weekday, as.double(powerdata$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    dev.off()
}