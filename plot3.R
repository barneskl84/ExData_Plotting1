tabAll <- read.table("../household_power_consumption.txt",header=TRUE,sep=";")
junk <- cbind(as.character(tabAll$Date),as.character(tabAll$Time))
tabAll$Time <- paste(junk[,1],junk[,2])
tabAll$Date <- as.Date(tabAll$Date, "%d/%m/%Y")
tabAll$Time <- strptime(tabAll$Time, format="%d/%m/%Y %H:%M:%S")
tabAll$Sub_metering_1 <- as.numeric(levels(
    tabAll$Sub_metering_1))[tabAll$Sub_metering_1]
tabAll$Sub_metering_2 <- as.numeric(levels(
    tabAll$Sub_metering_2))[tabAll$Sub_metering_2]
times_feb_dates <- tabAll$Time[tabAll$Date=="2007-02-01" | 
                                   tabAll$Date=="2007-02-02"]
esm1_feb_dates <- tabAll$Sub_metering_1[tabAll$Date=="2007-02-01" | 
                                                tabAll$Date=="2007-02-02"]
esm2_feb_dates <- tabAll$Sub_metering_2[tabAll$Date=="2007-02-01" | 
                                            tabAll$Date=="2007-02-02"]
esm3_feb_dates <- tabAll$Sub_metering_3[tabAll$Date=="2007-02-01" | 
                                            tabAll$Date=="2007-02-02"]
png(filename="plot3.png", width=480, height=480)
plot(times_feb_dates,esm1_feb_dates, type="n", xlab="", 
     ylab="Energy sub metering")
lines(times_feb_dates,esm1_feb_dates)
lines(times_feb_dates,esm2_feb_dates, col="red")
lines(times_feb_dates,esm3_feb_dates, col="blue")
legend("topright", lty=c(1,1), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))
dev.off()
