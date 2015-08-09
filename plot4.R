#SET UP
Sys.setlocale("LC_TIME", "en_US.UTF-8")
energy<-read.csv(file = "household_power_consumption.txt", sep = ";")
energy$Date<-as.Date(energy$Date, format = "%d/%m/%Y")
energyCut <- subset(energy, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
energyCut$Global_active_power<-as.numeric(as.character(energyCut$Global_active_power))
datetime<-as.POSIXct(paste(energyCut$Date, energyCut$Time), format="%Y-%m-%d %H:%M:%S")
energyCut<-cbind(energyCut, datetime)

#PLOT 4

energyCut$Voltage<-as.numeric(as.character(energyCut$Voltage))
energyCut$Global_reactive_power<-as.numeric(as.character(energyCut$Global_reactive_power))
energyCut$Sub_metering_1<-as.numeric(as.character(energyCut$Sub_metering_1))
energyCut$Sub_metering_2<-as.numeric(as.character(energyCut$Sub_metering_2))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(energyCut, {
plot(datetime, Global_active_power, type = "l", xlab="", ylab = "Global Active Power")
plot(datetime, Voltage, type = "l", ylab = "Voltage")
{plot(datetime, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), box.lwd = 0.5, cex = 0.4, legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1))
}
plot(datetime, Global_reactive_power, type = "l", lwd=0.8)
})

dev.copy(png, file = "plot4.png")
dev.off()

