# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999-2008
# for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the 
# ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

summary <- readRDS("./summarySCC_PM25.rds")
source <- readRDS("./Source_Classification_Code.rds")

baltimore <- summary[summary$fips=="24510",]
aggBaltimore <- aggregate(Emissions ~ year, baltimore ,sum)
png('plot3.png')

plot <- ggplot(baltimore, aes(factor(year), Emissions, fill = type)) +
  geom_bar(stat = "identity") +
  facet_grid(.~type, scales = "free", space = "free") + 
  xlab("Year") +
  ylab(("Total PM2.5 Emissions")) +
  ggtitle('Total Emissions in Baltimore City from 1999 to 2008')

print(plot)
dev.off()