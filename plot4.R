source1 <- "./data/household_power_consumption.txt"
data <- read.table(source1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSource1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
DnT <- strptime(paste(subSource1$Date, subSource1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalRPW <- as.numeric(subSource1$Global_reactive_power)
globalPW <- as.numeric(subSource1$Global_active_power)
voltage <- as.numeric(subSource1$Voltage)
subMetering1 <- as.numeric(subSource1$Sub_metering_1)
subMetering2 <- as.numeric(subSource1$Sub_metering_2)
subMetering3 <- as.numeric(subSource1$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(DnT, globalPW, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(DnT, voltage, type="l", xlab="DnT", ylab="Voltage")

plot(DnT, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DnT, subMetering2, type="l", col="red")
lines(DnT, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(DnT, globalRPW, type="l", xlab="DnT", ylab="Global_reactive_power")

dev.off()