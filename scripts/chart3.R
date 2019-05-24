# Load libraries
library("dplyr")
library("ggplot2")
source("summaryTable.R")

# Read in summary table
divergingMap <- function(df) {
  # Create new column to color the vaules
  df$Spending <- ifelse(df$"Total Revenue" < df$"Total Expenditures",
                        "debt","surplus")
  # Create new column to show amounts of surplus or debt
  df$Spending_Amount <- df$'Total Revenue' - df$'Total Expenditures'
  # Diverging Barcharts
  ggplot(df, aes(x = Year, y = Spending_Amount, label = Spending)) + 
    geom_bar(stat='identity', aes(fill=Spending), width=.5)  +
    scale_fill_manual(name="Yearly School Spending", 
                      labels = c("Debt", "Surplus"), 
                      values = c("surplus"="#00ba38", "debt"="#f8766d")) + 
    labs(title= "Total U.S. Education Spending") + 
    coord_flip()
}
