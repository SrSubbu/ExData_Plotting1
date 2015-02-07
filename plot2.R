plot2<-function(){
  ##Read the data from the text file
  allData<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  
  ##Load lubridate and dplyr libraries
  library(lubridate)
  library(dplyr)
  
  ##Get the data only for the period of "2001-02-01" and "2007-02-02"
  febData<-filter(allData,dmy(Date)>=ymd("2007-02-01") & dmy(Date)<=ymd("2007-02-02"))
  
  ##Get the Date and time variable combined for plotting it in X
  dateTime  <- as.POSIXlt(paste(as.Date(febData$Date,format="%d/%m/%Y"), febData$Time, sep=" "))
  
  ##Open a connection to png device
  png(filename="plot2.png",width=480,height=480)
  
  ##Plot the graph
  plot(dateTime,as.numeric(levels(febData$Global_active_power))[febData$Global_active_power], type="l",  ylab="Global Active Power (Kilowatts)",xlab="")
  
  ##Switch off the device
  dev.off()
}