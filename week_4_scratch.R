# submission 1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


babyNEI<-subset(NEI, Pollutant=="PM25-PRI", select = c('Emissions', 'year') )
aggdata <-aggregate(babyNEI$Emissions, by=list(babyNEI$year), FUN = sum, na.rm = TRUE)

png("plot1.png", width=4, height=4, units="in", res=300)
with(aggdata, plot(Group.1, x, type='h', main="Overall Polution", xlab="Year", ylab="Emissions")    )
dev.off()

# submission 2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


babyNEI<-subset(NEI, Pollutant=="PM25-PRI" & fips=="24510", select = c('Emissions', 'year') )
aggdata <-aggregate(babyNEI$Emissions, by=list(babyNEI$year), FUN = sum, na.rm = TRUE)

png("plot2.png", width=4, height=4, units="in", res=300)
with(aggdata, plot(Group.1, x, type='h', main="Baltimore Polution", xlab="Year", ylab="Emissions")    )
dev.off()

# submission 3
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


babyNEI<-subset(NEI, Pollutant=="PM25-PRI" & fips=="24510", select = c('Emissions', 'type', 'year') )

aggdata <-aggregate(babyNEI$Emissions, by=list(babyNEI$year, babyNEI$type), FUN = sum, na.rm = TRUE)
names(aggdata)<-c('year', 'type', 'Emissions')

png("plot3.png", width=4, height=4, units="in", res=300)
ggplot(aggdata, aes(x=year, y=Emissions, colour=type ))  + geom_line() +ggtitle("Baltimore pollution by type")
dev.off()

# submission 4
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

keys<-SCC[grep("Coal", SCC$Short.Name, ignore.case = TRUE), 1]
babyNEI<-subset(NEI, SCC %in% keys , select = c('Emissions', 'year') )
aggdata <-aggregate(babyNEI$Emissions, by=list(babyNEI$year), FUN = sum, na.rm = TRUE)
names(aggdata)<-c('year', 'Emissions')
png("plot4.png", width=4, height=4, units="in", res=300)
ggplot(aggdata, aes(x=year, y=Emissions ))  + geom_line() +ggtitle("Coal Pollution")
dev.off()

# submission 5
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

keys<-SCC[grep("Motor", SCC$Short.Name, ignore.case = TRUE), 1]
babyNEI<-subset(NEI, SCC %in% keys &  fips=="24510", select = c('Emissions', 'year') )
aggdata <-aggregate(babyNEI$Emissions, by=list(babyNEI$year), FUN = sum, na.rm = TRUE)
names(aggdata)<-c('year', 'Emissions')
png("plot5.png", width=4, height=4, units="in", res=300)
ggplot(aggdata, aes(x=year, y=Emissions ))  + geom_line() +ggtitle("Baltimore Motor Polution")
dev.off()

# submission 6
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


keys<-SCC[grep("Motor", SCC$Short.Name, ignore.case = TRUE), 1]
babyNEI<-subset(NEI, SCC %in% keys & ( fips=="24510" | fips == "06037"), select = c('Emissions', 'year', 'fips') )
aggdata <-aggregate(babyNEI$Emissions, by=list(babyNEI$year, babyNEI$fips), FUN = sum, na.rm = TRUE)
names(aggdata)<-c('year', 'fips', 'Emissions')
png("plot6.png", width=4, height=4, units="in", res=300)
ggplot(aggdata, aes(x=year, y=Emissions, colour=fips ))  + geom_line() +ggtitle("Baltimore vs LA Motor Polution")  + scale_colour_discrete(name = "Zip Codes", label=c('LA','Baltimore'))

dev.off()