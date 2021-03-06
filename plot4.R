##First all data is read and then a subset is taken.

Dataset<-read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
Dataset<-subset(Dataset, Date=="2/2/2007"|Date=="1/2/2007")

#Extra column created pasting date and time together
Dataset$DateTime <-strptime(paste(Dataset$Date, Dataset$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png")        #Initiate plot

par(mfrow = c(2,2))

#left upper plot (same as plot2)
plot(Dataset$DateTime, Dataset$Global_active_power, xlab="",
     ylab = "Global Active Power (kilowatts)", type = "l")

#right upper plot 
plot(Dataset$DateTime, Dataset$Voltage, xlab="datetime",
     ylab = "Voltage", type = "l")

#left bottom plot (same as plot3)
plot(Dataset$DateTime, Dataset$Sub_metering_1, xlab="", ylab = "Energy sub metering", 
     type = "l", col="black")

lines(Dataset$DateTime, Dataset$Sub_metering_2, type = "l", col = "red")
lines(Dataset$DateTime, Dataset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty= 1, bty="n", col = c("Black", "red", "blue"), 
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#right bottom plot
plot(Dataset$DateTime, Dataset$Global_reactive_power, xlab="datetime",
     ylab = "Global_reactive_power", type = "l")

dev.off()               #Close plot