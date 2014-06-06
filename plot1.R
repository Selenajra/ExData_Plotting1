plot1 <- function() {
  ## read in file
  powerData <- read.table("household_power_consumption.txt", sep = ";", header = T, colClasses = "character")
  
  ## change format of date column to standard
  powerData[,1] <- as.Date(powerData[,1], format ='%d/%m/%Y')
   
  ## select only the 2 desired day's data
  powerData <- subset(powerData, Date >= "2007-02-01" & Date <= "2007-02-02")

  ## change from char to numeric for hist plotting
  powerData[,3] <- as.numeric(powerData[,3])
  
  ## open device for plotting
  png(filename = "plot1.png",
      width = 480, height = 480,)
  
  ## display histogram
  hist(powerData[,"Global_active_power"],
       col = "red2",
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  
  ##close graphics device
  dev.off()
  
}