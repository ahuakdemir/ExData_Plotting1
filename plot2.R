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
png(file="plot2.png",width = 480, height = 480)

#takes the values of Global_active_power which are not equal to "?"
#then draws the plot with additional properties such as 
#title, x axis label etc.
plot(as.numeric(as.character(data2$Global_active_power[which(data2$Global_active_power!="?")])),
	ylab="Global Active Power (kilowatts)",xlab="",
	type="l",xaxt='n')
axis(1,at=dateAxisIndex,labels=format(dateAxis,"%a"))

#closes the png connection
dev.off()