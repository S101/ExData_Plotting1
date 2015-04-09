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
png('Plot4.png', width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,3,1), bg = 'transparent', cex.axis = 1.05
    , cex.lab = 1.05)
#p1
with(SubDat, plot(x,Global_active_power, type = 'l', xlab = ''
                  ,ylab = 'Global Active Power')
)

#p2
with(SubDat, plot(x, Voltage, type = 'l', xlab = 'Datetime', ylab = 'Voltage'))

#p3
leg.txt <- c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
with(SubDat, {plot(x,Sub_metering_1, type = 'l', xlab = ''
                   ,ylab = 'Energy sub metering')
              lines(x,Sub_metering_2,col ='Red')
              lines(x,Sub_metering_3, col = 'Blue')
              legend('topright',lty = 1, col = c('Black','Red','Blue'), leg.txt, 
                      bty = 'n' )
}
)

#p4
with(SubDat, plot(x,Global_reactive_power, type = 'l', xlab = 'Datetime'))

dev.off()
