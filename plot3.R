
#Akhila Bhamidipati
#6/16/19
#Exploratory Data Analysis

#Power Consumption Data
rm(list = ls())
powerCD <- read.table("household_power_consumption.txt", header = T, 
                      sep = ";", na.strings = "?")

#Editing the data
powerCD$Date <- as.Date(powerCD$Date, format = "%d/%m/%Y")
powerCD <- subset(powerCD, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
powerCD$datetime <- strptime(paste(powerCD$Date, powerCD$Time), "%Y-%m-%d %H:%M:%S")

# Create plot 3
powerCD$datetime <- as.POSIXct(powerCD$datetime)

attach(powerCD)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Create plot 3 image
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(powerCD)
