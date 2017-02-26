# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

summary <- readRDS("./summarySCC_PM25.rds")
source <- readRDS("./Source_Classification_Code.rds")

agg <- aggregate(Emissions ~ year, summary, sum)
png('plot1.png')

barplot(agg$Emissions, names.arg = agg$year, xlab = "Year", ylab = "PM2.5 Emissions", main = "Total PM2.5 Emissions")

dev.off()