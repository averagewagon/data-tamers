# General setup
library("dplyr")
library("ggplot2")

yearly <- function(file_path) {
  aggregated <- read.csv(file_path, stringsAsFactors = FALSE) %>%
  group_by(Year) %>%
  summarise("Students" = sum(Students),
            "Total Revenue" = sum(Total.Revenue),
            "Federal Revenue" = sum(Federal.Revenue),
            "State Revenue" = sum(State.Revenue),
            "Local Revenue" = sum(Local.Revenue),
            "Total Expenditures" = sum(Total.Expenditures),
            "Salaries" = sum(Salaries),
            "Teacher Revenue" = sum(Teacher.Revenue))
}