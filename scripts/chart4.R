# Line plot for each revenue medium

# General setup
library("dplyr")
library("ggplot2")
library("utils")

#function to generate total revenue bar chart
generateTrends <- function(file_path) {
  midpoint <- read.csv(file_path, stringsAsFactors = FALSE)
  #manipulate data and group by year
  midpoint <- midpoint %>%
    group_by(Year) %>%
    summarize(
      Federal.Revenue = sum(Federal.Revenue),
      State.Revenue = sum(State.Revenue),
      Local.Revenue = sum(Local.Revenue)
    )
  #create scatter plot 
   ggplot() +
    geom_point(data = midpoint, aes(x = Year, y = Federal.Revenue / 1000),
               color = "blue") +
    geom_point(data = midpoint, aes(x = Year, y = State.Revenue / 1000),
               color = "red") +
    geom_point(data = midpoint, aes(x = Year, y = Local.Revenue / 1000),
               color = "green") +
    #labels for plot
     labs(
      title = "Funding Over Time",
      x = "Years",
      y = "Revenue ($K)"
    )
}
