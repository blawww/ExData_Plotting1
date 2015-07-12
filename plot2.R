initial <- read.table("household_power_consumption.txt",nrow=10,sep=";",header=TRUE)
classes<-sapply(initial,class)


data <- read.table("household_power_consumption.txt",sep=";",header=TRUE, colClasses = classes, na.strings="?")

data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")

data2 <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]

data2$time2 <- as.POSIXct(paste(data2$Date,data2$Time), format ="%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")

plot(data2$time2,data2[,3],type="n", xlab = "",ylab="Global Active Power (kilowatts)")
lines(data2$time2,data2[,3])

dev.off();

