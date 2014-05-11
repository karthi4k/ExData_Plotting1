plot4 <- function(){

	#Load data
	#data=read.csv("data/power.txt",sep=";",header=T);

	#Select data for 2007/2/1 and 2007/2/2/
	#data=z[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

	data$dt=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
	s$Global_active_power=as.numeric(as.character(s$Global_active_power),na.rm=T)
	s$Global_reactive_power=as.numeric(as.character(s$Global_reactive_power),na.rm=T)
	data$Sub_metering_1=as.numeric(as.character(data$Sub_metering_1),na.rm=T)
	data$Sub_metering_2=as.numeric(as.character(data$Sub_metering_2),na.rm=T)
	data$Sub_metering_3=as.numeric(as.character(data$Sub_metering_3),na.rm=T)

	#open png graphic device
	png("plot/plot4.png")
	par(mfrow=c(2,2))
	hist(s$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
	plot(s$dt,s$Global_active_power,type="l",ylab="Global Active Power (Kilowatts)", xlab="Datetime")
	plot(data$dt,data$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="Datetime")
	points(data$dt,data$Sub_metering_2,type="l",col="red")
	points(data$dt,data$Sub_metering_3,type="l",col="blue")
	legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(s$dt,s$Global_reactive_power,type="l", xlab="Datetime")	
	dev.off()

}