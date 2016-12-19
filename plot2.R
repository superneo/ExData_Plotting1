png(file='plot2.png', width = 480, height = 480)
epc = read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings = "?")
epc2 = subset(epc, Date == '1/2/2007' | Date == '2/2/2007')
epc2$DateTime = paste(epc2$Date, epc2$Time)
epc2$DateTime = strptime(epc2$DateTime, "%d/%m/%Y %H:%M:%S")
with(epc2, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

