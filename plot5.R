library(ggplot2)
NEI <- readRDS("C:/Users/ADMIN/Documents/data/123/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/ADMIN/Documents/data/123/Source_Classification_Code.rds")
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')
png('C:/Users/ADMIN/Documents/data/123/plot5.png')
ggplot(data=MD.df, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))
dev.off()
