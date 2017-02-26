# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?

library(ggplot2)

summary <- readRDS("./summarySCC_PM25.rds")
source <- readRDS("./Source_Classification_Code.rds")

onRoad <- summary[(summary$fips=="24510" | summary$fips=="06037") & summary$type=="ON-ROAD",  ]

agg <- aggregate(Emissions ~ year + fips, onRoad, sum)
agg$fips[agg$fips=="24510"] <- "Baltimore City, MD"
agg$fips[agg$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png")
plot <- ggplot(agg, aes(factor(year), Emissions)) +
  geom_bar(stat="identity")  +
  facet_grid(. ~ fips) +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle('Total Emissions from motor vehicle sources in Baltimore City, MD vs Los Angeles, CA from 1999 - 2008')
print(plot)
dev.off()