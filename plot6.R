#setting the working directory
setwd("C:/Users/sowja/Desktop/Data Science/Data_For_peer_Assessment")

#Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subsetting SCC with vehicle values
los <- subset(NEI, fips == "06037")
vehicleMatches  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[vehicleMatches, ]

# merging dataframes, adding city variable
dataBaltimore <- merge(baltimore, subsetSCC, by="SCC")
dataBaltimore$city <- "Baltimore City"
dataLos <- merge(los, subsetSCC, by="SCC")
dataLos$city <- "Los Angeles County"
data <- rbind(dataBaltimore, dataLos)

# summing emission data per year per type
data <- aggregate(Emissions ~ year + city, data, sum)

# plotting
g <- ggplot(data, aes(year, Emissions, color = city))
g + geom_line() +xlab("Year") +ylab(expression("Total PM"[2.5]*" Emissions")) +ggtitle("Total Emissions from motor sources in Baltimore and Los Angeles")