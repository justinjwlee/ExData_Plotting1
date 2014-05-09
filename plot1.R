plot1 <- function() {
    powerdata <- read.table("household_power_consumption.txt", header = T, sep = ";", as.is = c(3:9))
    powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
    powerdata <- powerdata[powerdata$Date %in% as.Date(c("2007-02-01", "2007-02-02"), format = "%Y-%m-%d"),]
    png(file = "plot1.png", width = 480, height = 480)
    hist(as.double(powerdata$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
    dev.off()
}