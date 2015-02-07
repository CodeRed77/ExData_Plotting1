##Download Data

Filename<-"./household_power_consumption.txt"

data1 <- read.csv(Filename, 
                  header=T, 
                  sep=';', 
                  na.strings="?", 
                  nrows=2075259, 
                  check.names=F
)

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")


## Select Data with relevant dates
data2 <- subset(data1 , subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))



######Q2
colnames(data2)

##Concatenate Date and Time Together for x Axis
datetime <- paste(as.Date(data2$Date), data2$Time)
datetime

data2$Datetime <- as.POSIXct(datetime)


######Q4

par(mfcol=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data2, {
  plot(data2$Global_active_power ~data2$Datetime,type="l",
       ylab="Global Active Power", xlab="")
  
  plot(data2$Sub_metering_1 ~ data2$Datetime, type='l', xlab="", ylab="Energy sub metering")
  lines(data2$Sub_metering_2~ data2$Datetime, type='l', col='red')
  lines(data2$Sub_metering_3~ data2$Datetime, type='l', col='blue')
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,
         col=c("black", "red", "blue"),bty="n")
  
  plot(data2$Voltage ~data2$Datetime,type="l",
       ylab="Voltage", xlab="datetime")
  
  plot(data2$Global_reactive_power ~data2$Datetime,type="l",
       ylab="Global_reactive_power", xlab="datetime")
  
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()