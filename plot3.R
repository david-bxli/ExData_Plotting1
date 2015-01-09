sourceUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(sourceUrl, destfile = "./household_power_consumption.zip" ,method = "curl")read.csv(unz("household_power_consumption.zip","household_power_consumption.txt"), na.strings = c("?"), sep = ";", skip = 66636, nrow = 60*48)
png("./plot3.png", width = 480, height = 480)
timeFormat <- "%d/%m/%Y %H:%M:%S"
with(household, plot(strptime(paste(Date, Time, sep = " "), format = timeFormat),Sub_metering_1, type = "s", xlab = "", ylab = "Energy sub metering"))
with(household, lines(strptime(paste(Date, Time, sep = " "), format = timeFormat),Sub_metering_2, col = "red", type = "s"))
with(household, lines(strptime(paste(Date, Time, sep = " "), format = timeFormat),Sub_metering_3, col = "blue", type = "s"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty = "o", col = c("black","red","blue"),pch = c(NA,NA,NA), inset = 0.5 , lty = c(1,1,1))

dev.off()