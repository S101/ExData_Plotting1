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
png('Plot2.png', width = 480, height = 480)
par(mar = c(4,4,3,1), bg = 'transparent', cex.axis = 1.05, cex.lab = 1.05)
with(SubDat, plot(x,Global_active_power, type = 'l', xlab = ''
                  ,ylab = 'Global Active Power (kilowatts)')
     )
dev.off()
