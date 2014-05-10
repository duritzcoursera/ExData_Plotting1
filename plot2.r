# Produces a line graph of the global active power over the days 2007-02-01 to 2007-02-02.

# Read in two days (2880 minutes) of measurements starting at midnight 2007-02-01
data <- read.csv("household_power_consumption.txt", sep=";", header=FALSE, na.strings="?", skip=66637, nrows=2880)

# Convert date and time columns to datetime objects
data <- cbind(as.POSIXct(paste(data$V1, data$V2), format="%d/%m/%Y %H:%M:%S"), data[3:9])

# Label the columns
names(data) <- c("DateTime", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Save upcoming plot into a png image
png(filename = "plot2.png", width = 480, height = 480)

# Plot line graph of global active power, omitting the x-axis and label.
with(data, plot(Global_active_power, ylab = "Global Active Power (kilowatts)", xaxt="n", xlab = "", type = "l"))

# Add the x-axis
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

# Save the image to disk
dev.off()