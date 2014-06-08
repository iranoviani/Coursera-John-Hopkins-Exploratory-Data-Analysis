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

##Create histogram
plot(x = data$DateTime,
     y = data$Global_active_power, 
     col = "black",
     type = "l",
     lwd = 2,
     xlab = "",
     xaxt = "n",
     ylab = "Global Active Power (kilowatts)")

dateseq <- seq(as.Date("2007-02-01"), as.Date("2007-02-03"), by = "1 day")
weekdayseq <- weekdays(dateseq, abbreviate = TRUE)

axis(side = 1,
     ##at = dateseq,
     at = c(1, match(weekdayseq[2], data$Weekday), nrow(data)),
     labels = weekdayseq)

##Copy to graphic devices
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()