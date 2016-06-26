#Get required data to dataframe called pwcon
library(data.table)
fileName <- "household_power_consumption.txt"
pwcon <- fread(fileName, na.strings = c("?"), colClasses = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
pwcon$Date <- as.Date(pwcon$Date, "%d/%m/%Y")
pwcon <- subset(pwcon, (pwcon$Date == as.Date("2007-02-01") | pwcon$Date == as.Date("2007-02-02")))

par(mfrow = c(2,2), mar = c(4, 4, 2, 1))

#Plot 1 row 1, column 1
plot(datetime, pwcon$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Plot 2
plot(datetime, pwcon$Voltage, ylab = "Voltage", type = "l")

#Plot 3
# 1. Sub_metering_1
plot(datetime, pwcon$Sub_metering_1 ,type = "l", xlab = "", ylab = "Energy sub metering")

#2. Add Sub_metering_2
lines(datetime, pwcon$Sub_metering_2 ,type = "l", col = "red")

#3. Add Sub_metering_3
lines(datetime, pwcon$Sub_metering_3 ,type = "l", col = "blue")

#Add Legend
legend("topright",  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"), lty = c(1, 1, 1), cex = 0.5)

#Plot 4
plot(datetime, pwcon$Global_reactive_power, ylab = "Global_reactive_power", type = "l")

#Copy to png file
dev.copy(png, file = "plot4.png")

#Close png graphic device
dev.off()