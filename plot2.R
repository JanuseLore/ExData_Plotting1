#Reading and Processing Data
mydata<- read.table("C:/Users/jticsay/Desktop/EDA Week 1 Course Project/household_power_consumption.txt", sep=";", header=TRUE)
submydata<- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")

#Transformation of Date and Time Variables into objects of type DATE and POSIXLt
submydata$Date <-as.Date(submydata$Date,format="%d %m %Y")
submydata$Time <-strptime(submydata$Time, format="%H: %M: %S")
submydata[1:1440,"Time"] <- format(submydata[1:1440,"Time"],"2007-02-01 %H: %M: %S")
submydata[1441:2880,"Time"] <- format(submydata[1441:2880,"Time"],"2007-02-02 %H: %M: %S")

#Producing Plot and Title
plot(submydata$Time,as.numeric(as.character(submydata$Global_active_power)),type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
title(main="Global Active Power Vs. Time")

