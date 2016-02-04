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


#plot3
png(file = "plot3.png", bg = "white",width = 480, height = 480)
with(df,{
  plot(df$Sub_metering_1 ~ df$Datetime,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(df$Sub_metering_2 ~ df$Datetime ,col = "red")
  lines(df$Sub_metering_3 ~ df$Datetime ,col = "blue")})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
