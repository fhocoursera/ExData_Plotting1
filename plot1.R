setwd("/Users/christinaorndorff/Google Drive/Coursera/Data Science/Exploratory Data Analysis")

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

##### plot1.png #####
hist(df_new$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

#copy plot to a .png file
dev.copy(png, file = "plot1.png",
         width = 480, height = 480)
dev.off()
