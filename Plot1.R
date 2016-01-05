##First all data is read and then a subset is taken.

Dataset<-read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
Dataset<-subset(Dataset, Date=="2/2/2007"|Date=="1/2/2007")

png("plot1.png")        #Initiate plot

hist(Dataset$Global_active_power,
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")

dev.off()               #Close plot