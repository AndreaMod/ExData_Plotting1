rm=(list=ls())
consumption=read.table("household_power_consumption.txt",sep=";",na.strings="?",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
consumption$Time=paste(consumption$Date,consumption$Time,sep=" ")
consumption$Time=strptime(consumption$Time,format="%d/%m/%Y %T ")
consumption$Date<-as.Date(consumption$Date,format="%d/%m/%Y")

consumption_sbst=subset(consumption,consumption$Date=="2007-02-01" | consumption$Date=="2007-02-02")

plot(consumption_sbst$Time,as.numeric(as.character(consumption_sbst$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width = 480, height = 480, units = "px")
dev.off()