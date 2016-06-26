#Get required data to dataframe called pwcon
library(data.table)
fileName <- "household_power_consumption.txt"
pwcon <- fread(fileName, na.strings = c("?"), colClasses = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
pwcon$Date <- as.Date(pwcon$Date, "%d/%m/%Y")
pwcon <- subset(pwcon, (pwcon$Date == as.Date("2007-02-01") | pwcon$Date == as.Date("2007-02-02")))

#Make histogram
hist(pwcon$Global_active_power, col = "red", xlab = "Global Active Power(kiloatts)", main = "Global Active Power")

#Copy to a png file
dev.copy(png, file = "plot1.png")

#shut down png device.
dev.off()