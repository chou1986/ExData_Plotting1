library(sqldf)
electricity = read.csv.sql("household_power_consumption.txt", sep = ";",
                           "SELECT * FROM file WHERE 
                           Date in ('1/2/2007', '2/2/2007')")

#convert date to POSIXct
electricity$POSIXct = as.POSIXct(paste(electricity$Date, electricity$Time, sep=" "), 
                                 format = "%d/%m/%Y %H:%M:%S")


with(electricity,
     plot(POSIXct, Sub_metering_1, type="l", col="black", 
          ylab="Energy sub metering",
          xlab=""))

with(electricity,
     lines(POSIXct, Sub_metering_2, col="red"))

with(electricity,
     lines(POSIXct, Sub_metering_3, col="blue"))

# cex and pt.cex for changing font size
legend("topright", lty=c(1,1), 
       c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col=c("black", "red", "blue"),
       cex=0.8, pt.cex=1)

dev.copy(png, "plot3.png")
dev.off()