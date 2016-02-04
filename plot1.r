library(dplyr)
setwd("D:/coursera/EDA")

#Set Full data
data_full <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", quote = '\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")


#subset
df <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


#plot1
png(file = "plot1.png", bg = "white",width = 480, height = 480)
hist(df$Global_active_power,col = "red" , main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")
dev.off()
