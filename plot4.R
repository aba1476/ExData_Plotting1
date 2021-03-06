dfPower <- read.table("./EDA/Week1/household_power_consumption.txt", header=TRUE, sep = ";",
                      colClasses = c("character","character","double","double","double","double","double","double","double")
                      , na.strings = "?")

## check few rows
## head(dfPower)

## convert Date and Time variables to Date/Time classes
dfPower$Date <- as.Date(dfPower$Date , "%d/%m/%Y")
dfPower$Time <- paste(dfPower$Date, dfPower$Time, sep=" ")
dfPower$Time <- strptime(dfPower$Time, "%Y-%m-%d %H:%M:%S")


## now with data having proper date & time, filter.. subset 
dfSub <- subset(dfPower, dfPower$Date == as.Date('2007-02-01') | dfPower$Date == as.Date('2007-02-02'))

## store par in an empty variable
env <- par()

png("./EDA/plot4.png")
par(mfrow=c(2,2))
plot(x=(dfSub$Time),y=dfSub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(x=(dfSub$Time),y=dfSub$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(x=(dfSub$Time),y=dfSub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(dfSub$Time),y=dfSub$Sub_metering_2,col="red")
lines(x=(dfSub$Time),y=dfSub$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)

plot(dfSub$Time, dfSub$Global_reactive_power, type = "l", main = "", xlab = "datetime")

par(env)
dev.off()

