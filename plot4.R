#sets the working directory
setwd("C:\\Users\\ahu.akdemir\\Desktop\\COURSERA\\Exploratory Data Analysis\\w1")

#reads the data
data<-read.table("household_power_consumption.txt",sep=";",header=T)

#takes only the rows corresponding to 1/2/2007 and 2/2/2007
data2<-data[union(which(data$Date=="1/2/2007"),which(data$Date=="2/2/2007")),]

#creates the x axis values
date<-as.Date(strptime(data2[,1], format="%d/%m/%Y"))
dateAxisIndex<-c(1,1440,2880)
dateAxis<-date[dateAxisIndex]+1
dateAxis[1]<-dateAxis[1]-1


#opens the png file connection
png(file="plot4.png",width = 480, height = 480)

#sets the plot are with 2 rows and 2 columns
par(mfrow=c(2,2))

#takes the values of Global_active_power which are not equal to "?"
#then draws the plot with additional properties such as 
#title, x axis label etc
plot(as.numeric(as.character(data2$Global_active_power[which(data2$Global_active_power!="?")])),
	ylab="Global Active Power (kilowatts)",xlab="",
	type="l",xaxt='n')
axis(1,at=dateAxisIndex,labels=format(dateAxis,"%a"),cex.axis=0.9)


#takes the values of Voltage which are not equal to "?"
#then draws the plot with additional properties such as 
#title, x axis label etc
plot(as.numeric(as.character(data2$Voltage[which(data2$Voltage!="?")])),
	ylab="Voltage",xlab="datetime",
	type="l",xaxt='n',cex.axis=0.7)
axis(1,at=dateAxisIndex,labels=format(dateAxis,"%a"),cex.axis=0.9)

#takes the values of Sub_metering_1,_2 and _3 values which are not equal to "?"
#then draws the plot with additional properties such as 
#title, x axis label, legend etc.
plot(as.numeric(as.character(data2$Sub_metering_1[which(data2$Sub_metering_1!="?")])),
	ylab="Energy sub metering",xlab="",
	type="l",xaxt='n',cex.axis=0.7)
lines(as.numeric(as.character(data2$Sub_metering_2[which(data2$Sub_metering_2!="?")])),col="red")
lines(as.numeric(as.character(data2$Sub_metering_3[which(data2$Sub_metering_3!="?")])),col="blue")
axis(1,at=dateAxisIndex,labels=format(dateAxis,"%a"),cex.axis=0.9)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"),cex=0.9,bty="n")

#takes the values of Global_reactive_power which are not equal to "?"
#then draws the plot with additional properties such as 
#title, x axis label etc
plot(as.numeric(as.character(data2$Global_reactive_power[which(data2$Global_reactive_power!="?")])),
	ylab="Global_reactive_power",xlab="datetime",
	type="l",xaxt='n',cex.axis=0.7)
axis(1,at=dateAxisIndex,labels=format(dateAxis,"%a"),cex.axis=0.9)

#closes the png connection
dev.off()