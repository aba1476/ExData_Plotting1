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


png("./EDA/plot2.png")
plot(x=(dfSub$Time),y=dfSub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
