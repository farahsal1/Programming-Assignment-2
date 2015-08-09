setwd("C:/Users/farah_2/Desktop/EDA Project 1")
getwd()
data<-read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("Time"="character"), na.strings=c("?"))

data$Date<-as.Date(data$Date, "%d/%m/%Y")

power<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
power$DateTime<-paste(power$Date,power$Time)
power$DateTime<-as.POSIXct(power$DateTime)


par(mfrow=c(1,1))
plot(power$DateTime, power$Global_active_power, pch=".", xlab="", ylab="Global Active Power(kilowatts)")
lines(power$DateTime, power$Global_active_power)

dev.copy(png,file="Plot2.png", width=480, height=480)
dev.off() 
