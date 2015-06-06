library(sqldf)
electricity = read.csv.sql("household_power_consumption.txt", sep = ";",
                           "SELECT * FROM file WHERE 
                           Date in ('1/2/2007', '2/2/2007')")

#convert date to POSIXct
electricity$POSIXct = as.POSIXct(paste(electricity$Date, electricity$Time, sep=" "), 
                              format = "%d/%m/%Y %H:%M:%S")
with(electricity, 
     plot(POSIXct, Global_active_power, type="l", 
          ylab="Global Active Power (kilowatts)",
          xlab=""))

dev.copy(png, "plot2.png")
dev.off()