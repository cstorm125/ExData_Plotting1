#get colClasses
initial<-read.table(file='household_power_consumption.txt', nrows=100, header=TRUE, sep=';')
classes <- sapply(initial, class)
#read file
household <- read.table(file='household_power_consumption.txt', 
	header=TRUE, sep=';',na.strings='?',colClasses = classes)
#create datetime column
household$datetime <- strptime(paste(household$Date, household$Time), format='%d/%m/%Y %T')
#subset the data
data <- subset(household, datetime>='2007/02/01' & datetime<'2007/02/03')

#set par
par(mfrow=c(2,2))
#plot2
plot(x=data$datetime,y=data$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')
#plot voltage
plot(x=data$datetime,y=data$Voltage, type='l', ylab='Voltage', xlab='datetime')
#plot3
plot(x=data$datetime,y=data$Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
lines(x=data$datetime, y=data$Sub_metering_2, col='red')
lines(x=data$datetime, y=data$Sub_metering_3, col='blue')
legend('topright',col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, bty='n', cex=0.6,
       y.intersp = 0.4, inset=-0.07)
#plot reactive
plot(x=data$datetime,y=data$Global_reactive_power, type='l', ylab='Global_reactive_power', xlab='datetime')


#save to png
dev.copy(png, file='plot4.png')
dev.off()