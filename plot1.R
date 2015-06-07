file=read.table("household_power_consumption.txt",sep=";",na.strings="?",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
hist(as.numeric(file$Global_active_power),xlab="Global Active Power (kilowatts)",col="red", main="Global Active Power")
file$Date=as.Date(file$Date,format="%d/%m/%Y")
dev.copy(png,file="plot1.png",width = 480, height = 480, units = "px")