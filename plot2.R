getwd();
setwd("C:\\Users\\thien nguyen\\Desktop\\class\\coursera_data_sience\\explortory analyis\\week1");

originalDataSet <- read.table("household_power_consumption.txt",sep = ";" , header = TRUE);

originalDataSet$Date <- as.Date(originalDataSet$Date,"%d/%m/%Y")

DataSetByDate <- originalDataSet[originalDataSet$Date >= "2007-02-01" & originalDataSet$Date <= "2007-02-02", ]

attach(DataSetByDate);

par(mfrow = c(1,1))
par(mar = c(6,6,3,3))

dateTime <- as.POSIXct(paste(Date,Time),format="%Y-%m-%d %H:%M:%S");

plot(dateTime,as.numeric(as.character(Global_active_power)),type = "l",xlab = "", ylab = "Global Active Power (kilowatts)");

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()



