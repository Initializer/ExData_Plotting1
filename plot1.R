# plot1.R - Histogram of Global Active Power
# # Set working directory
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

# Open plot1.png
png("plot1.png", height=480, width=480)

# Build histogram
hist(data$Global_active_power, col='red', 
      xlab = 'Global Active Power (kilowatts)',
      main = 'Global Active Power'
    )

# Close PNG file
dev.off()


# # Set working directory
# dir <- "~/workspace/r_workspace/coursera/Expolaratory/ExData_Plotting1/"
# setwd(dir)
# # Set col classes for faster loading
# col_classes <- c('character', 'character', rep('numeric', 7))
# data <- read.table('household_power_consumption.txt', header=T, sep=';', na.strings = "?", colClasses = col_classes)
# # Check by printing
# str(data)
# # Concate Date and Time and convert into date time and bind to `date$DateTime`
# data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# # Subset data
# data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) < as.Date("2007-02-02"))
# # open graphic system
# png("plot1.png", height=480, width=480)
# hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", col = 'red')
# # Close Graphic sysyem
# dev.off()