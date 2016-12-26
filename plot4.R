## Reading the data into R

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

## Changing the class of the Date variable to date
## Subsetting on 2007-02-01 and 2007-02-02
## Adding the tot_time variable: date & time
## Changing the class of the tot_time variable to Date

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data2 <- transform(data2, tot_time = paste(Date, Time))
data2$tot_time <- as.POSIXct(data2[,c(10)])

## Removing the original data

rm(data)

## Plotting the forth graph into a png file

png(file = "plot4.png")
par(mfrow = c(2,2))
with(data2, {
	plot(tot_time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
	plot(tot_time, Voltage, type = "l", ylab = "Global Active Power", xlab = "datetime")
	plot(tot_time, Sub_metering_1, type = "l", ylab = "Energy sub etering", xlab = "")
	lines(tot_time, Sub_metering_2, col = "red")
	lines(tot_time, Sub_metering_3, col = "blue")
	legend("topright", box.lty = 0, col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(tot_time, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()
