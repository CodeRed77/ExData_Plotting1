
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

data2

plot(data2$Global_active_power ~data2$Datetime,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
