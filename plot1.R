
## The file "household_power_consumption.txt" was manually downloaded and saved in the working directory
library(dplyr)
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses= c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), stringsAsFactors = FALSE) ## Reads the csv file and attributes proper classes to columns
data <- tbl_df(data)
data2 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007") ##selects only the rows for 1st and 2nd Feb
data3 <- mutate (data2, datatime = paste (Date,Time))## pastes date and time together into a datatime column
data3$datatime <- strptime(data3$datatime, "%d/%m/%Y %H:%M:%S") ## transforms datatime in a R date/time object
png("plot1.png")
hist(data3$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()