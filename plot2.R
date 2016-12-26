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

## Plotting the second graph into a png file

png(file = "plot2.png")
plot(Global_active_power~tot_time, data = data2, type ="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
