source1 <- "./data/household_power_consumption.txt"
data <- read.table(source1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSource1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalPW <- as.numeric(subSource1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalPW, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()