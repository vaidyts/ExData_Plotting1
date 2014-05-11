rm(list=ls())
fn = "exdata_data_household_power_consumption/household_power_consumption.txt"
tbl <- read.table(fn,header=TRUE,sep=";",na.strings="?",check.names=TRUE,stringsAsFactors=FALSE)
tbl$Date <- as.Date(tbl$Date,format="%d/%m/%Y")
tbl$Time <- strptime(paste(tbl$Date,tbl$Time),format="%Y-%m-%d %H:%M:%S")
tbl <- tbl[(tbl$Date>="2007-02-01" &  tbl$Date<="2007-02-02"),]

png("plot3.png",width=480,height=480,bg="white")
plot(tbl$Time,tbl$Global_active_power, xlab="", ylab="Energy sub metering", type="n",ylim=range(tbl$Sub_metering_1))
lines(tbl$Time,tbl$Sub_metering_1,col="black",type="l")
lines(tbl$Time,tbl$Sub_metering_2,col="red",type="l")
lines(tbl$Time,tbl$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
