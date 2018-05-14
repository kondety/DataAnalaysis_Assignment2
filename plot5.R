#setting the working directory
setwd("C:/Users/sowja/Desktop/Data Science/Data_For_peer_Assessment")

#Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset the SCC with vehicle values
vehicleMatches  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[vehicleMatches, ]

# merge the dataframes
NEISCC <- merge(baltimore, subsetSCC, by="SCC")

# sum the emission data per year per type
totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)
colors <- c("red", "green", "blue","yellow")

# plotting
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", main = "Total Emission from motor sources in Baltimore", col = colors)