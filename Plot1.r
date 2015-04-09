############
## plot 1 ##
############

## read in data from unziped working directory 
#setwd("../exdata_data_household_power_consumption")

## read in file
Data<-read.table('household_power_consumption.txt',sep=';',na.strings = "?"
                 ,header = TRUE)

Data$formatedDate<-as.Date(Data$Date, format = '%d/%m/%Y')
SubDat<-subset(Data, formatedDate>='2007-02-01' & formatedDate<= '2007-02-02')

SubDat$x <- with(SubDat, paste(Date, Time))
SubDat$x<-strptime(SubDat$x, "%d/%m/%Y %H:%M:%S")

## for the plot...
png('Plot1.png', width = 480, height = 480)
par(mar = c(4,4,3,1), bg = 'transparent', cex.axis = 1.05, cex.lab = 1.05)
hist(SubDat$Global_active_power, col = 'red', main = 'Global Active Power'
     , xlab = 'Global Active Power (Kilowatts)', ylab = 'Frequency')
dev.off()

