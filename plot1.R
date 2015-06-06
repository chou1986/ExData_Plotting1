library(sqldf)
electricity = read.csv.sql("household_power_consumption.txt", sep = ";",
                           "SELECT * FROM file WHERE 
                           Date in ('1/2/2007', '2/2/2007')")

#convert date
electricity$Date = as.Date(electricity$Date, format = "%d/%m/%Y")

hist(electricity$Global_active_power, xlab="Global Active Power",
     main="Global Active Power (kilowatts)",
     col = "red")
dev.copy(png, "plot1.png")
dev.off()

