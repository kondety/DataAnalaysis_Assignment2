#setting the working directory
setwd("C:/Users/sowja/Desktop/Data Science/Data_For_peer_Assessment")

library(ggplot2)

#sum the emission data perr year per type
data <- aggregate(Emissions~year+type, baltimore, sum)

#plotting the data

g <- ggplot(data, aes(year, Emissions, color = type))
g+geom_line()+xlab("Year")+ylab(expression("Total PM"[2.5]*"Emissions"))+ ggtitle("Total Emissions per type in Baltimore")
