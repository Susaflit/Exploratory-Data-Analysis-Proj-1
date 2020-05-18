setwd("C:/Users/Andrew/Desktop/Data Sets")

file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)

setwd("C:/Users/Andrew/Desktop/RStudio/Exploratory-Data-Analysis-Proj-1")
str(data)


subData <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

activePowerData <- as.numeric(data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(activePowerData, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

