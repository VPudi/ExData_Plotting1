## Downloaded the data file to local folder manually.

##set working directory in R to the above local folder

setwd("C:\Coursera\Exploratory Graphs\Project1");


## Read the entire file

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=-1);


## subset the dataset for Feb 1st and 2nd of 2007 data

hpc2 <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007");

## Create a new 10th column as DateTime Column by combining Date and Time

hpc2[,10] <- as.POSIXct(paste(hpc2$Date, hpc2$Time), format="%d/%m/%Y %H:%M:%S");
names(hpc2)[10]="DateTime"


## set device to png

png("Plot2.png");

## generate the Line graph for Plot 2

plot(hpc2$DateTime, hpc2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)");

##close the png 

dev.off();

