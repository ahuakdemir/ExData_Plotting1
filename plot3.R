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
png(file="plot3.png",width = 480, height = 480)

#takes the values of Sub_metering_1,_2 and _3 values which are not equal to "?"
#then draws the plot with additional properties such as 
#title, x axis label, legend etc.
plot(as.numeric(as.character(data2$Sub_metering_1[which(data2$Sub_metering_1!="?")])),
	ylab="Energy sub metering",xlab="",
	type="l",xaxt='n')
lines(as.numeric(as.character(data2$Sub_metering_2[which(data2$Sub_metering_2!="?")])),col="red")
lines(as.numeric(as.character(data2$Sub_metering_3[which(data2$Sub_metering_3!="?")])),col="blue")
axis(1,at=dateAxisIndex,labels=format(dateAxis,"%a"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))

#closes the png connection
dev.off()

