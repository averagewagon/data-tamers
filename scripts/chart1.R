# General setup
library("dplyr")
library("ggplot2")


generateTotalFunding <- function(filePath) {
  #setwd(getSrcDirectory()[1]) # Works when sourcing this file
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # Works when ran inside of this file
  midpoint <- read.csv(filePath, stringsAsFactors = FALSE)
  midpoint <- midpoint %>%
    group_by(Year) %>%
    summarize(Total.Revenue = sum(Total.Revenue))
  ggplot() + 
    geom_col(data = midpoint, aes(x = Year, y = Total.Revenue / 1000)) +
    xlab('Years') +
    ylab('Total Revenue (thousands)')
}
