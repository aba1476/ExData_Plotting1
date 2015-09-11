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

png("./EDA/plot3.png")
plot(x=(dfSub$Time),y=dfSub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(dfSub$Time),y=dfSub$Sub_metering_2,col="red")
lines(x=(dfSub$Time),y=dfSub$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()