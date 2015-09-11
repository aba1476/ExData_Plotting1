## downloaded the file.. as this is a large file, will specify colClasses to speed up loading
## I want to find the technique to load only the required rows from the txt file to DF


## wanted to use fread, somehow my R studio is not syncing up with CRAN.. will look into
## this later.. 

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
                
## do the plotting
png('./EDA/plot1.png')
hist(dfSub$Global_active_power, main='Global Active Power', 
      xlab = 'Global Active Power (killowatts)' , ylab = 'Frequency', col='red', ylim= c(0,1200))

dev.off()


