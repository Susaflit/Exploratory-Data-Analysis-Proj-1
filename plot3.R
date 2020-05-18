setwd("C:/Users/Andrew/Desktop/Data Sets")

file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)

setwd("C:/Users/Andrew/Desktop/RStudio/Exploratory-Data-Analysis-Proj-1")
str(data)

## Take only Data from the required days
subData <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Take data from columns necessary to plot
subMetering <- data.frame(as.numeric(subData$Sub_metering_1), as.numeric(subData$Sub_metering_2), as.numeric(subData$Sub_metering_3))
names(subMetering) <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Make a line plot with legend
png("plot3.png", width = 480, height = 480)
plot(dateTime, subMetering[,1], type = "n", ylab = "Energy sub metering", xlab = "")
lines(dateTime, subMetering[,1], type = "l")
lines(dateTime, subMetering[,2], type = "l", col = "red")
lines(dateTime, subMetering[,3], type = "l", col = "blue")
legend("topright", names(subMetering), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()





