plot4 <- function() {
  ## read in file
  powerData <- read.table("household_power_consumption.txt", sep = ";", header = T, colClasses = "character")
  
  ## change format of date column to standard
  powerData[,1] <- as.Date(powerData[,1], format ='%d/%m/%Y')
  
  ## select only the 2 desired day's data
  powerData <- subset(powerData, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  ## set times into a variable for code readability
  datetime <- as.POSIXlt(paste(powerData$Date, powerData$Time), "%Y-%m-%d %H:%M:%S", tz="")
  
  ## change from char to numeric for plotting
  powerData[,5] <- as.numeric(powerData[,5])
  powerData[,3] <- as.numeric(powerData[,3])
  powerData[,7] <- as.numeric(powerData[,7])
  powerData[,8] <- as.numeric(powerData[,8])
  powerData[,9] <- as.numeric(powerData[,9])
  powerData[,4] <- as.numeric(powerData[,4])
  
  ## open device for plotting
  png(filename = "plot4.png",
      width = 480, height = 480,)
  
  ## set parameters for 4 subimages
  op = par(mfrow=c(2,2))
  
  ## create upperleft plot
  plot(y= powerData[,3],
       x = datetime,
       type = "l",
       main = "",
       ylab = "Global Active Power",
       xlab = ""
    )
  
  ## create upper right plot
  plot(y = powerData[,5],
       x = datetime,
       type = "l",
       main = "",
       ylab = "Voltage"
    )
  
  ## create lower left plot 
  plot(y = powerData[,7],
       x = datetime,
       type = "l",
       main = "",
       ylab = "Energy sub metering",
       xlab = "")
  lines(y = powerData[,8],
        x = datetime,
        col = "red",
        type = "l")
  lines(y = powerData[,9],
        x = datetime,
        col = "purple3",
        type = "l")
  legend("topright", colnames(powerData[7:9]),  
         lty=c(1,1,1),
         col=c("black","red","purple3"),
         pt.cex=1,
         cex=.9,
         bty = "n"
      )
  
  ## create lower right plot
  plot(y = powerData[,4],
       x = datetime,
       type = "l",
       main = "",
       ylab = "Global_reactive_power",
    )
  
  ## close graphic device
  dev.off()
  ## set parameters back to original
  par(op)
}