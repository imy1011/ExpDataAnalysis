######load data

hpc = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))
feb12 <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

gap <- feb12$Global_active_power

d <- as.character(feb12$Date)
t <- as.character(feb12$Time)
dt <- paste(d,t)
DT <- strptime(dt, "%d/%m/%Y %H:%M:%S")

######generate plot2.png
png("plot2.png")
plot(DT, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

