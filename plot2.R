tabAll <- read.table("../household_power_consumption.txt",header=TRUE,sep=";")
junk <- cbind(as.character(tabAll$Date),as.character(tabAll$Time))
tabAll$Time <- paste(junk[,1],junk[,2])
tabAll$Date <- as.Date(tabAll$Date, "%d/%m/%Y")
tabAll$Time <- strptime(tabAll$Time, format="%d/%m/%Y %H:%M:%S")
tabAll$Global_active_power <- as.numeric(levels(
    tabAll$Global_active_power))[tabAll$Global_active_power]
times_feb_dates <- tabAll$Time[tabAll$Date=="2007-02-01" | tabAll$Date=="2007-02-02"]
gap_feb_dates <- tabAll$Global_active_power[tabAll$Date=="2007-02-01" | 
                                                tabAll$Date=="2007-02-02"]
png(filename="plot2.png", width=480, height=480)
plot(times_feb_dates, gap_feb_dates, type="n", xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(times_feb_dates,gap_feb_dates)
dev.off()
