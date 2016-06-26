#Get required data to dataframe called pwcon
library(data.table)
fileName <- "household_power_consumption.txt"
pwcon <- fread(fileName, na.strings = c("?"), colClasses = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
pwcon$Date <- as.Date(pwcon$Date, "%d/%m/%Y")
pwcon <- subset(pwcon, (pwcon$Date == as.Date("2007-02-01") | pwcon$Date == as.Date("2007-02-02")))

#Get data and time
datetime <- paste(pwcon$Date, pwcon$Time)
datetime <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")

#Plot line graph
plot(datetime, pwcon$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

#Copy graph to png file
dev.copy(png, file = "plot2.png")

#Shutdown png device
dev.off()
