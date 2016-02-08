# Generic load and filter of course data (assume in same directory)
raw_data<-read.csv('household_power_consumption.txt', sep=";", na.strings = "?")
raw_data$real_dt<-as.Date(raw_data$Date, "%d/%m/%Y")
hot_data<-subset(raw_data, real_dt == '2007-02-01' | real_dt == '2007-02-02')

# PNG plot per course
png("plot1.png", width=480, height=480)
hist(hot_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Turn off data
dev.off()
