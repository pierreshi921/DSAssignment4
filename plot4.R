# *******************************************
# Pierre Shi
# May 2021
# Plot 4 Create 4 plotting charts in 1 file
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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", bty="n", col=c("black", "red", "blue"), lty=1, lwd=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

# *******************************************
# 5. Saving to file
# *******************************************
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
