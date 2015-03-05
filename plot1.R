#read in original data set
powerData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#subset it for the two dates we need
smallData <-  rbind(subset(powerData, powerData$Date=="1/2/2007" ) , subset(powerData, powerData$Date=="2/2/2007" ))
#update data types 
smallData$Global_active_power <-  (as.double(as.character(smallData$Global_active_power)))
smallData$Global_reactive_power <-  (as.double(as.character(smallData$Global_reactive_power)))
smallData$Sub_metering_1 <-  (as.double(as.character(smallData$Sub_metering_1)))
smallData$Sub_metering_2 <-  (as.double(as.character(smallData$Sub_metering_2)))
smallData$Sub_metering_3 <-  (as.double(as.character(smallData$Sub_metering_3)))
smallData$Voltage <-  (as.double(as.character(smallData$Voltage)))
smallData$Time2<- paste(smallData$Date, smallData$Time, sep = " ")
smallData$Date <- as.Date(smallData$Date, format="%d/%m/%Y")
smallData$Time2 <- strptime(smallData$Time2,format="%d/%m/%Y %H:%M:%S")
smallData$DayOfWeek <- as.factor(weekdays(smallData$Date, TRUE))




#plot 1 directly to png.  Cannot copy from screen because it messages with sizing and cuts off legend
png(file="plot1.png",width=480,height=480)
par(mfrow = c(1, 1))
with(smallData, hist(Global_active_power, main = "Global Active Power", col="Red", xlab="Global Active Power (kilowatts)"))
dev.off() 
