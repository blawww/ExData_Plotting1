initial <- read.table("household_power_consumption.txt",nrow=10,sep=";",header=TRUE)
classes<-sapply(initial,class)


data <- read.table("household_power_consumption.txt",sep=";",header=TRUE, colClasses = classes, na.strings="?")

data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")

data2 <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]

data2$time2 <- as.POSIXct(paste(data2$Date,data2$Time), format ="%Y-%m-%d %H:%M:%S")

data_names <- colnames(data2)

png(file = "plot3.png")

plot(data2$time2,data2[,7],type="n", xlab = "",ylab="Energy sub metering")
lines(data2$time2,data2[,7], col="black")
lines(data2$time2,data2[,8], col="red")
lines(data2$time2,data2[,9], col="blue")
legend("topright", col = c("black","red","blue"), legend = data_names[7:9], lty=c(1,1,1))

dev.off();

