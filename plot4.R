png(file='plot4.png', width = 480, height = 480)
epc = read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings = "?")
epc2 = subset(epc, Date == '1/2/2007' | Date == '2/2/2007')
epc2$DateTime = paste(epc2$Date, epc2$Time)
epc2$DateTime = strptime(epc2$DateTime, "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))
with(epc2, {
    plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", lwd = 1, lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()

