plot3 <- function() {
  ## read in file
  powerData <- read.table("household_power_consumption.txt", sep = ";", header = T, colClasses = "character")
  
  ## change format of date column to standard
  powerData[,1] <- as.Date(powerData[,1], format ='%d/%m/%Y')
  
  ## select only the 2 desired day's data
  powerData <- subset(powerData, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  ## change from char to numeric for plotting
  powerData[,7] <- as.numeric(powerData[,7])
  powerData[,8] <- as.numeric(powerData[,8])
  powerData[,9] <- as.numeric(powerData[,9])
  
  ## open device for plotting
  png(filename = "plot3.png",
      width = 480, height = 480,)
  
  ## create plot 
  plot(y = powerData[,7],
       x = as.POSIXlt(paste(powerData$Date, powerData$Time), "%Y-%m-%d %H:%M:%S", tz=""),
       type = "l",
       main = "",
       ylab = "Energy sub metering",
       xlab = "")
  lines(y = powerData[,8],
        x = as.POSIXlt(paste(powerData$Date, powerData$Time), "%Y-%m-%d %H:%M:%S", tz=""),
        col = "red",
        type = "l")
  lines(y = powerData[,9],
        x = as.POSIXlt(paste(powerData$Date, powerData$Time), "%Y-%m-%d %H:%M:%S", tz=""),
        col = "purple3",
        type = "l")
  legend("topright", colnames(powerData[7:9]),  
         lty=c(1,1,1),
         col=c("black","red","purple3"),
         pt.cex=1,
         cex=1)
  
  ##close graphics device
  dev.off()
}