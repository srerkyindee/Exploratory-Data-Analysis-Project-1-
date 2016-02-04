library(dplyr)

setwd("D:/coursera/EDA")

#Set Full data
data_full <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", quote = '\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")


#subset
df <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


#Converting dates
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

#plot4
png(file = "plot4.png", bg = "white")
par(mfrow = c(2,2), mar = c(4,4,2,1))
with(df, {
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power", xlab = "")
  
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global_rective_power", xlab = "datetime")
})
dev.off()

