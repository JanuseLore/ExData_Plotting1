#Reading and Processing
mydata<- read.table("C:/Users/jticsay/Desktop/EDA Week 1 Course Project/household_power_consumption.txt", sep=";", header=TRUE)
submydata<- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")

#Transformation of Date and Time Variables into objects of type DATE and POSIXLt
submydata$Date <- as.Date(submydata$Date, format="%d/%m/%Y")
submydata$Time <- strptime(submydata$Time, format="%H:%M:%S")
submydata[1:1440,"Time"] <- format(submydata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
submydata[1441:2880,"Time"] <- format(submydata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Producing Plot and Title
plot(submydata$Time,submydata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(submydata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(submydata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(submydata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty = 1,lwd = 2.5, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")
