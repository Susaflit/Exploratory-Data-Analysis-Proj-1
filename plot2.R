setwd("C:/Users/Andrew/Desktop/Data Sets")

file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)

setwd("C:/Users/Andrew/Desktop/RStudio/Exploratory-Data-Analysis-Proj-1")
str(data)


subData <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


activePowerData <- as.numeric(subData$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(dateTime, activePowerData, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()

