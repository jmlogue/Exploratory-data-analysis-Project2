# set working directory
setwd("/Users/Jenny/Downloads/exdata_data_NEI_data/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <-data.frame(NEI)
SCC <-data.frame(SCC)


# Address Question #1: Have total emissions from PM2.5 decreased in the United
#  States from 1999 to 2008? Using the base plotting system, make a plot showing 
#  the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005,
#  and 2008.

# get average image for each year
years<-c(1999,2002,2005,2008)

#1999
sub<-subset(NEI,year==1999)
Etot1999<-sum(sub$Emissions,na.rm=TRUE)

#2002
sub<-subset(NEI,year==2002)
Etot2002<-sum(sub$Emissions,na.rm=TRUE)

#2005
sub<-subset(NEI,year==2005)
Etot2005<-sum(sub$Emissions,na.rm=TRUE)

#2008
sub<-subset(NEI,year==2008)
Etot2008<-sum(sub$Emissions,na.rm=TRUE)

Emissions<-c(Etot1999,Etot2002,Etot2005,Etot2008)

png('plot1.png')
plot(years,Emissions, main="Total Annual PM Emissions",xlab="years",ylab="Emissions")
dev.off()

