# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999-2008?

library(ggplot2)

summary <- readRDS("./summarySCC_PM25.rds")
source <- readRDS("./Source_Classification_Code.rds")

merged <- merge(summary, source, by="SCC")
coal  <- grepl("coal", merged$Short.Name, ignore.case=TRUE)
coalFinal <- merged[coal, ]
agg <- aggregate(Emissions ~ year, coalFinal, sum)

png("plot4.png")
plot <- ggplot(agg, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle('Total Coal Emissions from 1999 to 2008')

print(plot)
dev.off()