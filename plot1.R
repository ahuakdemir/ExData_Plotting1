#sets the working directory
setwd("C:\\Users\\ahu.akdemir\\Desktop\\COURSERA\\Exploratory Data Analysis\\w1")

#reads the data
data<-read.table("household_power_consumption.txt",sep=";",header=T)

#takes only the rows corresponding to 1/2/2007 and 2/2/2007
data2<-data[union(which(data$Date=="1/2/2007"),which(data$Date=="2/2/2007")),]

#opens the png file connection
png(file="plot1.png",width = 480, height = 480)

#takes the values of Global_active_power which are not equal to "?"
#then draws the histogram with additional properties such as 
#title, x axis label and coloring
hist(as.numeric(as.character(data2$Global_active_power[which(data2$Global_active_power!="?")])),
	main="Global Active Power",
	xlab="Global Active Power (kilowatts)",
	col="red")

#closes the png connection
dev.off()