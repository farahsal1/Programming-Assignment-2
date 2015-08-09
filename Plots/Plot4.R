setwd("C:/Users/farah_2/Desktop/EDA Project 1")
getwd()
data<-read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("Time"="character"), na.strings=c("?"))

data$Date<-as.Date(data$Date, "%d/%m/%Y")

power<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
power$DateTime<-paste(power$Date,power$Time)
power$DateTime<-as.POSIXct(power$DateTime)


par(mfrow=c(2,2), mar=c(4,4,2,2))
plot(power$DateTime,power$Global_active_power, pch=".", xlab="", ylab="Global Active Power")
lines(power$DateTime,power$Global_active_power)
plot(power$DateTime, power$Voltage, pch=".", xlab="datetime", ylab="Voltage")
lines(power$DateTime, power$Voltage)
plot(power$DateTime, power$Sub_metering_1, pch=".", ylab="Energy sub metering", xlab="")
lines(power$DateTime, power$Sub_metering_1)
lines(power$DateTime, power$Sub_metering_2)
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lwd=2)
plot(power$DateTime,power$Global_reactive_power, pch=".", xlab="datetime", ylab="Global_reactive_power")
lines(power$DateTime,power$Global_reactive_power)

dev.copy(png,file="Plot4.png", width=480, height=480)
dev.off() 
