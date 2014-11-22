# Plot #5

#Question: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City
# First want to sum the sources over each year and source type
# set working directory
setwd("/Users/Jenny/Downloads/exdata_data_NEI_data/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <-data.frame(NEI)
SCC <-data.frame(SCC)

#get library for ggplot2
library(ggplot2)

# get average image for each year. Put data in a dataframe with year, type and total
years<-c(1999,2002,2005,2008)


#First find all the unique sorce types for visual inspection
Levelones<-unique(SCC$SCC.Level.On)

#Find all of the SCC numbers that indicate a mobile source
SCCmobile<-SCC$SCC[which(SCC$SCC.Level.One=="Mobile Sources")]
SCCmobile=as.character(SCCmobile)

# get NEI baltimore subset of the data
NEIBA<-subset(NEI,fips=="24510")

# Get subst of NEI baltimore database that refers to Mobile sources
sub2<-NEIBA[which(NEIBA$SCC %in% SCCmobile),]

# Get data for each year for Baltimore Maryland

#1999
sub<-subset(sub2,year==1999)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=1999,Type="Mobile",Emissions=Etot)
Results<-row

#2002
sub<-subset(sub2,year==2002)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2002,Type="Mobile",Emissions=Etot)
Results<-rbind(Results,row)

#2005
sub<-subset(sub2,year==2005)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2005,Type="Mobile",Emissions=Etot)
Results<-rbind(Results,row)

#2008
sub<-subset(sub2,year==2008)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2008,Type="Mobile",Emissions=Etot)
Results<-rbind(Results,row)


png('plot5.png')
qplot(year,Emissions, data=Results, geom=c("point","smooth"),method="lm")
dev.off()