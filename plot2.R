plot2 <- function() {
  ## read in file
  powerData <- read.table("household_power_consumption.txt", sep = ";", header = T, colClasses = "character")
  
  ## change format of date column to standard
  powerData[,1] <- as.Date(powerData[,1], format ='%d/%m/%Y')
  
  ## select only the 2 desired day's data
  powerData <- subset(powerData, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  ## change from char to numeric for plotting
  powerData[,3] <- as.numeric(powerData[,3])
   
  ## open device for plotting
  png(filename = "plot2.png",
      width = 480, height = 480,)
  
  ## create plot
  plot(y= powerData[,"Global_active_power"],
       x = as.POSIXlt(paste(powerData$Date, powerData$Time), "%Y-%m-%d %H:%M:%S", tz=""),
       type = "l",
       main = "",
       ylab = "Global Active Power (kilowatts)",
       xlab = "")
  
  ##close graphics device
  dev.off()
}