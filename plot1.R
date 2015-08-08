tabAll <- read.table("../household_power_consumption.txt",header=TRUE,sep=";")
tabAll$Date <- as.Date(tabAll$Date, "%d/%m/%Y")
tabAll$Global_active_power <- as.numeric(levels(
    tabAll$Global_active_power))[tabAll$Global_active_power]
gap_feb_dates <- tabAll$Global_active_power[tabAll$Date=="2007-02-01" | 
                                           tabAll$Date=="2007-02-02"]
png(filename="plot1.png", width=480, height=480)
hist(gap_feb_dates, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
