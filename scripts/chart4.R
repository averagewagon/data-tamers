# Line plot for each revenue medium

# General setup
library("dplyr")
library("ggplot2")
library("utils")

generateTrends <- function(file_path) {
  #setwd(getSrcDirectory()[1]) # Works when sourcing this file
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # Works when ran inside of this file
  midpoint <- read.csv(file_path, stringsAsFactors = FALSE)
  midpoint <- midpoint %>%
    group_by(Year) %>%
    summarize(
      Federal.Revenue = sum(Federal.Revenue),
      State.Revenue = sum(State.Revenue),
      Local.Revenue = sum(Local.Revenue)
    )
  ggplot() +
    geom_point(data = midpoint, aes(x = Year, y = Federal.Revenue / 1000),
               color = "blue") +
    geom_point(data = midpoint, aes(x = Year, y = State.Revenue / 1000),
               color = "red") +
    geom_point(data = midpoint, aes(x = Year, y = Local.Revenue / 1000),
               color = "green") +
    xlab("Years") +
    ylab("Revenue From Sources (thousands)")
}
