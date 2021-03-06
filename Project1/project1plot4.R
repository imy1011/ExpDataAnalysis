######load data

hpc = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))
feb12 <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

gap <- feb12$Global_active_power

d <- as.character(feb12$Date)
t <- as.character(feb12$Time)
dt <- paste(d,t)
DT <- strptime(dt, "%d/%m/%Y %H:%M:%S")

sm1 <- feb12$Sub_metering_1
sm2 <- feb12$Sub_metering_2
sm3 <- feb12$Sub_metering_3

######generate plot4.png
png("plot4.png")
par(mfrow=c(2,2))
plot(DT, gap, type = "l", xlab = "", ylab = "Global Active Power")
plot(DT, feb12$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(DT, sm1, col = "black", type = "l", xlab = "", ylab = "Engergy sub metering")
lines(DT, sm2, col = "red")
lines(DT, sm3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n")
plot(DT, feb12$Global_reactive_power, type = "l",  xlab = "datetime", ylab = "Global_reacive_power", col = "black")
dev.off()
