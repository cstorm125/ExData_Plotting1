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

#plot sub-meterings
plot(x=data$datetime,y=data$Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
lines(x=data$datetime, y=data$Sub_metering_2, col='red')
lines(x=data$datetime, y=data$Sub_metering_3, col='blue')

#add legend
legend('topright',col=c('black','red','blue'),
	legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, cex=0.7)
#save to png
dev.copy(png, file='plot3.png')
dev.off()