##### Read Data into R session - Repeated on each R script #####

df <- read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 strip.white = TRUE,
                 na.strings = "?")

#add new column with date and time together
df$Date2 <- paste(df$Date, df$Time)

#change to date and time
df$Date2 <- strptime(df$Date2, "%d/%m/%Y %H:%M:%S")

#subset df to values we want
df_new <- subset(df, Date2 >= "2007-02-01" & Date2 < "2007-02-03")

##### plot2.png #####
plot(df_new$Date2, df_new$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

#copy plot to a .png file
dev.copy(png, file = "plot2.png",
         width = 480, height = 480)
dev.off()
