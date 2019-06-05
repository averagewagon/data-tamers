# Load libraries
library("dplyr")
library("ggplot2")
library("stringr")

# Read in summary table
divergingMap <- function(df,state) {
  
  # Create new column to color the vaules
  df$Spending <- ifelse(df$Total.Revenue < df$Total.Expenditures,
                        "debt", "surplus")
  
  # Create new column to show amounts of surplus or debt
  df$Spending_Amount <- df$Total.Revenue - df$Total.Expenditures
  
  # use stringr to make each state have matching cases
  df$State.Name <- str_to_title(df[ ,"State.Name"])
 
  # create new dataframe with only the state of interest 
  df2 <- df %>% 
    filter(State.Name == state)
  
  # Create Diverging Barchart 
  ggplot(df2, aes(x = Year, y = Spending_Amount, label = Spending)) +
    geom_bar(stat = "identity", aes(fill = Spending), width = .5)  +
    scale_fill_manual(name = "Yearly School Spending",
                      labels = c("Debt", "Surplus"),
                      values = c("surplus" = "#00ba38", "debt" = "#f8766d")) +
    labs(title = "Educationl Spending By State", y = "Spending Amount") +
    coord_flip()
}
df <- read.csv("aggregate.csv", stringsAsFactors = F)
divergingMap(df, "Florida")
