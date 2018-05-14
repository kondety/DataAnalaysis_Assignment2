#setting the working directory
setwd("C:/Users/sowja/Desktop/Data Science/Data_For_peer_Assessment")

#Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#subsetting the data
baltimore <- subset(NEI, fips == "24510")

# summing emissions per year
totalEmissions <- tapply(baltimore$Emissions, baltimore$year, sum)
colors <- c("red", "green", "blue","yellow")

# plotting
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", main = "Total Emission per year in Baltimore", col = colors)