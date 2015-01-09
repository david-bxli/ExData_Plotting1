sourceUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(sourceUrl, destfile = "./household_power_consumption.zip" ,method = "curl")
household <- read.csv(unz("household_power_consumption.zip","household_power_consumption.txt"), na.strings = c("?"), sep = ";", skip = 66636, nrow = 60*48)
titlelist <- read.csv(unz("household_power_consumption.zip","household_power_consumption.txt"), na.strings = c("?"), sep = ";", nrow = 1)
names(household)<-names(titlelist)

png("./plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

with(household, plot(strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "s",xlab = "", ylab = "Global Active Power (kilowatts)"))
with(household, plot(strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Voltage, type = "s", ylab = "Voltage", xlab = "datetime"))
with(household, plot(strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"),Sub_metering_1, type = "s", xlab = "", ylab = "Energy sub metering"))
with(household, lines(strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"),Sub_metering_2, col = "red", type = "s"))
with(household, lines(strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"),Sub_metering_3, col = "blue", type = "s"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty = "n", col = c("black","red","blue"),pch = c(NA,NA,NA), lty = c(1,1,1) )
with(household, plot(strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Global_reactive_power, type = "s", , xlab = "datetime"))

dev.off()