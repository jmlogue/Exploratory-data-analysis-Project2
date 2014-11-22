##Plot 4

# Question: Accross the US, how have emissions in coal combustion-related sources changed from 1999–2008?

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


#First find the SCC numbers that are related to coal from teh SCC database. The three coal
# related fields for EI.Sector are 1) [1] Fuel Comb - Electric Generation - Coal;
# 2) [6] Fuel Comb - Industrial Boilers, ICEs - Coal and 3)[11] Fuel Comb - Comm/Institutional - Coal
EIsectors<-unique(SCC$EI.Sector)

###########################################
# Extract Coal electricity generation SCCs
###########################################
SCCs<-SCC$SCC[which(SCC$EI.Sector==EIsectors[[1]])] # Find SCC codes for coal use in electricity generation
sub2<-NEI[which(NEI$SCC==SCCs),]

# Find data for each year
#1999
sub<-subset(sub2,year==1999)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=1999,Type="Electricity Generation",Emissions=Etot)
Results<-row

#2002
sub<-subset(sub2,year==2002)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2002,Type="Electricity Generation",Emissions=Etot)
Results<-rbind(Results,row)

#2005
sub<-subset(sub2,year==2005)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2005,Type="Electricity Generation",Emissions=Etot)
Results<-rbind(Results,row)

#2008
sub<-subset(sub2,year==2008)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2008,Type="Electricity Generation",Emissions=Etot)
Results<-rbind(Results,row)

###########################################
# Extract Industrial Boilers SCCs
###########################################
SCCs<-SCC$SCC[which(SCC$EI.Sector==EIsectors[[6]])] # Find SCC codes for coal use in electricity generation
sub2<-NEI[which(NEI$SCC==SCCs),]

# Find data for each year
#1999
sub<-subset(sub2,year==1999)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=1999,Type="Industrial Boilers",Emissions=Etot)
Results<-rbind(Results,row)

#2002
sub<-subset(sub2,year==2002)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2002,Type="Industrial Boilers",Emissions=Etot)
Results<-rbind(Results,row)

#2005
sub<-subset(sub2,year==2005)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2005,Type="Industrial Boilers",Emissions=Etot)
Results<-rbind(Results,row)

#2008
sub<-subset(sub2,year==2008)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2008,Type="Industrial Boilers",Emissions=Etot)
Results<-rbind(Results,row)

###########################################
# Extract Comm/Institutional SCCs
###########################################
SCCs<-SCC$SCC[which(SCC$EI.Sector==EIsectors[[11]])] # Find SCC codes for coal use in electricity generation
sub2<-NEI[which(NEI$SCC==SCCs),]

# Find data for each year
#1999
sub<-subset(sub2,year==1999)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=1999,Type="Comm/Institutional",Emissions=Etot)
Results<-rbind(Results,row)

#2002
sub<-subset(sub2,year==2002)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2002,Type="Comm/Institutional",Emissions=Etot)
Results<-rbind(Results,row)

#2005
sub<-subset(sub2,year==2005)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2005,Type="Comm/Institutional",Emissions=Etot)
Results<-rbind(Results,row)

#2008
sub<-subset(sub2,year==2008)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2008,Type="Comm/Institutional",Emissions=Etot)
Results<-rbind(Results,row)

###########################################
# Total for all coal
###########################################
# Find data for each year
#1999
sub<-subset(Results,year==1999)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=1999,Type="All Coal",Emissions=Etot)
Results<-rbind(Results,row)

#2002
sub<-subset(Results,year==2002)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2002,Type="All Coal",Emissions=Etot)
Results<-rbind(Results,row)

#2005
sub<-subset(Results,year==2005)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2005,Type="All Coal",Emissions=Etot)
Results<-rbind(Results,row)

#2008
sub<-subset(Results,year==2008)
Etot<-sum(sub$Emissions,na.rm=TRUE)
row<-data.frame(year=2008,Type="All Coal",Emissions=Etot)
Results<-rbind(Results,row)


png('plot4.png')
qplot(year,Emissions, data=Results, geom=c("point","smooth"),method="lm",facets=.~Type)
dev.off()