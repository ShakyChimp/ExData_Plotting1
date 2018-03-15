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


datasubset$Sub_metering_1 <- as.numeric(as.character(datasubset$Sub_metering_1))
datasubset$Sub_metering_2 <- as.numeric(as.character(datasubset$Sub_metering_2))
datasubset$Sub_metering_3 <- as.numeric(as.character(datasubset$Sub_metering_3))
head(datasubset)

## strptime

x <- paste(datasubset$Date, datasubset$Time)
datasubset$datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")
head(datasubset)

## making plot

plot(datasubset$datetime, datasubset$Sub_metering_1, type = "l", 
     ylab = "Energy Submetering", xlab = "" )
lines(datasubset$datetime, datasubset$Sub_metering_2, type = "l", col= "red")
lines(datasubset$datetime, datasubset$Sub_metering_3, type = "l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 2)
?legend

## save
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
