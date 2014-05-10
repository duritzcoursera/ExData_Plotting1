# Produces three colored line graphs of the sub metering energy usages over the days 2007-02-01 to 2007-02-02.

# Read in two days (2880 minutes) of measurements starting at midnight 2007-02-01
data <- read.csv("household_power_consumption.txt", sep=";", header=FALSE, na.strings="?", skip=66637, nrows=2880)

# Convert date and time columns to datetime objects
data <- cbind(as.POSIXct(paste(data$V1, data$V2), format="%d/%m/%Y %H:%M:%S"), data[3:9])

# Label the columns
names(data) <- c("DateTime", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Save upcoming plot into a png image
png(filename = "plot3.png", width = 480, height = 480)

# Plot line graph of energy sub metering, omitting the x-axis and label.
with(data, plot(Sub_metering_1, ylab = "Energy sub metering", xaxt="n", xlab = "", type = "n"))

# Add the x-axis
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

# Add data with a different color for each set
with(data, lines(Sub_metering_1, col = "black"))
with(data, lines(Sub_metering_2, col = "red"))
with(data, lines(Sub_metering_3, col = "blue"))

# Setup legend with labels and colored lines
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

# Save the image to disk
dev.off()