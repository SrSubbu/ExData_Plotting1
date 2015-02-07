plot1<-function(){
  ##Read the data from the text file
  allData<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  
  ##Load lubridate and dplyr libraries
  library(lubridate)
  library(dplyr)
  
  ##Get the data only for the period of "2001-02-01" and "2007-02-02"
  febData<-filter(allData,dmy(Date)>=ymd("2007-02-01") & dmy(Date)<=ymd("2007-02-02"))
  
  ##Open a connection to png device
  png(filename="plot1.png",width=480,height=480)
  
  ##Create a histogram with the data of Global active power
  hist(as.numeric(levels(febData$Global_active_power))[febData$Global_active_power],breaks=12,main="Global Active Power",xlab="Global Active Power (Kilowatts)",col="red")
  
  ##Switch off the device
  dev.off()
}