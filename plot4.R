tabAll <- read.table("../household_power_consumption.txt",header=TRUE,sep=";")
junk <- cbind(as.character(tabAll$Date),as.character(tabAll$Time))
tabAll$Time <- paste(junk[,1],junk[,2])
tabAll$Date <- as.Date(tabAll$Date, "%d/%m/%Y")
tabAll$Time <- strptime(tabAll$Time, format="%d/%m/%Y %H:%M:%S")
tabAll$Global_active_power <- as.numeric(levels(
    tabAll$Global_active_power))[tabAll$Global_active_power]
tabAll$Global_reactive_power <- as.numeric(levels(
        tabAll$Global_reactive_power))[tabAll$Global_reactive_power]
tabAll$Voltage <- as.numeric(levels(tabAll$Voltage))[tabAll$Voltage]
tabAll$Sub_metering_1 <- as.numeric(levels(
    tabAll$Sub_metering_1))[tabAll$Sub_metering_1]
tabAll$Sub_metering_2 <- as.numeric(levels(
    tabAll$Sub_metering_2))[tabAll$Sub_metering_2]
times_feb_dates <- tabAll$Time[tabAll$Date=="2007-02-01" | 
                                   tabAll$Date=="2007-02-02"]
gap_feb_dates <- tabAll$Global_active_power[tabAll$Date=="2007-02-01" | 
                                                tabAll$Date=="2007-02-02"]
grp_feb_dates <- tabAll$Global_reactive_power[tabAll$Date=="2007-02-01" | 
                                                tabAll$Date=="2007-02-02"]
vol_feb_dates <- tabAll$Voltage[tabAll$Date=="2007-02-01" | 
                                    tabAll$Date=="2007-02-02"]
esm1_feb_dates <- tabAll$Sub_metering_1[tabAll$Date=="2007-02-01" | 
                                            tabAll$Date=="2007-02-02"]
esm2_feb_dates <- tabAll$Sub_metering_2[tabAll$Date=="2007-02-01" | 
                                            tabAll$Date=="2007-02-02"]
esm3_feb_dates <- tabAll$Sub_metering_3[tabAll$Date=="2007-02-01" | 
                                            tabAll$Date=="2007-02-02"]
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(times_feb_dates, gap_feb_dates, type="n", xlab="", 
     ylab="Global Active Power")
lines(times_feb_dates,gap_feb_dates)
plot(times_feb_dates,vol_feb_dates, type="n", xlab="datetime", 
     ylab="Voltage")
lines(times_feb_dates,vol_feb_dates)
plot(times_feb_dates,esm1_feb_dates, type="n", xlab="", 
     ylab="Energy sub metering")
lines(times_feb_dates,esm1_feb_dates)
lines(times_feb_dates,esm2_feb_dates, col="red")
lines(times_feb_dates,esm3_feb_dates, col="blue")
legend("topright", lty=c(1,1), col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),
       bty="n")
plot(times_feb_dates,grp_feb_dates, type="n", xlab="datetime",
     ylab="Global_reactive_power")
lines(times_feb_dates,grp_feb_dates)
dev.off()
