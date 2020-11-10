png("plot2.png",height = 480 , width = 480)
data_t<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
selected_data<-data_t[data_t$Date=="1/2/2007"|data_t$Date=="2/2/2007",]
selected_data$date_time<-paste0(selected_data$Date," ",selected_data$Time)
selected_data$Global_active_power <- as.numeric(selected_data$Global_active_power)
selected_data$date_time <- strptime(selected_data$date_time,"%d/%m/%Y %H:%M:%S")
plot(selected_data$date_time,selected_data$Global_active_power,type="l",ylab = "Global Active Power(kilowatts)",xlab="")
dev.off()