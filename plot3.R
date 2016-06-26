#Get required data to dataframe called pwcon
library(data.table)
fileName <- "household_power_consumption.txt"
pwcon <- fread(fileName, na.strings = c("?"), colClasses = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
pwcon$Date <- as.Date(pwcon$Date, "%d/%m/%Y")
pwcon <- subset(pwcon, (pwcon$Date == as.Date("2007-02-01") | pwcon$Date == as.Date("2007-02-02")))

#Get data and time
datetime <- paste(pwcon$Date, pwcon$Time)
datetime <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")

#Draw graph
# 1. Sub_metering_1
plot(datetime, pwcon$Sub_metering_1 ,type = "l", xlab = "", ylab = "Energy sub metering")

#2. Add Sub_metering_2
lines(datetime, pwcon$Sub_metering_2 ,type = "l", col = "red")

#3. Add Sub_metering_3
lines(datetime, pwcon$Sub_metering_3 ,type = "l", col = "blue")

#Add Legend
legend("topright",  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"), lty = c(1, 1, 1), pt.cex = 2, cex = 0.6)

#Copy to png file
dev.copy(png, file = "plot3.png")

#Close png graphic device
dev.off()
