##First all data is read and then a subset is taken.

Dataset<-read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
Dataset<-subset(Dataset, Date=="2/2/2007"|Date=="1/2/2007")

#Extra column created psting date and time together
Dataset$DateTime <-paste(Dataset$Date, Dataset$Time)

png("plot2.png")        #Initiate plot

plot(strptime(Dataset$DateTime, "%d/%m/%Y %H:%M:%S"), Dataset$Global_active_power,
     xlab="",
     ylab = "Global Active Power (kilowatts)", 
     type = "l")

dev.off()               #Close plot