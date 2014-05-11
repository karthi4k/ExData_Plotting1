plot3 <- function(){

	#Load data
	data=read.csv("data/power.txt",sep=";",header=T);

	#Select data for 2007/2/1 and 2007/2/2/
	data=z[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

	data$dt=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
	data$Sub_metering_1=as.numeric(as.character(data$Sub_metering_1),na.rm=T)
	data$Sub_metering_2=as.numeric(as.character(data$Sub_metering_2),na.rm=T)
	data$Sub_metering_3=as.numeric(as.character(data$Sub_metering_3),na.rm=T)

	#open png graphic device
	png("plot/plot3.png")
	plot(data$dt,data$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="Datetime")
	points(data$dt,data$Sub_metering_2,type="l",col="red")
	points(data$dt,data$Sub_metering_3,type="l",col="blue")
	legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	dev.off()

}