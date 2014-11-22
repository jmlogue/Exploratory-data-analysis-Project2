# set working directory
setwd("/Users/Jenny/Downloads/exdata_data_NEI_data/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <-data.frame(NEI)
SCC <-data.frame(SCC)


# Address Question #2: Have total emission decreased in Baltimore City, MD (fips=="24510") from 1999 to 2008

# get average image for each year
years<-c(1999,2002,2005,2008)

#1999
sub<-subset(NEI,year==1999 & fips=="24510")
Etot1999<-sum(sub$Emissions,na.rm=TRUE)

#2002
sub<-subset(NEI,year==2002& fips=="24510")
Etot2002<-sum(sub$Emissions,na.rm=TRUE)

#2005
sub<-subset(NEI,year==2005& fips=="24510")
Etot2005<-sum(sub$Emissions,na.rm=TRUE)

#2008
sub<-subset(NEI,year==2008& fips=="24510")
Etot2008<-sum(sub$Emissions,na.rm=TRUE)

Emissions<-c(Etot1999,Etot2002,Etot2005,Etot2008)

# fit a linear model to the data
fitline<-lm(Emissions~years)
Model<-fitline$coefficients[[1]]+fitline$coefficients[[2]]*years


png('plot2.png')
plot(years,Emissions, main="Baltimore,MD Annual PM Emissions",xlab="years",ylab="Emissions")
lines(years,Model)
dev.off()





