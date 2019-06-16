
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

# Plot 1
attach(powerCD)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# creating the image of the plot
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(powerCD)
