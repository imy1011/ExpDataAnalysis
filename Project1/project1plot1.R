######load data

hpc = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))
feb12 <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

gap <- feb12$Global_active_power

######generate plot1.png
png(file="plot1.png")
hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off() 
