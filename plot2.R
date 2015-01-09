sourceUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(sourceUrl, destfile = "./household_power_consumption.zip" ,method = "curl")read.csv(unz("household_power_consumption.zip","household_power_consumption.txt"), na.strings = c("?"), sep = ";", skip = 66636, nrow = 60*48)
png("./plot2.png", width = 480, height = 480)
with(household, plot(strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "s",xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()