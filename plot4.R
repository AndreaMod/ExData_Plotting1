rm=(list=ls())
consumption=read.table("household_power_consumption.txt",sep=";",na.strings="?",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
consumption$Time=paste(consumption$Date,consumption$Time,sep=" ")
consumption$Time=strptime(consumption$Time,format="%d/%m/%Y %T ")
consumption$Date<-as.Date(consumption$Date,format="%d/%m/%Y")

consumption_sbst=subset(consumption,consumption$Date=="2007-02-01" | consumption$Date=="2007-02-02")

par(mfrow=c(2,2))
plot(consumption_sbst$Time,as.numeric(as.character(consumption_sbst$Global_active_power)),type="l",xlab="",ylab="Global Active Power")
plot(consumption_sbst$Time,as.numeric(as.character(consumption_sbst$Voltage)),type="l",xlab="",ylab="Voltage")
plot(consumption_sbst$Time,as.numeric(as.character(consumption_sbst$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering")
lines(consumption_sbst$Time,as.numeric(as.character(consumption_sbst$Sub_metering_2)),col="Red")
lines(consumption_sbst$Time,as.numeric(as.character(consumption_sbst$Sub_metering_3)),col="Blue")
legend("topright",pch=NA,lwd=1,cex=0.4,y.intersp=0.5,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(consumption_sbst$Time,as.numeric(as.character(consumption_sbst$Global_reactive_power)),type="l",xlab="",ylab="Global Reactive Power")
dev.copy(png,file="plot4.png",width = 480, height = 480, units = "px")
dev.off()