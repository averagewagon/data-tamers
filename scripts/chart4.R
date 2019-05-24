# Line plot for each revenue medium

# General setup
library("dplyr")
library("ggplot2")

generateTrends <- function(filePath) {
  midpoint <- read.csv(filePath, stringsAsFactors = FALSE)
  
  ggplot() + 
    geom_line(data = midpoint, aes(x = Year, y = "Total Federal Revenue"), color = "blue") +
    geom_line(data = midpoint, aes(x = Year, y = "Total State Revenue"), color = "red") +
    geom_line(data = midpoint, aes(x = Year, y = "Total Local Revenue"), color = "green") +
    xlab('Years') +
    ylab('Revenue From Sources')
}