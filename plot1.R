# setting the working directory
setwd("C:/Users/sowja/Desktop/Data Science/Data_For_peer_Assessment")

#Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Emission data per year
totalEmissions <- tapply(NEI$Emissions, NEI$year, sum)
colors <- c("red", "green", "blue","yellow")

#plotting
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission(ton)", main = "Total Emission per year", col = colors)