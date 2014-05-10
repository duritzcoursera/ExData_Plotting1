# Produces a histogram with red bars of the distribution of global active power over
# the days 2007-02-01 to 2007-02-02.

# Read in two days (2880 minutes) of measurements starting at midnight 2007-02-01
data <- read.csv("household_power_consumption.txt", sep=";", header=FALSE, na.strings="?", skip=66637, nrows=2880)

# Convert date and time columns to datetime objects
data <- cbind(as.POSIXct(paste(data$V1, data$V2), format="%d/%m/%Y %H:%M:%S"), data[3:9])

# Label the columns
names(data) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Save upcoming plot into a png image
png(filename = "plot1.png", width = 480, height = 480)

# Create histogram with red color, title, and x-axis label
with(data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

# Save the image to disk
dev.off()