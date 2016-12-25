## Reading the data into R

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

## Changing the class of the Date variable to date
## Subsetting on 2007-02-01 and 2007-02-02

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

## Removing the original data

rm(data)

## Plotting the first graph into a png file

png(file = "plot1.png")
hist(data2$Global_active_power, nclass = 12, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", xlim = c(0,6), xaxt = "n")
axis(1, at = c(0,2, 4 ,6))
dev.off()
