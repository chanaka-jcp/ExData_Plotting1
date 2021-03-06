png("plot4.png",height = 480 , width = 480)
data_t<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
selected_data<-data_t[data_t$Date=="1/2/2007"|data_t$Date=="2/2/2007",]
selected_data$date_time<-paste0(selected_data$Date," ",selected_data$Time)
selected_data$date_time <- strptime(selected_data$date_time,"%d/%m/%Y %H:%M:%S")
selected_data$Global_active_power <- as.numeric(selected_data$Global_active_power)
selected_data$Voltage <- as.numeric(selected_data$Voltage)
selected_data$Sub_metering_1 <- as.numeric(selected_data$Sub_metering_1)
selected_data$Sub_metering_2 <- as.numeric(selected_data$Sub_metering_2)
selected_data$Sub_metering_3 <- as.numeric(selected_data$Sub_metering_3)
selected_data$Global_reactive_power<-as.numeric(selected_data$Global_reactive_power)
par(mfrow=c(2,2))
plot(selected_data$date_time,selected_data$Global_active_power,type="l",ylab = "Global Active Power(kilowatts)",xlab="")
plot(selected_data$date_time,selected_data$Voltage,type="l",ylab = "Voltage",xlab="datetime")
plot(selected_data$date_time,selected_data$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab="")
points(selected_data$date_time,selected_data$Sub_metering_2,type="l",col="red")
points(selected_data$date_time,selected_data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, bty = "n")
plot(selected_data$date_time,selected_data$Global_reactive_power,type="l",ylab = "Global_rective_power",xlab="datetime")
dev.off()