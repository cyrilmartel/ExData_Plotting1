## The file "household_power_consumption.txt" was manually downloaded and saved in the working directory
library(dplyr)
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses= c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), stringsAsFactors = FALSE) ## Reads the csv file and attributes proper classes to columns
data <- tbl_df(data)
data2 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007") ##selects only the rows for 1st and 2nd Feb
data3 <- mutate (data2, datatime = paste (Date,Time))## pastes date and time together into a datatime column
data3$datatime <- strptime(data3$datatime, "%d/%m/%Y %H:%M:%S")## transforms datatime in a R date/time object
png("plot4.png")
par(mfrow = c(2,2))
plot(data3$datatime, data3$Global_active_power,type = "l", main = NULL, xlab = NA, ylab = "Global Active Power") 
plot(data3$datatime, data3$Voltage,type = "l", main = NULL, xlab = "datetime", ylab = "Voltage")
plot(data3$datatime, data3$Sub_metering_1,type = "l", main = NULL, xlab = NA, ylab = "Energy sub metering") 
lines(data3$datatime,data3$Sub_metering_2,col="red")
lines(data3$datatime,data3$Sub_metering_3,col="blue")
legend("topright",bty ="n",lty = c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data3$datatime, data3$Global_reactive_power,type = "l", main = NULL, xlab = "datetime", ylab = "Global_reactive_power")
dev.off()