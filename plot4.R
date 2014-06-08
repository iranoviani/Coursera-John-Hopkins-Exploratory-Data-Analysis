##Get and load the data
data <- subset(read.table("household_power_consumption.txt", 
                          header = TRUE, 
                          sep=";", 
                          na.strings = "?"), 
               as.Date(Date, "%d/%m/%Y") >= "2007-02-01" & 
                 as.Date(Date, "%d/%m/%Y") <= "2007-02-02")

##Add DateTime and Weekday columns
data <- transform(data,
                  DateTime = paste(data$Date, data$Time), 
                  Weekday = format(as.Date(Date, "%d/%m/%Y"), "%a"))
data[order(data$DateTime), ]

par(mfcol = c(2, 2), mar = c(4, 2, 1, 1), pin = c(3, 1.5))

with(data, {
  ##Plot #1
  plot(x = data$DateTime,
       y = data$Global_active_power, 
       col = "black",
       type = "l",
       xlab = "",
       xaxt = "n",
       ylab = "Global Active Power (kilowatts)")
  
  lines(x = data$DateTime,
        y = data$Global_active_power, 
        col = "black",
        type = "l")
  
  dateseq <- seq(as.Date("2007-02-01"), as.Date("2007-02-03"), by = "1 day")
  weekdayseq <- weekdays(dateseq, abbreviate = TRUE)
  
  axis(side = 1,
       at = c(1, match(weekdayseq[2], data$Weekday), nrow(data)),
       labels = weekdayseq)
  
  ##Plot #2
  plot(x = data$DateTime,
       y = data$Sub_metering_1, 
       col = "black",
       type = "l",
       xlab = "",
       xaxt = "n",
       ylab = "Energy sub metering")
  
  lines(x = data$DateTime,
        y = data$Sub_metering_1, 
        col = "black",
        type = "l")
  
  lines(x = data$DateTime,
        y = data$Sub_metering_2, 
        col = "red",
        type = "l")
  
  lines(x = data$DateTime,
        y = data$Sub_metering_3, 
        col = "blue",
        type = "l")
  
  dateseq <- seq(as.Date("2007-02-01"), as.Date("2007-02-03"), by = "1 day")
  weekdayseq <- weekdays(dateseq, abbreviate = TRUE)
  
  axis(side = 1,
       ##at = dateseq,
       at = c(1, match(weekdayseq[2], data$Weekday), nrow(data)),
       labels = weekdayseq)
  
  legend("topright",                       
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),      
         col = c("black", "red", "blue"),
         lty = 1,
         pch = NA,
         yjust = 1) 
  
  ##Plot #3
  plot(x = data$DateTime,
       y = data$Voltage, 
       col = "black",
       type = "l",
       xlab = "",
       xaxt = "n",
       xlab = "datetime",
       ylab = "Voltage")
  
  lines(x = data$DateTime,
        y = data$Voltage, 
        col = "black",
        type = "l")
  
  dateseq <- seq(as.Date("2007-02-01"), as.Date("2007-02-03"), by = "1 day")
  weekdayseq <- weekdays(dateseq, abbreviate = TRUE)
  
  axis(side = 1,
       at = c(1, match(weekdayseq[2], data$Weekday), nrow(data)),
       labels = weekdayseq)
  
  ##Plot #4
  plot(x = data$DateTime,
       y = data$Global_reactive_power, 
       col = "black",
       type = "l",
       xlab = "",
       xaxt = "n",
       xlab = "datetime",
       ylab = "Global_reactive_power")
  
  lines(x = data$DateTime,
        y = data$Global_reactive_power, 
        col = "black",
        type = "l")
  
  dateseq <- seq(as.Date("2007-02-01"), as.Date("2007-02-03"), by = "1 day")
  weekdayseq <- weekdays(dateseq, abbreviate = TRUE)
  
  axis(side = 1,
       at = c(1, match(weekdayseq[2], data$Weekday), nrow(data)),
       labels = weekdayseq)
})

##Copy to graphic devices
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()