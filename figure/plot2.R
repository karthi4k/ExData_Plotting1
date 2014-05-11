plot2 <- function(){

	#Load data
	data=read.csv("data/power.txt",sep=";",header=T);

	#Select data for 2007/2/1 and 2007/2/2/
	data=z[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

	data$dt=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
	data$Global_active_power=as.numeric(as.character(data$Global_active_power),na.rm=T)
	
	#open png graphic device
	png("plot/plot2.png")
	plot(s$dt,s$Global_active_power,type="l",ylab="Global Active Power (Kilowatts)", xlab="Datetime")
	dev.off()

}