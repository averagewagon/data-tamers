# General setup
library("dplyr")
library("ggplot2")



#function to generate total revenue bar chart
generateTotalFunding <- function(file_path) {
  
  #read in aggregate csv
  midpoint <- read.csv(file_path, stringsAsFactors = FALSE)
  #manipulate data and group by year
  midpoint <- midpoint %>%
    group_by(Year) %>%
    #Summarize revenue column to get total revenue per year
    summarize(Total.Revenue = sum(Total.Revenue))
   #create bar chart to visualize the data
   ggplot() +
    geom_col(data = midpoint, aes(x = Year, y = Total.Revenue / 1000)) +
    labs(
      title = "USA Education Funding Over Time",
      x = "Year",
      y = "Total Revenue ($K)"
    )
}
