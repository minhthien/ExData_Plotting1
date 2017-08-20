getwd();
setwd("C:\\Users\\thien nguyen\\Desktop\\class\\coursera_data_sience\\explortory analyis\\week1");

originalDataSet <- read.table("household_power_consumption.txt",sep = ";" , header = TRUE);

originalDataSet$Date <- as.Date(originalDataSet$Date,"%d/%m/%Y")

DataSetByDate <- originalDataSet[originalDataSet$Date >= "2007-02-01" & originalDataSet$Date <= "2007-02-02", ]

attach(DataSetByDate);

par(mfrow = c(2,2))
par(mar = c(6,6,3,3))

dateTime <- as.POSIXct(paste(Date,Time),format="%Y-%m-%d %H:%M:%S");


plot(dateTime,as.numeric(as.character(Global_active_power)),type = "l",xlab = "", ylab = "Global Active Power (kilowatts)");

plot(dateTime,Voltage,type ="l");

plot(dateTime,as.numeric(as.character(Sub_metering_1)),type="n",ylab = "Energy sub metering",xlab = "");
lines(dateTime,as.numeric(as.character(Sub_metering_1)),col ="dark gray");
lines(dateTime,as.numeric(as.character(Sub_metering_2)),col ="red");
lines(dateTime,as.numeric(as.character(Sub_metering_3)),col ="blue");
legend("topright",legend = c("Sub_metering_1  ","Sub_metering_2   ","Sub_metering_3   "),lty = c(1,1),col=c("dark gray","red","blue"),cex=0.8);

plot(dateTime,as.numeric(as.character(Global_reactive_power)),type="l",ylab = "Global_reactive_power");

dev.copy(png,"plot4.png",width=480,height=480)
dev.off()


