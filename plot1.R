setwd("C:/Users/Renkoh/Desktop/Coursera/4_Exploratory_Data_Analysis/Proj_1")


##Download Data
par(mfcol=c(1,1))

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
 

#Plot Data
 
hist(data2$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

