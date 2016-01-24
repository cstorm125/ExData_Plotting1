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

#plot Global_active_power
hist(data$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')


#save to png
dev.copy(png, file='plot1.png')
dev.off()