#SET UP
Sys.setlocale("LC_TIME", "en_US.UTF-8")
energy<-read.csv(file = "household_power_consumption.txt", sep = ";")
energy$Date<-as.Date(energy$Date, format = "%d/%m/%Y")
energyCut <- subset(energy, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
energyCut$Global_active_power<-as.numeric(as.character(energyCut$Global_active_power))
datetime<-as.POSIXct(paste(energyCut$Date, energyCut$Time), format="%Y-%m-%d %H:%M:%S")
energyCut<-cbind(energyCut, datetime)

#PLOT 3

energyCut$Sub_metering_1<-as.numeric(as.character(energyCut$Sub_metering_1))
energyCut$Sub_metering_2<-as.numeric(as.character(energyCut$Sub_metering_2))

with(energyCut, plot(datetime, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering"))
with(energyCut, lines(datetime, Sub_metering_2, col="red"))
with(energyCut, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", col = c("black", "red", "blue"), box.lwd = 0.5, legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1))

dev.copy(png, file = "plot3.png")
dev.off()
