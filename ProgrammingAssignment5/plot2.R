# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make 
# a plot answering this question.

summary <- readRDS("./summarySCC_PM25.rds")
source <- readRDS("./Source_Classification_Code.rds")

baltimore <- summary[summary$fips=="24510",]
aggBaltimore <- aggregate(Emissions ~ year, baltimore ,sum)
png('plot2.png')

barplot(aggBaltimore$Emissions, names.arg = aggBaltimore$year, xlab = "Year", ylab = "PM2.5 Emissions", main = "Total PM2.5 Emissions in Baltimore")

dev.off()