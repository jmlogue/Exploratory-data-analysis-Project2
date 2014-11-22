#Plot 3


# Question3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen
# increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

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

###################
#### Point Sources
###################
#1999
sub<-subset(NEI,year==1999 & fips=="24510" & type=="POINT")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=1999,Type="Point",Emissions=Etot)
Results<-row

#2002
sub<-subset(NEI,year==2002 & fips=="24510" & type=="POINT")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2002,Type="Point",Emissions=Etot)
Results<-rbind(Results,row)

#2005
sub<-subset(NEI,year==2005 & fips=="24510" & type=="POINT")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2005,Type="Point",Emissions=Etot)
Results<-rbind(Results,row)

#2008
sub<-subset(NEI,year==2008 & fips=="24510" & type=="POINT")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2008,Type="Point",Emissions=Etot)
Results<-rbind(Results,row)

###################
#### NONPOINT sources
###################
#1999
sub<-subset(NEI,year==1999 & fips=="24510" & type=="NONPOINT")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=1999,Type="Nonpoint",Emissions=Etot)
Results<-rbind(Results,row)

#2002
sub<-subset(NEI,year==2002 & fips=="24510" & type=="NONPOINT")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2002,Type="Nonpoint",Emissions=Etot)
Results<-rbind(Results,row)

#2005
sub<-subset(NEI,year==2005 & fips=="24510" & type=="NONPOINT")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2005,Type="Nonpoint",Emissions=Etot)
Results<-rbind(Results,row)

#2008
sub<-subset(NEI,year==2008 & fips=="24510" & type=="NONPOINT")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2008,Type="Nonpoint",Emissions=Etot)
Results<-rbind(Results,row)


###################
#### ON-ROAD sources
###################
#1999
sub<-subset(NEI,year==1999 & fips=="24510" & type=="ON-ROAD")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=1999,Type="On-road",Emissions=Etot)
Results<-rbind(Results,row)

#2002
sub<-subset(NEI,year==2002 & fips=="24510" & type=="ON-ROAD")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2002,Type="On-road",Emissions=Etot)
Results<-rbind(Results,row)

#2005
sub<-subset(NEI,year==2005 & fips=="24510" & type=="ON-ROAD")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2005,Type="On-road",Emissions=Etot)
Results<-rbind(Results,row)

#2008
sub<-subset(NEI,year==2008 & fips=="24510" & type=="ON-ROAD")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2008,Type="On-road",Emissions=Etot)
Results<-rbind(Results,row)

###################
#### NON-ROAD sources
###################
#1999
sub<-subset(NEI,year==1999 & fips=="24510" & type=="NON-ROAD")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=1999,Type="Non-road",Emissions=Etot)
Results<-rbind(Results,row)

#2002
sub<-subset(NEI,year==2002 & fips=="24510" & type=="NON-ROAD")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2002,Type="Non-road",Emissions=Etot)
Results<-rbind(Results,row)

#2005
sub<-subset(NEI,year==2005 & fips=="24510" & type=="NON-ROAD")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2005,Type="Non-road",Emissions=Etot)
Results<-rbind(Results,row)

#2008
sub<-subset(NEI,year==2008 & fips=="24510" & type=="NON-ROAD")
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2008,Type="Non-road",Emissions=Etot)
Results<-rbind(Results,row)


png('plot3.png')
qplot(year,Emissions, data=Results, geom=c("point","smooth"),method="lm",facets=.~Type)
dev.off()