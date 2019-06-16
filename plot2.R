
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

# Plot #2
powerCD$datetime <- as.POSIXct(powerCD$datetime)
attach(powerCD)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

#Creating the graph image
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(powerCD)
