# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2)

summary <- readRDS("./summarySCC_PM25.rds")
source <- readRDS("./Source_Classification_Code.rds")

onRoad <- summary[summary$fips=="24510" & summary$type=="ON-ROAD",  ]
agg <- aggregate(Emissions ~ year, onRoad, sum)
png("plot5.png")

plot <- ggplot(agg, aes(factor(year), Emissions)) +
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle('Total Emissions from motor vehicle sources in Baltimore from 1999 to 2008')

print(plot)
dev.off()