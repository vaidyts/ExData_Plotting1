rm(list=ls())
fn = "exdata_data_household_power_consumption/household_power_consumption.txt"
tbl <- read.table(fn,header=TRUE,sep=";",na.strings="?",check.names=TRUE,stringsAsFactors=FALSE)
tbl$Date <- as.Date(tbl$Date,format="%d/%m/%Y")
tbl$Time <- strptime(paste(tbl$Date,tbl$Time),format="%Y-%m-%d %H:%M:%S")
tbl <- tbl[(tbl$Date>="2007-02-01" &  tbl$Date<="2007-02-02"),]

png("plot1.png",width=480,height=480,bg="white")
hist(tbl$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off()