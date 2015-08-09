#SET UP

energy<-read.csv(file = "household_power_consumption.txt", sep = ";")
energy$Date<-as.Date(energy$Date, format = "%d/%m/%Y")
energyCut <- subset(energy, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
energyCut$Global_active_power<-as.numeric(as.character(energyCut$Global_active_power))
datetime<-as.POSIXct(paste(energyCut$Date, energyCut$Time), format="%Y-%m-%d %H:%M:%S")
energyCut<-cbind(energyCut, datetime)

#PLOT 1
par(cex.lab=0.8, cex.main=1)
hist(energyCut$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()