source1 <- "./data/household_power_consumption.txt"
data <- read.table(source1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSource1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalPW <- as.numeric(subSource1$Global_active_power)
DnT <- strptime(paste(subSource1$Date, subSource1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subM1 <- as.numeric(subSource1$Sub_metering_1)
subM2 <- as.numeric(subSource1$Sub_metering_2)
subM3 <- as.numeric(subSource1$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(DnT, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(DnT, subM2, type="l", col="red")
lines(DnT, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()