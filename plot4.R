## Loading data
data <- read.csv2("household_power_consumption.txt", sep = ";", na.strings = "?")
str(data)


## as.data format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
head(data)
str(data)


## making subset
datasubset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
str(datasubset)

## as.numeric

datasubset$Global_active_power <- as.numeric(as.character(datasubset$Global_active_power))
datasubset$Global_reactive_power <- as.numeric(as.character(datasubset$Global_reactive_power))
datasubset$Sub_metering_1 <- as.numeric(as.character(datasubset$Sub_metering_1))
datasubset$Sub_metering_2 <- as.numeric(as.character(datasubset$Sub_metering_2))
datasubset$Sub_metering_3 <- as.numeric(as.character(datasubset$Sub_metering_3))
datasubset$Voltage <- as.numeric(as.character(datasubset$Voltage))

head(datasubset)

## strptime

x <- paste(datasubset$Date, datasubset$Time)
datasubset$datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")
head(datasubset)


## plot
par(mfrow = c(2,2))
plot(datasubset$datetime, datasubset$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
plot(datasubset$datetime, datasubset$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")
plot(datasubset$datetime, datasubset$Sub_metering_1, type = "l", 
     ylab = "Energy Submetering", xlab = "" )
lines(datasubset$datetime, datasubset$Sub_metering_2, type = "l", col= "red")
lines(datasubset$datetime, datasubset$Sub_metering_3, type = "l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n", cex = 0.5, lwd = 2)
plot(datasubset$datetime, datasubset$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

## save
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

