
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
## Global_active_power to numeric



datasubset$Global_active_power <- as.numeric(as.character(datasubset$Global_active_power))

## histogram

hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red")

## save as plot1.png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()







