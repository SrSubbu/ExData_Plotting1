plot4<-function(){
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
  png(filename="plot4.png",width=480,height=480)
  
  ##Set the number of plots to be displayed in the same window
  par(mfrow = c(2,2))
  
  ##Plot between Global active power and the datetime
  plot(dateTime,as.numeric(levels(febData$Global_active_power))[febData$Global_active_power], type="l",  ylab="Global Active Power",xlab="")
  
  ##Plot between Voltage and datetime
  plot(dateTime,as.numeric(levels(febData$Voltage))[febData$Voltage], type="l",  ylab="Voltage",xlab="datetime")
  
  ##Plot between datetime and submetering
  plot(dateTime,as.numeric(levels(febData$Sub_metering_1))[febData$Sub_metering_1], type="l",  ylab="Energy sub metering",xlab="")
  ##Add the submetering 2 to the plot
  lines(dateTime,y=as.numeric(levels(febData$Sub_metering_2))[febData$Sub_metering_2],ylim=c(0,40),col="red")
  ##Add the submetering 3 to the plot
  lines(dateTime,y=febData$Sub_metering_3,ylim=c(0,40),col="blue")
  ##Add legend to the plot
  legend('topright',legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1,cex=0.95,bty="n")
  
  ##Plot between Global reactive power and datetime
  plot(dateTime,as.numeric(levels(febData$Global_reactive_power))[febData$Global_reactive_power], type="l",ylab="Global_reactive_power",xlab="datetime",freq = F)
  
  ##Switch off the device
  dev.off()
}