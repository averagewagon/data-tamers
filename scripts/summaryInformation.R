# General setup
library("dplyr")
library("ggplot2")

# Summary information

get_funding_summary_info <- function(df) {
 funding_sum <- list(
   num_years = nrow(df),
   total_revenue = sum(df$"Total Revenue"),
   federal_cont = 100 * sum(df$"Federal Revenue") /sum(df$"Total Revenue"),
   state_cont = 100 * sum(df$"State Revenue") /sum(df$"Total Revenue"),
   local_cont = 100 * sum(df$"Local Revenue") /sum(df$"Total Revenue"),
   average_salaries = formatC(mean(df$Salaries) / 51, format="d", big.mark=",")
  )
}


  