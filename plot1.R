##Get and load the data
data <- subset(read.table("household_power_consumption.txt", 
                          header = TRUE, 
                          sep=";", 
                          na.strings = "?"), 
               as.Date(Date, "%d/%m/%Y") >= "2007-02-01" & 
                 as.Date(Date, "%d/%m/%Y") <= "2007-02-02")

##Create histogram
hist(data$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

##Copy to graphic devices
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()