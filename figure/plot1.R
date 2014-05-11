plot1 <- function(){

	#Load data
	data=read.csv("data/power.txt",sep=";",header=T);

	#Select data for 2007/2/1 and 2007/2/2/
	data=z[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

	data$Global_active_power=as.numeric(as.character(data$Global_active_power),na.rm=T)
	
	#open png graphic device
	png("plot/plot1.png")
	hist(s$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
	dev.off()

}