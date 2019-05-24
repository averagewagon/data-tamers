# General setup
library("dplyr")
library("ggplot2")

aggregated <- read.csv("../data/funding/prepped/aggregate.csv", stringsAsFactors = FALSE)

yearly <- aggregated %>% 
  group_by(Year) %>% 
  summarise("Students" = sum(Students),
            "Total Revenue" = sum(Total.Revenue),
            "Federal Revenue" = sum(Federal.Revenue),
            "State Revenue" = sum(State.Revenue),
            "Local Revenue" = sum(Local.Revenue),
            "Total Expenditures" = sum(Total.Expenditures),
            "Salaries" = sum(Salaries),
            "Teacher Revenue" = sum(Teacher.Revenue))