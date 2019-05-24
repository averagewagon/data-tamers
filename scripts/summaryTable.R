# General setup
library("dplyr")
library("ggplot2")
midpoint <- read.csv("data/midpoint.csv", stringsAsFactors = F)

# Create aggregate table
averages_per_year <- midpoint$prepFile %>%
  group_by(year) %>%
  summarize("Students" = ave([[Students]]),
            "Total Revenue" = ave([[Total Revenue]], na.rm = T),
            "Federal Revenue" = ave([[Federal Revenue]], na.rm = T),
            "State Revenue" = ave([[State Revenue]], na.rm = T),
            "Local Revenue" = ave([[Local Revenue]], na.rm = T),
            "Total Expenses" = ave([[Total Expenses]], na.rm = T),
            "Salaries" = ave([[Salaries]], na.rm = T),
            "Teacher Revenue" = ave([[Teacher Revenue]], na.rm = T),
            "Debt" = [[Total Expenses]] - [[Total Revenue]], na.rm = T
  )