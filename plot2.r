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

#plot2
png(file = "plot2.png", bg = "white",width = 480, height = 480)
plot(df$Global_active_power ~ df$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

