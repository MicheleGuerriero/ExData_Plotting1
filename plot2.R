#SET UP
Sys.setlocale("LC_TIME", "en_US.UTF-8")
energy<-read.csv(file = "household_power_consumption.txt", sep = ";")
energy$Date<-as.Date(energy$Date, format = "%d/%m/%Y")
energyCut <- subset(energy, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
energyCut$Global_active_power<-as.numeric(as.character(energyCut$Global_active_power))
datetime<-as.POSIXct(paste(energyCut$Date, energyCut$Time), format="%Y-%m-%d %H:%M:%S")
energyCut<-cbind(energyCut, datetime)

#PLOT 2

par("lwd"=1)
with(energyCut, plot(datetime, Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()