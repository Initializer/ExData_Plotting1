# plot2.R - Time Series of Global Active Power
# Set working directory
dir <- "~/workspace/r_workspace/coursera/Expolaratory/ExData_Plotting1/"
setwd(dir)
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

# Open plot2.png
png("plot2.png", height=480, width=480)

# Build plot
plot(data$DateTime,
      data$Global_active_power,
      pch=NA,
      xlab="",
      type = "l",
      ylab="Global Active Power (kilowatts)"
    )
# Close PNG file
dev.off()
