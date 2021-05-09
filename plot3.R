# *******************************************
# Pierre Shi
# May 2021
# Plot 3 Plot the 3 sub meterings over the 2 days period
# *******************************************

# *******************************************
# 1. Importing the full dataset 
# *******************************************
data_all <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na="?", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

# *******************************************
# 2. Subset the data
# *******************************************
data <- subset(data_all, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
rm(data_all)

# *******************************************
# 3. Convert the date
# *******************************************
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# *******************************************
# 4. Generate the plot
# *******************************************
with(data, {
        plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# *******************************************
# 5. Saving to file
# *******************************************
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()