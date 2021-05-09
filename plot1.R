# *******************************************
# Pierre Shi
# May 2021
# Plot 1 Generate a histogram of global active power(kilowatts)
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
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# *******************************************
# 5. Saving to file
# *******************************************
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()