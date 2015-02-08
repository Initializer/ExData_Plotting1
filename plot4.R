# plot4.R - Multiplot time series of global active power, voltage,
#   submetering and global reactive power
# Set working directory
# dir <- "~/workspace/r_workspace/coursera/Expolaratory/ExData_Plotting1/"
# setwd(dir)
# Set col classes for faster loading
col_classes <- c('character', 'character', rep('numeric', 7))
# Read data, convert dates and subset on two days in February 2007
data <- read.table('household_power_consumption.txt', sep=';', header=T,
                    colClasses = col_classes,
                    na.strings='?'
                  )
# Concate Date and Time and convert into date time and bind to `date$DateTime`
data$DateTime <- strptime(paste(data$Date, data$Time),
                          "%d/%m/%Y %H:%M:%S")
data <- subset(data,
                as.Date(DateTime) >= as.Date("2007-02-01") &
                as.Date(DateTime) <= as.Date("2007-02-02")
              )

# Open plot4.png
png("plot4.png", height=480, width=480)

# Configure multiplot
par(mfrow=c(2,2))

# Draws 'Global Active Power plot'
plot(data$DateTime,
      data$Global_active_power,
      pch=NA,
      xlab="",
      type="l",
      ylab="Global Active Power (kilowatts)"
    )

# Draws 'Voltage plot'
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA, type="l")

# Draws 'Submetering plot'
plot(data$DateTime,
      data$Sub_metering_1,
      pch=NA,
      xlab="",
      type="l",
      ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
# Draws legends
legend('topright',
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = c(1,1,1),
        col = c('black', 'red', 'blue'),
        bty = 'n'
      )

# Global reactive power plot
plot(data$DateTime,
      data$Global_reactive_power,
      pch=NA,
      xlab="datetime",
      type="l"
    )

# Close PNG file
dev.off()
