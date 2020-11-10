png("plot1.png",height = 480 , width = 480)
data_t<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
selected_data<-data_t[data_t$Date=="1/2/2007"|data_t$Date=="2/2/2007",]
selected_data$Global_active_power <- as.numeric(selected_data$Global_active_power)
hist(selected_data$Global_active_power,main="Global Active Power",xlab = "Global Active Power(kilowatts)",col="red")
dev.off()