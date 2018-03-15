
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

## strptime

x <- paste(datasubset$Date, datasubset$Time)
datasubset$datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")
head(datasubset)

## plot, with the days in dutch

plot(datasubset$datetime, datasubset$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

## save
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
