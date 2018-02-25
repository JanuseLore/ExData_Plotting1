#Reading Data
mydata<- read.table("C:/Users/jticsay/Desktop/EDA Week 1 Course Project/household_power_consumption.txt", sep=";", header=TRUE)
submydata<- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")

#Producing Plots and Title
hist(as.numeric(as.character(submydata$Global_active_power)),col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")
