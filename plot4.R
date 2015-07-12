initial <- read.table("household_power_consumption.txt",nrow=10,sep=";",header=TRUE)
classes<-sapply(initial,class)


data <- read.table("household_power_consumption.txt",sep=";",header=TRUE, colClasses = classes, na.strings="?")

data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")

data2 <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]

data2$time2 <- as.POSIXct(paste(data2$Date,data2$Time), format ="%Y-%m-%d %H:%M:%S")

data_names <- colnames(data2)

png(file = "plot4.png")

par(mfcol = c(2,2))

plot(data2$time2,data2[,3],type="n", xlab = "",ylab="Global Active Power (kilowatts)")
lines(data2$time2,data2[,3])


plot(data2$time2,data2[,7],type="n", xlab = "",ylab="Energy sub metering")
lines(data2$time2,data2[,7], col="black")
lines(data2$time2,data2[,8], col="red")
lines(data2$time2,data2[,9], col="blue")
legend("topright", col = c("black","red","blue"), legend = data_names[7:9], lty=c(1,1,1), text.font =1, y.intersp  
=.5, xjust=1, box.lwd=0)


plot(data2$time2,data2[,5],type="n", xlab = "datetime",ylab="Voltage")
lines(data2$time2,data2[,5])

plot(data2$time2,data2[,4],type="n", xlab = "datetime",ylab="Global_reactive_power")
lines(data2$time2,data2[,4])


dev.off();

